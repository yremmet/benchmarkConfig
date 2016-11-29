package de.evoila.benchmarking.data.runner;

import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;

import javax.persistence.*;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  11/11/2016.
 */

@Entity
@Table(name = "Run")
public class Run {
    public static final String FINISHED = "Finished";
    public static final String FAILED = "Failed";
    @Id
    @GeneratedValue
    private Long id;
    private int pid;
    private String state;

    @ManyToOne()
    @JoinColumn(name="fk_configId")
    private BenchmarkConfig benchmarkConfig;

    @ManyToOne()
    @JoinColumn(name="fk_runnerId")
    private Runner runner;

    public Long getId() {
        return id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public BenchmarkConfig getBenchmarkConfig() {
        return benchmarkConfig;
    }

    public void setBenchmarkConfig(BenchmarkConfig benchmarkConfig) {
        this.benchmarkConfig = benchmarkConfig;
    }

    public Runner getRunner() {
        return runner;
    }

    public void setRunner(Runner runner) {
        this.runner = runner;
    }
}
