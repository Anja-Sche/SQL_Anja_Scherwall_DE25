/*  ========================
    1. Exploring hemnet data
    ========================*/

--b)
DESC staging.hemnet_data;

SELECT COUNT(*)
FROM staging.hemnet_data;

--c)
SELECT COUNT(*) AS row_amount
FROM staging.hemnet_data;

--d)
DESC staging.hemnet_data;

--e)
SELECT *
FROM staging.hemnet_data
ORDER BY final_price DESC
LIMIT 5;

--f)
SELECT *
FROM staging.hemnet_data
ORDER BY final_price ASC
LIMIT 5;

--g)
SELECT 
    MIN(final_price) AS minimum_price,
    AVG(final_price) AS mean_price,
    MEDIAN(final_price) AS median_price,
    MAX(final_price) AS maximum_price
FROM staging.hemnet_data;

--h)
SELECT 
    ROUND(MIN(price_per_area)) AS minimum_price_area,
    ROUND(AVG(price_per_area)) AS mean_price_area,
    ROUND(MEDIAN(price_per_area)) AS median_price_area,
    ROUND(MAX(price_per_area)) AS maximum_price_area
FROM staging.hemnet_data;

--i)
SELECT COUNT (DISTINCT SPLIT_PART(commune, ', ', 2)) AS distinct_communes
FROM staging.hemnet_data
ORDER BY distinct_communes ASC;

--j)
SELECT
    COUNT(*) AS total_sales,
    COUNT(*) FILTER (
WHERE
    final_price > 10000000) AS over_ten_milion,
    ROUND(over_ten_milion / total_sales * 100,0) AS percentage_over_ten_milion
FROM 
    staging.hemnet_data;