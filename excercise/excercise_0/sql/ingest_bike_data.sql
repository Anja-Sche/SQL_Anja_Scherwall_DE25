CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.bike_join AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/bike_joined_table.csv')
    );