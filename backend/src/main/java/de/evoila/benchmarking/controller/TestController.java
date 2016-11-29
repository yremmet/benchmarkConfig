package de.evoila.benchmarking.controller;

import de.evoila.benchmarking.data.benchmark.repositories.FlagRepository;
import de.evoila.benchmarking.data.benchmark.repositories.BenchmarkRepository;
import de.evoila.benchmarking.data.benchmark.repositories.VMGroupRepsitory;
import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;
import de.evoila.benchmarking.data.runConfiguration.repositories.BenchmarkConfigRepository;
import de.evoila.benchmarking.data.runConfiguration.repositories.RunFlagRepository;
import de.evoila.benchmarking.data.runner.BenchmarkSchedule;
import de.evoila.benchmarking.data.runner.BenchmarkScheduleRepository;
import de.evoila.benchmarking.data.runner.ResultRepository;
import de.evoila.benchmarking.data.runConfiguration.RunFlag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {

	
	@RequestMapping("/t")
	public String hello(){
		return "TEST";
	}



	@Autowired
	BenchmarkRepository benchmarkRepository;
	@Autowired
	VMGroupRepsitory vmGroupRepsitory;
	@Autowired
	FlagRepository flagRepository;
	@Autowired
	ResultRepository resultRepository;
	@Autowired
	BenchmarkConfigRepository benchmarkConfigRepository;
	@Autowired
	RunFlagRepository runFlagRepository;
	@Autowired
	BenchmarkScheduleRepository benchmarkScheduleRepository;

	@RequestMapping("/g")
	public ResponseEntity<Object> hella(){
		BenchmarkConfig config = benchmarkConfigRepository.findOne(1L);
		RunFlag flag = new RunFlag();
		flag.setFlag("irgendwas");
		runFlagRepository.save(flag);

		config.getRunFlags().add(flag);
		benchmarkConfigRepository.save(config);
		return  new ResponseEntity<Object>(config.getRunFlags(), HttpStatus.OK);
	}

	@RequestMapping("/s")
	public ResponseEntity<Object> s(){
		BenchmarkSchedule s = benchmarkScheduleRepository.findOne(0l);
		return  new ResponseEntity<Object>(s, HttpStatus.OK);
	}
}
