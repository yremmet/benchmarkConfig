package de.evoila.benchmarking.controller;

import com.amazonaws.util.json.JSONObject;
import de.evoila.benchmarking.data.benchmark.Benchmark;
import de.evoila.benchmarking.data.benchmark.repositories.BenchmarkRepository;
import de.evoila.benchmarking.data.runner.Result;
import de.evoila.benchmarking.data.runner.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collection;
import java.util.HashMap;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  21/11/2016.
 */
@Controller
@RequestMapping("/data")
public class Statistics {

    @Autowired
    ResultRepository resultRepository;
    @Autowired
    BenchmarkRepository benchmarkRepository;

    @RequestMapping(path="/test/{test}")
    public ResponseEntity<Object> getTestData(@PathVariable String test){
        Benchmark benchmark = benchmarkRepository.findOneByBenchmarkName(test);
        HashMap<String, ResultCollection> runData = null;
        if(benchmark != null) {
            runData =  getRunData(benchmark);
            runData.forEach((name, results) -> {
                results.calculate();
            });
        }
        return  new ResponseEntity<Object>(runData, HttpStatus.OK);

    }

    private HashMap<String, ResultCollection> getRunData(Benchmark benchmark) {
        if(benchmark != null) {
            final HashMap<String, ResultCollection> results = new HashMap<>();
            benchmark.getConfigs()
                    .stream()
                    .forEach(bconfig ->
                    {
                        ResultCollection resultCollection = null;
                        if(results.containsKey(bconfig.getName())) {
                            resultCollection = results.get(bconfig.getName());
                        }else {
                            resultCollection = new ResultCollection(bconfig.getName());
                            results.put(bconfig.getName(), resultCollection);
                        }
                        final ResultCollection finalResultCollection = resultCollection;
                        bconfig.getRuns()
                                .stream()
                                .filter(run -> run.getState().equals("Finished"))
                                .forEach(run1 -> {
                                    if (run1 != null) {
                                        Collection<Result> tmp = resultRepository.findByRunId(run1.getId());

                                        tmp.forEach(result -> {
                                            finalResultCollection.addValue(result.getMetric(),run1.getId(), result.getValue(), result.getTimestamp());
                                        });
                                    }
                                });

                    });
            return results;
        }
        return null;
    }

    @RequestMapping(path="/run")
    public ResponseEntity<Object> getTestData(@RequestBody JSONObject runs){
        return  new ResponseEntity<Object>(String.format("Will start %s on Runner ", runs), HttpStatus.OK);
    }
}
