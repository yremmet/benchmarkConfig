package de.evoila.benchmarking.controller;

import com.fasterxml.jackson.annotation.JsonIgnore;


import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  22/12/2016.
 */


public class BarGraphView {

    private String[] labels = new String[5];
    @JsonIgnore
    private HashMap<String, Double[]> dings = new HashMap<>();

    BarGraphView(){
    }


    @JsonIgnore
    public void setLabel(int i, String label) {
        this.labels[i] = label;
    }

    public void add(int index, String series, double data){
        if(!this.dings.containsKey(series))
            this.dings.put(series, new Double[5]);
        this.dings.get(series)[index] = data;
    }


    public java.util.List<String> getSeries() {
        return dings.keySet().stream().collect(Collectors.toList());
    }

    public Collection getData() {
        List l = this.dings.values().stream().collect(Collectors.toList());
        //l.removeAll(Collections.singleton(null));
        return l;
    }

    public java.util.List<String> getLabels() {
        List l =  Arrays.asList(labels);
        //l.removeAll(Collections.singleton(null));
        return l;
    }

    @JsonIgnore
    public boolean isEmpty() {
        return this.getSeries().isEmpty();
    }
}
