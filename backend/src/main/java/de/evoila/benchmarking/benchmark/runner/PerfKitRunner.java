package de.evoila.benchmarking.benchmark.runner;

import de.evoila.benchmarking.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 * Created by enat on 02/11/2016.
 */
@Component
public class PerfKitRunner {

    List<Process> processes;

    @Autowired
    Configuration configuration;

    public PerfKitRunner(){
        this.processes = new Vector<>();
    }

    public void run(String pathToConfig, String... globalFlags){
        String[] flags = new String[globalFlags.length+2];
        flags[0] = this.getPerfKitPath();
        flags[1] = "--benchmark_config_file="+pathToConfig;

        for (int i = 0; i< globalFlags.length; i++){
            flags[i+2]= globalFlags[i];
        }

        try {
            System.out.println("Starting Process ");
            Process newRun = new ProcessBuilder(flags).start();
            System.out.println("Running :" + newRun.isAlive());
            processes.add(newRun);
            try {
                BufferedWriter bw = new BufferedWriter(new FileWriter("tmp.log"));
                BufferedReader br = new BufferedReader(new InputStreamReader(newRun.getErrorStream()));
                String line;
                while ((line = br.readLine()) != null) {
                    bw.write(line);
                    System.out.println(line);

                    bw.flush();
                }
                bw.flush();
                bw.close();
                br.close();
                System.out.println("Reading ended ");
            } catch (IOException e) {
                e.printStackTrace();
            }

            System.out.println("Running :" + newRun.isAlive());
            while (newRun.isAlive()){
                System.out.println("Running :" + newRun.isAlive());
                Thread.sleep(1000);
            }
            System.out.println("Running :" + newRun.isAlive());

        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }

    @Scheduled(fixedRate = 10000)
    private void checkForFinishedRuns(){
        /*processes
                .stream()
                .parallel()
                .filter(process -> !process.isAlive())
                .forEach(process -> collectResults(process));*/
    }

    private void collectResults(Process process) {
        //processes.remove(process);
    }


    public String getPerfKitPath() {
        return configuration.getPerformanceKitPath()+"/pkb.py";
    }
}
