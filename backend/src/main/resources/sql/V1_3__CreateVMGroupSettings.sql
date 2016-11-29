CREATE TABLE Flag (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR (555),
  defaultValue VARCHAR (255),
  otherData VARCHAR(255),
  type VARCHAR (50),
  benchmarkId BIGINT(20) NOT NULL,
  CONSTRAINT flag_bench
  FOREIGN KEY (benchmarkId) REFERENCES Benchmark (benchmarkid)
);


CREATE TABLE Setting (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  settingName VARCHAR (255),
  defaultValue VARCHAR (255),
  vmGroupId BIGINT(20) NOT NULL,
  CONSTRAINT settings_vmgroup
  FOREIGN KEY (vmGroupId) REFERENCES VMGroup (id)
);