 CREATE TABLE Run (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  pid NUMERIC (6),
  fk_configId BIGINT(20) NOT NULL,
  fk_runnerId BIGINT(20) NOT NULL,
  state VARCHAR (25),
  CONSTRAINT fk_run_configId
  FOREIGN KEY (fk_configId) REFERENCES BenchmarkConfig (id),
  CONSTRAINT fk_run_runnerId
  FOREIGN KEY (fk_runnerId) REFERENCES Runner (id)
  );
