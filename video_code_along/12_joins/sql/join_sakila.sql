-- which actor has played which film_id?
SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    fa.film_id
FROM
    actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id;


-- which actor has played which films?
SELECT
    a.first_name,
    a.last_name,
    f.title
FROM
    actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id 
    LEFT JOIN film f ON f.film_id = fa.film_id;


-- get all films with associated category
SELECT
    f.title,
    c.name AS chategory
FROM film_category fc
INNER JOIN category c ON c.category_id = fc.category_id
INNER JOIN film f ON f.film_id ON fc.film_id;


SELECT 
    COUNT(*)
FROM film;

SELECT 
    COUNT(*)
FROM category;


SELECT 
    COUNT(*)
FROM film f
INNER JOIN category c ON category_id;


--in which adress, city ans country does staff live in

FROM staff; -- address_id, first_name, last_name
FROM address; -- address_id, address, city_id
FROM city; -- city_id, city, country_id
FROM country; -- country_id, country 


SELECT
    s.first_name,
    s.last_name,
    a.address,
    c.city,
    cty.country
FROM staff s
LEFT JOIN address a ON s.address_id = a.address_id
LEFT JOIN city c ON a.city_id = c.city_id
LEFT JOIN country cty ON cty.country = c.country;

