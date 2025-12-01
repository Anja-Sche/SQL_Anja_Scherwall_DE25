-- a)
desc actor;                 
desc address;               
desc category;             
...
--b)
FROM actor;
FROM address;
FROM category;

--c)
SELECT
  count(*)
FROM actor; --200

-- address 603
-- category 16
-- city 600
-- country 109
-- customer 599
-- customer_list 599
-- film 1000
-- film_actor 5462
-- film_category 1000
-- film_list 5462
-- film_text 0
-- inventory 458
-- language 6
-- payment 16049
-- rental 16044
-- sales_by_film_category 16
-- sales_by_store 2
-- staff 2
-- staff_list 2
-- store 2


--d)
SELECT
    title,
    concat(length, ' minutes') AS minutes
FROM film;

--e)



--f)
SELECT 
    rating,
    COUNT(rating) AS rating_amount
FROM film_list
GROUP BY rating
ORDER BY rating;

--g)
CREATE TABLE IF NOT EXISTS costumer_rental AS (
    SELECT
        r.rental_id,
        r.customer_id,
        c.first_name,
        c.last_name
    FROM 
        rental r
        LEFT JOIN customer c ON r.customer_id = c.customer_id
);

SELECT 
    first_name,
    last_name,
    customer_id,
    count(customer_id) AS times_rented
FROM costumer_rental
GROUP BY customer_id, first_name,last_name
ORDER BY times_rented DESC
LIMIT 10;