ARG PG_VERSION=latest

FROM postgres:${PG_VERSION} AS build
ENV PGDATA /pgdata
ENV POSTGRES_DB ep
ENV POSTGRES_HOST_AUTH_METHOD trust
COPY docker-scripts /docker-entrypoint-initdb.d
RUN sed -i 's/exec "$@"//Ig' /usr/local/bin/docker-entrypoint.sh
RUN docker-entrypoint.sh postgres

FROM postgres:${PG_VERSION}
ENV PGDATA /pgdata
COPY --chown=postgres:postgres --from=build $PGDATA $PGDATA
