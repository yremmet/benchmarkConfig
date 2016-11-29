package de.evoila.benchmarking.data.runConfiguration;

import de.evoila.benchmarking.data.benchmark.Flag;
import de.evoila.benchmarking.data.benchmark.VMGroup;

import javax.persistence.*;
import java.util.List;

/**
 * Created by enat on 02/11/2016.
 */
@Entity
@Table(name = "VMGroupConfig")
public class VmGroupConfig {
    @Id
    @GeneratedValue
    private Long   id;

    @ManyToOne()
    @JoinColumn(name="fk_benchmark_config_id")
    BenchmarkConfig benchmarkConfig;


    @ManyToOne()
    @JoinColumn(name="fk_vmgroup_id")
    VMGroup vmGroup;

    @OneToMany(mappedBy = "vmGroupConfig")
    List<SettingValue> settingValues;


    public Long getId() {
        return id;
    }

    public BenchmarkConfig getBenchmarkConfig() {
        return benchmarkConfig;
    }

    public void setBenchmarkConfig(BenchmarkConfig benchmarkConfig) {
        this.benchmarkConfig = benchmarkConfig;
    }

    public VMGroup getVmGroup() {
        return vmGroup;
    }

    public void setVmGroup(VMGroup vmGroup) {
        this.vmGroup = vmGroup;
    }

    public List<SettingValue> getSettingValues() {
        return settingValues;
    }

    public void setSettingValues(List<SettingValue> settingValues) {
        this.settingValues = settingValues;
    }
}
