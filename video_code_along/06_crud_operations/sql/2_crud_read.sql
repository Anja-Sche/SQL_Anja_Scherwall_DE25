-- read operation using the SELECT statement

SELECT
    *
FROM
    programming.python;

-- also works like this (dialect for duckdb):
FROM
    programming.python;

FROM
    database.sql;

FROM
    database.duckdb;

-- get every id after 7
SELECT
    *
FROM
    database.duckdb
WHERE
    id > 7;
