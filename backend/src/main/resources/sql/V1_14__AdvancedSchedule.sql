ALTER TABLE BenchmarkSchedule
  ADD COLUMN frequencyType VARCHAR(30);

ALTER TABLE BenchmarkSchedule
  CHANGE BenchmarkSchedule.schedule  BenchmarkSchedule.frequency INT;

