CREATE TABLE InstanceType (
  id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  zone VARCHAR(255),
  cloud VARCHAR(255),
  flavour VARCHAR(255)
);

ALTER TABLE SettingValue
  ADD COLUMN fk_instance_type_id BIGINT(20),
  ADD FOREIGN KEY (fk_instance_type_id)
      REFERENCES InstanceType (id);