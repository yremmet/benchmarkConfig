package de.evoila.benchmarking.data.runner;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * @author Yannic Remmet
 * @version 0.0.1
 * created:  11/11/2016.
 */
public interface RunRepository extends JpaRepository<Run,Long> {
   List<Run> findRunsByState(String state);
}
