package de.evoila.benchmarking.data.benchmark;

import javax.persistence.*;

/**
 * Created by enat on 28/10/16.
 */
@Entity
@Table(name = "Flag")
public class Flag {

    @Id
    @GeneratedValue
    private   Long id;
    private String name;
    private String description;
    private String defaultValue;
    private String otherData;
    private String type;

    @ManyToOne()
    @JoinColumn(name = "benchmarkId")
    private Benchmark benchmark;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public String getOtherData() {
        return otherData;
    }

    public void setOtherData(String otherData) {
        this.otherData = otherData;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Benchmark getBenchmark() {
        return benchmark;
    }

    public void setBenchmark(Benchmark benchmark) {
        this.benchmark = benchmark;
    }
}
