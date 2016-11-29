package de.evoila.benchmarking.data.benchmark;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.List;

/**
 * Created by enat on 28/10/16.
 */
@Entity
@Table(name = "VMGroup")
public class VMGroup {
    @Id
    @GeneratedValue
    private  Long id;

    @Column(name="groupName", nullable=false)
    private String groupName;

    @ManyToOne
    @JoinColumn(name = "benchmarkId")
    private Benchmark benchmark;

    @OneToMany(mappedBy = "vmGroup")
    List<Setting> settings;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Benchmark getBenchmark() {
        return benchmark;
    }

    public void setBenchmark(Benchmark benchmark) {
        this.benchmark = benchmark;
    }

    public List<Setting> getSettings() {
        return settings;
    }

    public void setSettings(List<Setting> settings) {
        this.settings = settings;
    }

    public boolean addSetting(Setting setting) {
        if(setting != null){
            setting.setVmGroup(this);
            return false;//this.getSettings().add(setting);
        }
        return false;
    }
}
