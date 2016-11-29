package de.evoila.benchmarking.data.benchmark;

import javax.persistence.*;

/**
 * Created by enat on 02/11/2016.
 */

@Entity
@Table(name = "Setting")
public class Setting {

    @Id
    @GeneratedValue
    private Long   id;
    private String settingName;
    private String defaultValue;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "vmGroupId")
    private VMGroup vmGroup;

    public String getSettingName() {
        return settingName;
    }

    public void setSettingName(String settingName) {
        this.settingName = settingName;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public VMGroup getVmGroup() {
        return vmGroup;
    }

    public void setVmGroup(VMGroup vmGroup) {
        this.vmGroup = vmGroup;
    }
}
