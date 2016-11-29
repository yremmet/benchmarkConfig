CREATE TABLE IF NOT EXISTS BenchmarkSchedule (
  id BIGINT(20) NOT NULL,
  fk_benchmarkConfig_id BIGINT(20) NOT NULL,
  fk_Run_id BIGINT(20),
  lastStart DATETIME ,
  active BOOL NOT NULL,
  schedule INT,
  CONSTRAINT fk_Run_id_BenchmarkSchedule
  FOREIGN KEY (fk_Run_id) REFERENCES Run (id),
  CONSTRAINT fk_BenchmarkConfig_id_BenchmarkSchedule
  FOREIGN KEY (fk_benchmarkConfig_id) REFERENCES BenchmarkConfig (id)
);
