package de.evoila.benchmarking.data.runConfiguration.repositories;

import de.evoila.benchmarking.data.runConfiguration.RunFlag;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  24/11/2016.
 */
public interface RunFlagRepository extends JpaRepository<RunFlag,Long> {
}
