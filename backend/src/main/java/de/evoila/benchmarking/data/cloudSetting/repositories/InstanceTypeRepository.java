package de.evoila.benchmarking.data.cloudSetting.repositories;

import de.evoila.benchmarking.data.cloudSetting.InstanceType;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by enat on 02/11/2016.
 */
public interface InstanceTypeRepository extends JpaRepository<InstanceType, Long> {

}
