\echo occupation

CREATE UNLOGGED TABLE occupation (
    occupation_code text PRIMARY KEY,
    occupation_type text NOT NULL,
    title           text NOT NULL
);

\set filepath `echo ${DATA_DIR}`/occupation.csv
COPY occupation (occupation_code, occupation_type, title) FROM :'filepath' WITH CSV;

ALTER TABLE occupation SET LOGGED;

\echo
