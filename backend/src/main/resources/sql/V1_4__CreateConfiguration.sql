CREATE TABLE BenchmarkSet (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR (255)
);

CREATE TABLE BenchmarkConfig (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  fk_benchmark_id BIGINT(20),
  CONSTRAINT configBenchmark1
  FOREIGN KEY (fk_benchmark_id) REFERENCES Benchmark (benchmarkid)
);

CREATE TABLE ConfigSet (
  fk_benchmark_config_id BIGINT(20) NOT NULL,
  fk_benchmark_set_id BIGINT(20) NOT NULL,
  CONSTRAINT setConfig1
  FOREIGN KEY (fk_benchmark_config_id) REFERENCES BenchmarkConfig (id),
  CONSTRAINT setConfig2
  FOREIGN KEY (fk_benchmark_set_id) REFERENCES BenchmarkSet (id)
);

CREATE TABLE VMGroupConfig(
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fk_benchmark_config_id BIGINT(20),
  fk_vmgroup_id BIGINT(20),
  CONSTRAINT benchmarkConfigVmGroup
  FOREIGN KEY (fk_benchmark_config_id) REFERENCES BenchmarkConfig (id),
  CONSTRAINT vmGroupConfigVmGrouo
  FOREIGN KEY (fk_vmgroup_id) REFERENCES VMGroup (id)
);

CREATE TABLE SettingValue (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  value VARCHAR(255),
  fk_vmGroupConfig_id BIGINT(20),
  fk_setting_id BIGINT(20),
  CONSTRAINT settingValueVmGroupConfig
  FOREIGN KEY (fk_vmGroupConfig_id) REFERENCES VMGroupConfig (id),
  CONSTRAINT settingValueSetting
  FOREIGN KEY (fk_setting_id) REFERENCES Setting (id)
);

CREATE TABLE FlagValue (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  value VARCHAR(255),
  fk_benchmarkConfig_id BIGINT(20),
  fk_flag_id BIGINT(20),
  CONSTRAINT flagBenchmarkConfig
  FOREIGN KEY (fk_benchmarkConfig_id) REFERENCES BenchmarkConfig (id),
  CONSTRAINT flagValueValg
  FOREIGN KEY (fk_flag_id) REFERENCES Flag (id)
);
