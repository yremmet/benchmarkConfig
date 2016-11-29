package de.evoila.benchmarking.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import de.evoila.benchmarking.benchmark.parser.BenchmarkConfigSerializer;
import de.evoila.benchmarking.benchmark.runner.AmqpMessage;
import de.evoila.benchmarking.benchmark.runner.RunnerConector;
import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;
import de.evoila.benchmarking.data.runConfiguration.RunFlag;
import de.evoila.benchmarking.data.runConfiguration.VmGroupConfig;
import de.evoila.benchmarking.data.runConfiguration.repositories.BenchmarkConfigRepository;
import de.evoila.benchmarking.data.runConfiguration.repositories.VmGroupConfigRepository;
import de.evoila.benchmarking.data.runner.Run;
import de.evoila.benchmarking.data.runner.RunRepository;
import de.evoila.benchmarking.data.runner.Runner;
import de.evoila.benchmarking.data.runner.RunnerRepository;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.amqp.core.Queue;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

/**
 * Created by enat on 08/11/2016.
 */

@RestController
@RequestMapping("run")
public class BenchmarkRunController {

    @Autowired
    BenchmarkConfigRepository benchmarkConfigRepository;
    @Autowired
    RunnerRepository runnerRepository;
    @Autowired
    RunnerConector runnerConnetor;
    @Autowired
    RunRepository runRepository;
    @Autowired
    VmGroupConfigRepository vmGroupConfigRepository;
    @Autowired
    private RabbitTemplate template;


    @RequestMapping(path="runner/{runnerId}/config/{configurationId}")
    public ResponseEntity<Object> runOnRunner(@PathVariable Long runnerId, @PathVariable Long configurationId) throws JsonProcessingException {
        BenchmarkConfig config = benchmarkConfigRepository.findOne(configurationId);
        Runner runner = runnerRepository.findOne(runnerId);

        Run newRun= getRun(config, runner);
        newRun.setState("Queued");
        runRepository.saveAndFlush(newRun);

        AmqpMessage msg = new AmqpMessage(newRun.getId(), getConfigFileName(config),BenchmarkConfigSerializer.serialize(config),getFlagString(config.getRunFlags()));
        ObjectMapper mapper = new ObjectMapper();

        template.convertAndSend("amq.topic",runner.getQueue(), mapper.writeValueAsString(msg));
        return  new ResponseEntity<Object>(String.format("Will start %s on Runner ", config.getName()), HttpStatus.OK);
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

    private Run getRun(BenchmarkConfig config, Runner runner) {
        Run newRun = new Run();
        newRun.setBenchmarkConfig(config);
        newRun.setRunner(runner);
        return newRun;
    }
}
