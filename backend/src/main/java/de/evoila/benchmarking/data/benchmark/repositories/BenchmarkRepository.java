package de.evoila.benchmarking.data.benchmark.repositories;

import de.evoila.benchmarking.data.benchmark.Benchmark;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by enat on 28/10/16.
 */
public interface BenchmarkRepository extends JpaRepository<Benchmark,Long> {
    Benchmark findOneByBenchmarkName(String name);

}
