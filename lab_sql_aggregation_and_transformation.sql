USE sakila;

SELECT 
    MIN(length) AS min_duration,
    MAX(length) AS max_duration
FROM 
    film;

SELECT 
    FLOOR(AVG(length) / 60) AS avg_hours,
    FLOOR(AVG(length) % 60) AS avg_minutes
FROM 
    film;

SELECT 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM 
    rental;

SELECT 
    rental_id,
    rental_date,
    customer_id,
    inventory_id,
    return_date,
    staff_id,
    last_update,
    MONTHNAME(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM 
    rental
LIMIT 20;


SELECT 
    rental_id,
    rental_date,
    inventory_id,
    customer_id,
    return_date,
    staff_id,
    last_update,
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM 
    rental;

SELECT 
    title AS film_title,
    IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM 
    film
ORDER BY 
    title ASC;

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    SUBSTRING(email, 1, 3) AS email_prefix
FROM 
    customer
ORDER BY 
    last_name ASC;


SELECT 
    COUNT(*) AS total_films
FROM 
    film;

SELECT 
    rating,
    COUNT(*) AS film_count
FROM 
    film
GROUP BY 
    rating;

SELECT 
    rating,
    COUNT(*) AS film_count
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    film_count DESC;

SELECT 
    rating,
    ROUND(AVG(length), 2) AS mean_duration
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    mean_duration DESC;

SELECT 
    rating,
    ROUND(AVG(length), 2) AS mean_duration
FROM 
    film
GROUP BY 
    rating
HAVING 
    AVG(length) > 120
ORDER BY 
    mean_duration DESC;

SELECT 
    last_name
FROM 
    actor
GROUP BY 
    last_name
HAVING 
    COUNT(*) = 1;

