ARG PG_VERSION=latest

FROM postgres:${PG_VERSION} AS build
ENV PGDATA /pgdata
ENV POSTGRES_DB emp
COPY docker-scripts /docker-entrypoint-initdb.d
RUN docker-entrypoint.sh --help

FROM postgres:${PG_VERSION}
ENV PGDATA /pgdata
COPY --chown=postgres:postgres --from=build $PGDATA $PGDATA
