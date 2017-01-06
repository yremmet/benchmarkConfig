package de.evoila.benchmarking.controller;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.util.Hash;
import com.mongodb.util.JSON;
import de.evoila.benchmarking.data.runConfiguration.repositories.BenchmarkConfigRepository;
import de.evoila.benchmarking.data.runner.Result;
import de.evoila.benchmarking.data.runner.ResultRepository;
import de.evoila.benchmarking.data.runner.Run;
import de.evoila.benchmarking.data.runner.RunRepository;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import java.util.function.BiConsumer;
import java.util.function.Supplier;
import java.util.function.ToDoubleFunction;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  21/12/2016.
 */

@RestController
@RequestMapping("graph")
public class GraphController {

    @Autowired
    ResultRepository resultRepository;
    @Autowired
    MongoTemplate mongoTemplate;
    @Autowired
    RunRepository runRepository;
    @Autowired
    BenchmarkConfigRepository benchmarkConfigRepository;

    @RequestMapping(path="/listofruns")
    public Object listOfRuns(){
        List<Run> runs = runRepository.findRunsByState(Run.FINISHED);
        List r = runs.stream().map(run -> {
            return new ImmutablePair(run.getId(), run.getBenchmarkConfig().getBenchmark().getName());
        }).collect(Collectors.toList());
        return r;
    }


    @RequestMapping(path="/compare")
    public Object compare(@RequestBody List<Long> runIds){

        List<ImmutablePair> l = runIds.stream().parallel().map(runId -> {
            Map b = resultRepository.findByRunId(runId)
                    .stream().map(r -> new ImmutablePair<String,Double>(r.getMetric(), r.getValue()))
                    .collect(Collectors.groupingBy(ImmutablePair::getLeft, Collectors.averagingDouble(ImmutablePair::getRight)));


            return new ImmutablePair(runId, b);
        }).collect(Collectors.toList());

        l.sort(new Comparator<ImmutablePair>() {
            @Override
            public int compare(ImmutablePair o1, ImmutablePair o2) {
                return 0;
            }
        });

        List series = l.stream().map(p -> p.getLeft()).collect(Collectors.toList());
        List label = l.stream().parallel().map(p -> {
            Map<String,Double> map = (Map<String, Double>) p.getRight();
            return map.keySet();
        }).collect(LinkedList::new, List::addAll, List::addAll).stream().distinct().collect(Collectors.toList());
        List data = l.stream().parallel().map(p -> {
            Map<String,Double> map = (Map<String, Double>) p.getRight();
            return map.values();
        }).collect(Collectors.toList());

        HashMap returnValue = new HashMap();
        returnValue.put("series", series);
        returnValue.put("labels", label);
        returnValue.put("data", data);
        List t = new LinkedList();
        t.add(returnValue);
        return t;
    }



    private Double mapResults(String metric, Long runId) {

        List<Result> results = resultRepository.findByRunIdAndMetric(runId,metric);
        Double value = null;
        switch (results.size()) {
            case 0:
                break;
            case 1:
                value = results.get(0).getValue();
            default:
                value = results.stream().mapToDouble(r -> r.getValue()).average().getAsDouble();

        }
        return value;
    }

    private void addAll(List<Result> results, List<String> label, int i, Number[] data) {
        double value = results.stream().mapToDouble(r -> r.getValue()).average().getAsDouble();
        data[i] = value;
    }

    private void add(Result result, List<String> label, int i, Number[] data) {
        data[i] = result.getValue();
    }


}
