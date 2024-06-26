use sakila;

SELECT actor_id, first_name, last_name FROM actor
ORDER BY last_name, first_name;

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name = 'Williams' or last_name = 'Davis';

SELECT DISTINCT customer_id 
FROM rental
WHERE date(rental_date) = '2005-07-05';

SELECT  c.email, r.return_date
FROM customer c 
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY return_date DESC;

SELECT last_name FROM actor
ORDER BY last_name;