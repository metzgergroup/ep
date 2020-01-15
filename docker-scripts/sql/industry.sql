\echo industry

CREATE UNLOGGED TABLE industry (
    industry_code text PRIMARY KEY,
    industry_type text NOT NULL,
    title         text NOT NULL
);

\set filepath `echo ${DATA_DIR}`/industry.csv
COPY industry (industry_code, industry_type, title) FROM :'filepath' WITH CSV;

ALTER TABLE industry SET LOGGED;

\echo
