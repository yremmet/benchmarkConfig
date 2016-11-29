package de.evoila.benchmarking.data.benchmark.repositories;

import de.evoila.benchmarking.data.benchmark.Setting;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by enat on 28/10/16.
 */
public interface SettingRepository extends JpaRepository<Setting, Long> {
}
