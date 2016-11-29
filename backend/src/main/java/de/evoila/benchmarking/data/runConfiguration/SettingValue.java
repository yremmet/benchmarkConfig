package de.evoila.benchmarking.data.runConfiguration;

import de.evoila.benchmarking.data.benchmark.Setting;
import de.evoila.benchmarking.data.cloudSetting.InstanceType;

import javax.persistence.*;

/**
 * Created by enat on 02/11/2016.
 */
@Entity
@Table(name = "SettingValue")
public class SettingValue {
    @Id
    @GeneratedValue
    private Long    id;
    private String  value;

    @ManyToOne()
    @JoinColumn(name="fk_vmGroupConfig_id")
    VmGroupConfig vmGroupConfig;

    @ManyToOne()
    @JoinColumn(name="fk_setting_id")
    Setting setting;

    @ManyToOne()
    @JoinColumn(name="fk_instance_type_id")
    InstanceType instanceType;

    public Long getId() {
        return id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public VmGroupConfig getVmGroupConfig() {
        return vmGroupConfig;
    }

    public void setVmGroupConfig(VmGroupConfig vmGroupConfig) {
        this.vmGroupConfig = vmGroupConfig;
    }

    public Setting getSetting() {
        return setting;
    }

    public void setSetting(Setting setting) {
        this.setting = setting;
    }

    public InstanceType getInstanceType() {
        return instanceType;
    }

    public void setInstanceType(InstanceType instanceType) {
        this.instanceType = instanceType;
    }
}
