/*  ============================
2. Exploring bike store data
============================*/
DESC staging.bike_join;

FROM
    staging.bike_join;

--b)
SELECT
    *
FROM
    staging.bike_join
ORDER BY
    order_id ASC;

SELECT
    COUNT(DISTINCT order_id) AS unique_orders
FROM
    staging.bike_join;

-- c)
SELECT
    COUNT(DISTINCT product_id) AS unique_products
FROM
    staging.bike_join;

-- d)
SELECT
    *
FROM 
    staging.bike_join
WHERE product_name = 'Surly Straggler - 2016';


SELECT
    ROUND(SUM(quantity * list_price - (list_price * discount))) AS total_income_Surly_S_2016,
FROM
    staging.bike_join
WHERE product_name = 'Surly Straggler - 2016';

-- e)
SELECT 
    COUNT (DISTINCT customer_id) AS customers_distinct_cities
FROM 
    staging.bike_join
WHERE customer_city = 'San Angelo' OR customer_city = 'Orchard Park' OR customer_city = 'Merrick';

-- f)
ALTER TABLE staging.bike_join
ADD COLUMN manager_name VARCHAR;


UPDATE staging.bike_join
SET manager_name = 'Amy Andersson'
WHERE manager_id = 1;

UPDATE staging.bike_join
SET manager_name = 'Bill Berg'
WHERE manager_id = 2;

UPDATE staging.bike_join
SET manager_name = 'Cathy Larsson'
WHERE manager_id = 5;

UPDATE staging.bike_join
SET manager_name = 'Davis Lam'
WHERE manager_id = 7;