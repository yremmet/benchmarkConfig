package de.evoila.benchmarking.benchmark.runner;

import com.fasterxml.jackson.databind.ObjectMapper;
import de.evoila.benchmarking.data.runner.Run;
import de.evoila.benchmarking.data.runner.RunRepository;
import de.evoila.benchmarking.data.runner.RunnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.concurrent.CountDownLatch;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 * created:  16/11/2016.
 */

@Component
public class Messaging {

    @Autowired
    RunRepository runRepository;
    @Autowired
    RunnerRepository runnerRepository;


    public void handleMessage(byte[] message) {
        handleMessage(new String(message));
    }

    public void handleMessage(String message){
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            handleMessage(objectMapper.readValue(message, ResponseMessage.class));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void handleMessage(@Payload ResponseMessage message) {
        runnerRepository.findOne(message.getRunnerid());

        Run run = runRepository.findOne(message.getRunId());
        run.setState(message.status);
        runRepository.save(run);
    }



}
