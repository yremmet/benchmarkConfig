package de.evoila.benchmarking.data.runner;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;
import org.joda.time.DateTime;


import javax.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  25/11/2016.
 */
@Entity
@Table(name ="BenchmarkSchedule")
public class BenchmarkSchedule {

    @Id
    @GeneratedValue
    private Long id;

    private Long frequency;

    @Enumerated(EnumType.STRING)
    private FrequencyType frequencyType;

    @ManyToOne()
    @JoinColumn(name="fk_benchmarkConfig_id")
    private BenchmarkConfig config;

    @ManyToOne()
    @JoinColumn(name="fk_Run_id")
    @JsonManagedReference
    private Run lastRun;

    @ManyToOne()
    @JoinColumn(name="fk_runner_id")
    private Runner runner;


    @Column(name="lastStart")
    private Timestamp lastStartTime;
    private boolean active;

    public Long getId() {
        return id;
    }

    public FrequencyType getFrequencyType() {
        return frequencyType;
    }

    public void setFrequencyType(FrequencyType frequencyType) {
        this.frequencyType = frequencyType;
    }

    public Long getFrequency() {
        return frequency;
    }

    public void setFrequency(long frequency) {
        this.frequency = frequency;
    }

    public BenchmarkConfig getConfig() {
        return config;
    }

    public void setConfig(BenchmarkConfig config) {
        this.config = config;
    }

    public Run getLastRun() {
        return lastRun;
    }

    public void setLastRun(Run lastRun) {
        this.lastRun = lastRun;
    }

    public Runner getRunner() {
        return runner;
    }

    public void setRunner(Runner runner) {
        this.runner = runner;
    }

    public Timestamp getLastStartTime() {
        return lastStartTime;
    }

    @JsonIgnore
    public DateTime getLastStartTimeAsDateTime(){
        return new DateTime(lastStartTime.getTime());
    }

    public void setLastStartTime(Timestamp lastStartTime) {
        this.lastStartTime = lastStartTime;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    enum FrequencyType{
        ONCE, MINUTES, WEEKLY, MONTHLY
    }

    enum Weekday{
        MONDAY(1), THUESDAY(2), WEDNESDAY(3), THURSDAY(4), FRIDAY(5), SATURDAY(6), SUNDAY(7);

        private final int value;

        Weekday(int i) {
            value = i;
        }

        public int getValue() {
            return value;
        }
    }

    public void setWeekday(Weekday day){
        this.setFrequency(day.getValue());
    }

    public boolean setDayOfMonth(int day){
        setFrequency(day);
        if(day < 0 || day > 31)
            return false;
        return true;
    }

    public boolean isDue(){
        if (!isActive()){
            return false;
        }
        DateTime lastStartTime = getLastStartTimeAsDateTime();
        DateTime now = DateTime.now();
        switch (frequencyType){
            case ONCE:
                if(lastStartTime == null){
                    return true;
                } else {
                    setActive(false);
                    return false;
                }
            case MINUTES:
                if((now.getMillis() - lastStartTime.getMillis())/60000 > getFrequency() )
                    return true;
                return false;
            case MONTHLY:
                if(now.getDayOfMonth() != lastStartTime.getDayOfMonth() && now.getDayOfMonth() == getFrequency())
                    return true;
                return false;
            case WEEKLY:
                if(now.getDayOfMonth() != lastStartTime.getDayOfMonth() && now.getDayOfWeek() == getFrequency())
                    return true;
                return false;
        }
        return false;
    }
}
