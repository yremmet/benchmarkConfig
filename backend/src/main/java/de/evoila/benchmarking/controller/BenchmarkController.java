package de.evoila.benchmarking.controller;

import com.esotericsoftware.yamlbeans.YamlException;
import com.esotericsoftware.yamlbeans.YamlWriter;
import de.evoila.benchmarking.benchmark.parser.BenchmarkConfigSerializer;
import de.evoila.benchmarking.data.benchmark.repositories.BenchmarkRepository;
import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;
import de.evoila.benchmarking.data.runConfiguration.repositories.BenchmarkConfigRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.StringWriter;

@RestController
@RequestMapping("bench")
public class BenchmarkController {

	@Autowired
	BenchmarkRepository benchmarkRepository;

	@Autowired
	BenchmarkConfigRepository benchmarkConfigRepository;
	@RequestMapping(path="/benchmarks")
	public ResponseEntity<Object> benchmarks(){

		return new ResponseEntity<Object>(
				benchmarkRepository.findAll(),
				HttpStatus.OK);
	}

	@RequestMapping(path="/{id}/config")
	public ResponseEntity<Object> getYamlConfig(@PathVariable Long id){

		BenchmarkConfig config = benchmarkConfigRepository.findOne(id);
        String result = BenchmarkConfigSerializer.serialize(config);

		StringWriter string = new StringWriter(100);
		YamlWriter writer = new YamlWriter(string);
		try {
			writer.write(config);
            writer.close();
		} catch (YamlException e) {
			e.printStackTrace();
		}

		return  new ResponseEntity<Object>(result, HttpStatus.OK);
	}
}
