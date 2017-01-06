package de.evoila.benchmarking.controller;


import java.util.*;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  21/11/2016.
 */
public class ResultCollection extends HashMap<String, ValueCollection> implements Iterable<ValueCollection>{
    private final String name;

    public ResultCollection(String name) {
        super();
        this.name = name;
    }



    public String getName() {
        return name;
    }

    public boolean addValue(String metric, long run ,double value, long timestamp){
        if(!containsKey(metric))
            put(metric, new ValueCollection());
        return get(metric).add(value, timestamp, run);
    }

    public List<Double> getValues(String metric){
        return get(metric).getData();
    }


    @Override
     public Iterator<ValueCollection> iterator() {
        return new Iterator<ValueCollection>() {
            public Iterator<String> iterator = keySet().iterator();

            @Override
            public boolean hasNext() {
                return iterator.hasNext();
            }

            @Override
            public ValueCollection next() {
                return get(iterator.next());
            }
        };
    }

    public void calculate() {
        this.values().parallelStream().forEach(v -> v.calculate());
    }
}
