package de.evoila.benchmarking.data.runner;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Collection;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  25/11/2016.
 */
public interface BenchmarkScheduleRepository extends JpaRepository<BenchmarkSchedule, Long> {
    Collection<BenchmarkSchedule> findByActive(boolean active);
}
