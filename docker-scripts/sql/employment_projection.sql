\echo employment_projection

CREATE UNLOGGED TABLE employment_projection (
    occupation_code text REFERENCES occupation,
    industry_code   text REFERENCES industry,
    employment_2018 decimal,
    employment_2028 decimal,
    PRIMARY KEY (occupation_code, industry_code)
);

\set filepath `echo ${DATA_DIR}`/employment_projection.csv
COPY employment_projection (occupation_code, industry_code, employment_2018, employment_2028) FROM :'filepath' WITH CSV;

ALTER TABLE employment_projection SET LOGGED;

\echo
