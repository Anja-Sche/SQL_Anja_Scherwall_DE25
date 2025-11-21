CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.data_job AS (
        SELECT
            *
        FROM
            read_csv_auto('data/salaries.csv')
    );