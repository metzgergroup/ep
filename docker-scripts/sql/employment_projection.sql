\echo employment_projection

CREATE UNLOGGED TABLE employment_projection (
    occupation_code text REFERENCES occupation,
    industry_code   text REFERENCES industry,
    employment_2016 decimal,
    employment_2026 decimal,
    PRIMARY KEY (occupation_code, industry_code)
);

\set filepath `echo ${DATA_DIR}`/employment_projection.csv
COPY employment_projection (occupation_code, industry_code, employment_2016, employment_2026) FROM :'filepath' WITH CSV;

ALTER TABLE employment_projection
    ALTER COLUMN employment_2016 SET DATA TYPE integer USING employment_2016 * 1000,
    ALTER COLUMN employment_2026 SET DATA TYPE integer USING employment_2026 * 1000;

ALTER TABLE employment_projection SET LOGGED;

\echo
