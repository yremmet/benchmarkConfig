package de.evoila.benchmarking.data.runConfiguration;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import de.evoila.benchmarking.data.benchmark.Benchmark;
import de.evoila.benchmarking.data.runner.Run;

import javax.persistence.*;
import java.util.List;

/**
 * Created by enat on 02/11/2016.
 */
@Entity
@Table(name = "BenchmarkConfig")
public class BenchmarkConfig {
    @Id
    @GeneratedValue
    private Long   id;
    //private String description;
    private String name;

    @JsonManagedReference
    @ManyToOne
    @JoinColumn(name = "fk_benchmark_id")
    private Benchmark benchmark;

    @JsonBackReference
    @OneToMany(mappedBy = "benchmarkConfig")
    List<FlagValue> flagValues;

    @JsonBackReference
    @OneToMany(mappedBy = "benchmarkConfig")
    List<VmGroupConfig> vmGroupConfigs;

    @OneToMany(mappedBy = "benchmarkConfig")
    List<Run> runs;

    @JoinTable(name= "ConfigHasRunFlag",
            joinColumns = {
                    @JoinColumn(name = "fk_benchmarkConfig_id", referencedColumnName = "id")
            },
            inverseJoinColumns = {
                    @JoinColumn(name = "fk_runFlag_id", referencedColumnName = "id")
            }
    )
    @ManyToMany()
    List<RunFlag> runFlags;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<VmGroupConfig> getVmGroupConfigs() {
        return vmGroupConfigs;
    }

    public List<FlagValue> getFlagValues() {
        return flagValues;
    }

    public void setFlagValues(List<FlagValue> flagValues) {
        this.flagValues = flagValues;
    }

    public void setVmGroupConfigs(List<VmGroupConfig> vmGroupConfigs) {
        this.vmGroupConfigs = vmGroupConfigs;
    }

    public List<Run> getRuns() {
        return runs;
    }

    /*public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }*/

    public Benchmark getBenchmark() {
        return benchmark;
    }

    public void setBenchmark(Benchmark benchmark) {
        this.benchmark = benchmark;
    }

    public List<RunFlag> getRunFlags() {
        return runFlags;
    }

}
