ALTER TABLE BenchmarkSchedule
  ADD COLUMN fk_runner_id BIGINT(20) NOT NULL,
  ADD  CONSTRAINT fk_runner_id_BenchmarkSchedule
  FOREIGN KEY (fk_runner_id) REFERENCES Runner (id);