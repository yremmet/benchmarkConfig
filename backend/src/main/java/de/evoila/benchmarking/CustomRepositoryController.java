package de.evoila.benchmarking;

import de.evoila.benchmarking.data.benchmark.Benchmark;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

@Configuration
public class CustomRepositoryController extends RepositoryRestMvcConfiguration{
    /*@Override
    protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
        config.exposeIdsFor(Benchmark.class);
    }*/
}
