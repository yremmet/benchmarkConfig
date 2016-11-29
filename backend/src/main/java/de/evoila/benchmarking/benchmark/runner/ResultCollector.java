package de.evoila.benchmarking.benchmark.runner;

import de.evoila.benchmarking.data.runner.Run;
import de.evoila.benchmarking.data.runner.RunRepository;
import de.evoila.benchmarking.data.runner.Runner;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  11/11/2016.
 */
@Component
public class ResultCollector {

    private static final Logger log = Logger.getLogger(ResultCollector.class);

    @Autowired
    RunRepository runRepository;
    @Autowired
    RunnerConector runnerConector;

    @Scheduled(fixedRate = 300000)
    private void checkRuns(){
        List<Run> runs = runRepository.findRunsByState("RUNNING");
        runs.stream().parallel().forEach(run -> {
            if(isFinnised(run))
                collectResults();;
        });
    }

    private boolean isFinnised(Run run) {
        Runner runner = run.getRunner();
        if(!runner.isConnected()){
            runnerConector.connect(runner);
        }

        return false;
    }

    private void collectResults() {
    }
}
