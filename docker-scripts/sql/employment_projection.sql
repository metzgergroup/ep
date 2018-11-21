\echo employment_projection

CREATE UNLOGGED TABLE employment_projection (
  sector_code     text    REFERENCES sector,
  occupation_code text    ,
  employment_2016 integer NOT NULL,
  employment_2026 integer NOT NULL,
  PRIMARY KEY (sector_code, occupation_code)
);

\set filepath `echo ${DATA_DIR}`/employment_projection.txt
COPY employment_projection (sector_code, occupation_code, employment_2016, employment_2026) FROM :'filepath' WITH DELIMITER '|';

ALTER TABLE employment_projection SET LOGGED;

\echo
