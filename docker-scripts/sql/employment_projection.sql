\echo employment_projection

CREATE UNLOGGED TABLE employment_projection (
  sector_code TEXT,
  occupation_code TEXT,
  count_2016 INTEGER NOT NULL,
  count_2026 INTEGER NOT NULL,
  PRIMARY KEY (sector_code, occupation_code)
);

\set filepath `echo ${DATA_DIR}`/combined.csv
COPY employment_projection (sector_code, occupation_code, count_2016, count_2026) FROM :'filepath' WITH DELIMITER ',';

ALTER TABLE employment_projection SET LOGGED;

\echo
