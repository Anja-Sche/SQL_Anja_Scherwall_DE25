-- update operation using UPDATE statement
-- checkmark for glossarys which we have learnt
SELECT
    *
FROM
    database.duckdb    
WHERE
    id IN (3, 6, 7);


UPDATE
    database.duckdb
SET 
    learnt = TRUE    
WHERE
    id IN (3, 6, 7);


