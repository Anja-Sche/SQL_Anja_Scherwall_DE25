-- Task 2
-- Both CRM datasets may contain invalid records. Identify all rows in both datasets that fail to meet the following rules:

-- The email address must include an @ symbol followed later by a .
-- The region value must be either EU or US
-- The status must be either active or inactive

     SELECT 
        *
    FROM
        staging.crm_new
    WHERE 
        email NOT LIKE '%@%.com';

SELECT 
    *
FROM
    staging.crm_new
WHERE 
    region != 'EU' AND region != 'US'; 

SELECT 
    *
FROM
    staging.crm_new
WHERE 
    status != 'active' AND status != 'inactive'; 

SELECT 
    *
FROM
    staging.crm_new    
WHERE
    status != 'active' AND status != 'inactive'
    OR region != 'EU' AND region != 'US'
    OR email NOT LIKE '%@%.com';

SELECT 
    *
FROM
    staging.crm_old    
WHERE
    status != 'active' AND status != 'inactive'
    OR region != 'EU' AND region != 'US'
    OR email NOT LIKE '%@%.com';


-- Task 3
-- Create a new schema called constrained and create two tables under it. 
-- For each table, create column constraints for the rules specified in task 2 and insert rows 
-- fulfilling these constraints separately from the two tables in the staging schema.

CREATE SCHEMA IF NOT EXISTS constrained;

CREATE TABLE
    IF NOT EXISTS constrained.crm_new AS (
        SELECT 
            *
        FROM 
            staging.crm_new
        WHERE
            status != 'active' AND status != 'inactive'
            OR region != 'EU' AND region != 'US'
            OR email NOT LIKE '%@%.com'
    );


CREATE TABLE
    IF NOT EXISTS constrained.crm_old AS (
        SELECT 
            *
        FROM 
            staging.crm_old
        WHERE
            status != 'active' AND status != 'inactive'
            OR region != 'EU' AND region != 'US'
            OR email NOT LIKE '%@%.com'
    );


-- Task 4
-- In tasks 4 and 5, use the data in the staging schema that store customer records before column constraints are enforced.

-- To validate whether the old and new CRM systems keep the same customer records, use the column customer_id as the unique identifier of customers and find out:

-- customers only recorded in the old CRM system
-- customers only recorded in the new CRM system
-- customers recorded in both CRM system

SELECT 
    customer_id 
FROM staging.crm_old
EXCEPT
SELECT 
    customer_id
FROM staging.crm_new
ORDER BY customer_id;


SELECT 
    customer_id 
FROM staging.crm_new
EXCEPT
SELECT 
    customer_id
FROM staging.crm_old
ORDER BY customer_id;

SELECT 
    n.customer_id
FROM staging.crm_new n
INTERSECT
SELECT 
    o.customer_id
FROM staging.crm_old o
ORDER BY customer_id;
