\echo sector

CREATE UNLOGGED TABLE sector (
    sector_code text PRIMARY KEY,
    title       text NOT NULL
);

\set filepath `echo ${DATA_DIR}`/sector.txt
COPY sector (sector_code, title) FROM :'filepath' WITH DELIMITER '|';

ALTER TABLE sector SET LOGGED;

\echo
