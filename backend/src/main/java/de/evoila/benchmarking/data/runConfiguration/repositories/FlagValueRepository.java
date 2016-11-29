package de.evoila.benchmarking.data.runConfiguration.repositories;

import de.evoila.benchmarking.data.runConfiguration.FlagValue;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by enat on 02/11/2016.
 */
public interface FlagValueRepository extends JpaRepository<FlagValue, Long> {
}
