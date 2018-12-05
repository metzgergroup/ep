\echo
\echo Creating tables and copying data...
\echo

-- Set current directory to the first script file's location so we can use relative includes below
\cd `echo ${HERE}`

\ir sql/industry.sql
\ir sql/occupation.sql
\ir sql/employment_projection.sql

\echo Done.
