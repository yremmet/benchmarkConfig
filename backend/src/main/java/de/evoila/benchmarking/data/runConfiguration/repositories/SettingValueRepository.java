package de.evoila.benchmarking.data.runConfiguration.repositories;

import de.evoila.benchmarking.data.runConfiguration.SettingValue;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by enat on 02/11/2016.
 */
public interface  SettingValueRepository extends JpaRepository<SettingValue, Long> {
}
