/*
multiple lines
 */

-- single line

/* =================
    Query the data
   ================= */

-- check the overview of data

DESC; 

DESC staging.joined_table;

-- select all or some columns
SELECT * FROM staging.joined_table;

SELECT 
    order_date,
    customer_first_name,
    customer_last_name,
    product_name,
FROM staging.joined_table;

-- filter rows with WHERE clause
SELECT 
    order_date,
    customer_first_name,
    customer_last_name,
    product_name,
FROM staging.joined_table
WHERE customer_first_name = 'Marvin';


SELECT 
  order_id,
  order_status
FROM staging.joined_table;

-- create a new table for order status description
CREATE TABLE IF NOT EXISTS staging.status (
    order_status INTEGER, 
    order_status_description VARCHAR
);

SELECT * FROM staging.status;

INSERT INTO 
    staging.status
VALUES
    (1, 'Pending'),
    (2, 'Processing'),
    (3, 'Rejected'),
    (4, 'Completed');

-- join the tow tables 
SELECT 
  j.order_id,
  j.order_status,
  s.order_status_description
FROM staging.joined_table j
JOIN staging.status s on j.order_status = s.order_status;

-- sort the rows by order_status
--ORDER BY .... ASC DESC
SELECT 
  j.order_id,
  j.order_status,
  s.order_status_description
FROM staging.joined_table j
JOIN staging.status s on j.order_status = s.order_status
ORDER BY j.order_status ASC;
-- OREDER BY j.oreder_status DESC;

/* ===========================
   Investigate unique customer 
   =========================== */

-- DISTINCT
SELECT DISTINCT order_id
FROM 
  staging.joined_table
ORDER BY order_id ASC;

-- find unique values of customer_id
SELECT DISTINCT customer_id
FROM staging.joined_table
ORDER BY customer_id ASC;

-- find unique values of customer full name
SELECT DISTINCT customer_first_name, customer_last_name
From staging.joined_table
ORDER BY customer_first_name, customer_last_name;

-- it is 'Justina Jenkins' that is the issue
-- this can be found out by one window function
-- below also show WHERE clause with two conditiions
SELECT 
  customer_id,
  customer_first_name,
  customer_last_name,
FROM staging.joined_table
Where customer_first_name = 'Justina' AND customer_last_name = 'Jenkins';


SELECT 
  customer_id,
  customer_first_name,
  customer_last_name,
  customer_city,
  customer_state
FROM staging.joined_table
Where customer_first_name = 'Justina' AND customer_last_name = 'Jenkins';

/*  ==========
    Introduce 
    Agregation
    ========== */

-- Aggregate over rows
-- there are different ways of aggregation (max, min ...)


-- what is the total revenues from all orders

SELECT 
  ROUND(SUM(quantity*list_price)) AS total_revenue
FROM staging.joined_table;

-- try out other aggregation functions
SELECT 
  ROUND(MIN(quantity*list_price)) AS minimum_revenue,
  ROUND(MAX(quantity*list_price)) AS maximum_revenue
FROM staging.joined_table;


/* ============
   CASE...WHEN
   ============*/
-- similas as if...else in other languages

-- we can replace the oreder_status column to some other descriptions
SELECT 
  order_id,
  product_name,
  CASE order_status
    WHEN 1 THEN 'Pending' 
    WHEN 2 THEN 'Proccesing'
    WHEN 3 THEN 'Rejected'
    WHEN 4 THEN 'Completed'
END AS order_status_description
FROM staging.joined_table;