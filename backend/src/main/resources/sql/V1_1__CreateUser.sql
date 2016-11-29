CREATE TABLE User (
  userId BIGINT(20) not null,
  email VARCHAR(255) not null,
  firstname VARCHAR(255),
  lastname VARCHAR(255),
  PRIMARY KEY (userId)
);