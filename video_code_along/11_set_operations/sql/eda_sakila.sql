FROM actor;
FROM film;
FROM film_actor;
FROM address;
FROM city;
FROM country;
FROM category;
FROM customer;


SELECT 
    COUNT(*) AS number_movies,
    COUNT(DISTINCT title) AS unique_number_of_titles
FROM film;

SELECT DISTINCT rating FROM main.film;

DESC TABLE film_actor;

FROM customer;

SELECT 
    'customer' AS TYPE,
    c.first_name,
    c.last_name,
FROM customer c
WHERE 
    c.first_name LIKE 'D%';

-- more EDAs left for the reader


--a)
SELECT 
    title,
    length || ' minutes' AS length
FROM film
WHERE length > 180;


--b)
SELECT 
    title,
    rating,
    length || ' minutes' AS length,
    description
FROM film
WHERE title LIKE '%LOVE%';

--olika fast samma resultat

SELECT 
    title,
    rating,
    length || ' minutes' AS length,
    description
FROM film
WHERE 
    regexp_matches(title, 'LOVE');


--c)
SELECT 
    MIN(length) AS shortest_movie_min,
    ROUND(AVG(length)) AS average_movie_length_min,
    MEDIAN(length) AS median_movie_lentgh_min,
    MAX(length) AS longes_movie_min
FROM film;


--d)
SELECT
    title,
    rental_rate,
    rental_duration,
    ROUND(rental_rate/rental_duration, 2) AS rate_per_day
FROM film
ORDER BY rate_per_day DESC
LIMIT 10;



--e)
SELECT
    a.first_name || ' ' || a.last_name AS actor_name,
    COUNT(DISTINCT fa.film_id) AS number_of_films
FROM actor a
    LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY actor_name
ORDER BY number_of_films DESC
LIMIT 10;