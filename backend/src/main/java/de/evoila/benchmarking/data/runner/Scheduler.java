package de.evoila.benchmarking.data.runner;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import de.evoila.benchmarking.benchmark.parser.BenchmarkConfigSerializer;
import de.evoila.benchmarking.benchmark.runner.AmqpMessage;
import de.evoila.benchmarking.benchmark.runner.RunnerConector;
import de.evoila.benchmarking.controller.BenchmarkRunController;
import de.evoila.benchmarking.data.benchmark.Benchmark;
import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;
import de.evoila.benchmarking.data.runConfiguration.RunFlag;
import de.evoila.benchmarking.data.runConfiguration.repositories.BenchmarkConfigRepository;
import org.joda.time.DateTime;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  25/11/2016.
 */
@Component
public class Scheduler {

    @Autowired
    BenchmarkScheduleRepository repository;
    @Autowired
    BenchmarkRunController runController;
    @Autowired
    BenchmarkConfigRepository benchmarkConfigRepository;
    @Autowired
    RunnerRepository runnerRepository;
    @Autowired
    RunnerConector runnerConnetor;
    @Autowired
    RunRepository runRepository;
    @Autowired
    private RabbitTemplate template;

    @Scheduled(fixedRate = 5*60*1000)
    private void benchmarSchedule(){

        System.out.println("Schedule!!");
        final DateTime now = DateTime.now();
        repository.findByActive(true).forEach(schedule-> {
            if(schedule.getLastStartTime() != null) {
                if (schedule.isDue()){
                    if(schedule.getLastRun() == null ||
                            schedule.getLastRun().getState().equals(Run.FINISHED) ||
                            schedule.getLastRun().getState().equals(Run.FAILED) ){
                        System.out.println("Running " + schedule.getConfig().getName());
                        run(schedule);
                    }
                }
            } else {
                run(schedule);
            }

        });
    }


    private void run(BenchmarkSchedule schedule) {
        BenchmarkConfig config = benchmarkConfigRepository.getOne(schedule.getConfig().getId());
        Runner runner = schedule.getRunner();

        Run newRun= getRun(config, runner);
        newRun.setState("Queued");
        runRepository.saveAndFlush(newRun);

        AmqpMessage msg = new AmqpMessage(newRun.getId(), getConfigFileName(config), BenchmarkConfigSerializer.serialize(config),getFlagString(config.getRunFlags()));
        ObjectMapper mapper = new ObjectMapper();

        schedule.setLastRun(newRun);
        schedule.setLastStartTime(new Timestamp(System.currentTimeMillis()));
        repository.save(schedule);

        try {
            template.convertAndSend("amq.topic",runner.getQueue(), mapper.writeValueAsString(msg));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    private Run getRun(BenchmarkConfig config, Runner runner) {
        Run newRun = new Run();
        newRun.setBenchmarkConfig(config);
        newRun.setRunner(runner);
        return newRun;
    }

    private String getFlagString(List<RunFlag> runFlags) {
        StringBuilder builder = new StringBuilder();
        for (RunFlag flag: runFlags) {
            builder.append(" --");
            builder.append(flag.getFlag());
        }
        return builder.toString();
    }

    private String getConfigFileName(BenchmarkConfig config) {
        return String.valueOf(config.getName()+".yaml");
    }

}
