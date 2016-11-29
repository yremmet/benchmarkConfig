package de.evoila.benchmarking;

import de.evoila.benchmarking.benchmark.parser.PerfKitParser;
import de.evoila.benchmarking.benchmark.runner.RunnerConector;
import de.evoila.benchmarking.data.runner.RunnerRepository;
import de.evoila.benchmarking.data.runner.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * Created by enat on 31/10/2016.
 */

@Component
public class StartupEventHandler implements ApplicationListener<ContextRefreshedEvent> {
    @Autowired
    PerfKitParser perfKitParser;
    @Autowired
    RunnerConector runnerConnetor;
    @Autowired
    RunnerRepository runnerRepository;
    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        perfKitParser.parseConfigs();

    }
}
