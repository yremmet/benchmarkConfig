package de.evoila.benchmarking.data.runConfiguration;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import de.evoila.benchmarking.data.benchmark.Flag;

import javax.persistence.*;

/**
 * Created by enat on 02/11/2016.
 */

@Entity
@Table(name = "FlagValue")
public class FlagValue {
    @Id
    @GeneratedValue
    private Long    id;
    private String  value;

    @JsonManagedReference
    @ManyToOne()
    @JoinColumn(name="fk_benchmarkConfig_id")
    BenchmarkConfig benchmarkConfig;

    @JsonManagedReference
    @ManyToOne()
    @JoinColumn(name="fk_flag_id")
    Flag flag;

    public Long getId() {
        return id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public BenchmarkConfig getBenchmarkConfig() {
        return benchmarkConfig;
    }

    public void setBenchmarkConfig(BenchmarkConfig benchmarkConfig) {
        this.benchmarkConfig = benchmarkConfig;
    }

    public Flag getFlag() {
        return flag;
    }

    public void setFlag(Flag flag) {
        this.flag = flag;
    }
}

