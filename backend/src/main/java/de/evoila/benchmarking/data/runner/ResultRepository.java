package de.evoila.benchmarking.data.runner;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  21/11/2016.
 */
public interface ResultRepository extends MongoRepository<Result,String> {
    List<Result> findByTestOrderByMetric(@Param("test") String test);
    List<Result> findByRunId(@Param("runid") Long runId);
    List<Result> findByTestAndMetric(String test, String metric);
}
