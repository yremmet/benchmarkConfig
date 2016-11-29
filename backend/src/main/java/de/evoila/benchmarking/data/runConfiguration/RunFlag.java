package de.evoila.benchmarking.data.runConfiguration;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  24/11/2016.
 */
@Entity
@Table(name = "RunFlag")
public class RunFlag {
    @Id
    @GeneratedValue
    Long id;

    String flag;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
}
