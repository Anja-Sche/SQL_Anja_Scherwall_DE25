-- change name of id into food
--remove google topic column
-- change value int number_of_searches
-- change week_id into week
-- extract a year column

SELECT
    id AS food,
    week_id AS week,
    SUBSTRING(week, 1, 4) AS year,
    value AS number_of_searches
FROM
    food;

CREATE TABLE
    IF NOT EXISTS cleaned_food AS (
        SELECT 
            id AS food,
            week_id AS week,
            SUBSTRING(week, 1, 4) AS year,
            value AS number_of_searches
        FROM
    food
    );