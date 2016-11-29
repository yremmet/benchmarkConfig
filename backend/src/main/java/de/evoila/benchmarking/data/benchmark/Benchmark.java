package de.evoila.benchmarking.data.benchmark;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;

import javax.persistence.*;
import java.util.List;

/**
 * Created by enat on 28/10/16.
 */
@Entity
@Table(name = "Benchmark")
public class Benchmark {

    public void setBenchmarkId(Long benchmarkId) {
        this.benchmarkId = benchmarkId;
    }

    public Long getBenchmarkId() {
        return benchmarkId;
    }

    @Id
    @GeneratedValue
    private  Long benchmarkId;

    @Column(name="benchmarkName", nullable=false)
    private String benchmarkName;

    //@JsonManagedReference
    @OneToMany(mappedBy = "benchmark")
    private List<VMGroup> vmGroups;


    @JsonManagedReference
    @OneToMany(mappedBy = "benchmark")
    List<Flag> flags;

    @OneToMany(mappedBy = "benchmark")
    List<BenchmarkConfig> configs;

    public String getName() {
        return benchmarkName;
    }

    public void setName(String name) {
        this.benchmarkName = name;
    }

    public List<BenchmarkConfig> getConfigs() {
        return configs;
    }

    public void setConfigs(List<BenchmarkConfig> configs) {
        this.configs = configs;
    }
}

