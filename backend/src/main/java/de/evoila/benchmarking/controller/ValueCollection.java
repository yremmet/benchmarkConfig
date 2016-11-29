package de.evoila.benchmarking.controller;


import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Stream;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  21/11/2016.
 */
public class ValueCollection {
    private boolean calculationsCorrect = false;

    private double average;
    private double min;
    private double max;
    private double stdDeviation;
    private final ArrayList<Double> values = new ArrayList();
    private final ArrayList<Long> timestamps = new ArrayList();
    private final ArrayList<Long> runids = new ArrayList();

    public List<Double> getData(){
        return Collections.unmodifiableList(values);
    }
    public List<Long> getTimestamps(){
        return Collections.unmodifiableList(timestamps);
    }

    public double getAverage() {
        if(!calculationsCorrect)
            calculate();
        return average;
    }



    public double getMin() {
        if(!calculationsCorrect)
            calculate();
        return min;
    }

    public double getMax() {
        if(!calculationsCorrect)
            calculate();
        return max;
    }

    public double getStdDeviation() {
        if(!calculationsCorrect)
            calculate();
        return stdDeviation;
    }

    public List<Long> getRuns(){
        return Collections.unmodifiableList(this.runids);
    }

    public boolean add(double value, long timestamp, long runid){
        calculationsCorrect = false;
        this.timestamps.add(timestamp);
        this.runids.add(runid);
        return this. values.add(value);
    }

    public double get(int i ){
        return values.get(i);
    }



    public void calculate() {
        if(values.size() > 0) {
            double sum = 0;
            double s2 = 0;
            min = get(0);
            for (double value : values) {
                sum += value;
                max = (max > value) ? max : value;
                min = (min < value) ? min : value;
            }
            average = sum / values.size();
            for (double value : values) {
                s2 += Math.pow((value - average), 2);
            }
            stdDeviation = s2 / values.size();
            calculationsCorrect = true;
        }
    }


}
