CREATE TABLE IF NOT EXISTS RunFlag (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  flag VARCHAR (45) NOT NULL
);

CREATE TABLE IF NOT EXISTS ConfigHasRunFlag (
  fk_runFlag_id BIGINT(20) NOT NULL,
  fk_benchmarkConfig_id BIGINT(20) NOT NULL,
  CONSTRAINT fk_runFlag_JoinTable
  FOREIGN KEY (fk_runFlag_id) REFERENCES RunFlag (id),
  CONSTRAINT fk_benchmarkConfig_JoinTable
  FOREIGN KEY (fk_benchmarkConfig_id) REFERENCES BenchmarkConfig (id)
);
