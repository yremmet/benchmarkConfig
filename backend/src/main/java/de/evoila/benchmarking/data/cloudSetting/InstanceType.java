package de.evoila.benchmarking.data.cloudSetting;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by enat on 02/11/2016.
 */
@Entity
@Table(name = "InstanceType")
public class InstanceType {
    @Id
    @GeneratedValue
    private Long    id;
    private String  name;
    private String  cloud;
    private String  zone;
    private String  flavour;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCloud() {
        return cloud;
    }

    public void setCloud(String cloud) {
        this.cloud = cloud;
    }

    public String getZone() {
        return zone;
    }

    public void setZone(String zone) {
        this.zone = zone;
    }

    public String getFlavour() {
        return flavour;
    }

    public void setFlavour(String flavour) {
        this.flavour = flavour;
    }
}
