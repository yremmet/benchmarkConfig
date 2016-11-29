package de.evoila.benchmarking.data.runConfiguration.repositories;

import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by enat on 02/11/2016.
 */
public interface BenchmarkConfigRepository extends JpaRepository<BenchmarkConfig,Long> {
}
