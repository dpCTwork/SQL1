-- **** Week 5 Monday Questions ****
-- David Park

-- 1. How many actors are there with the last name 'Wahlberg'?
-- Answer: 2 (Nick Wahlberg, Daryl Wahlberg)
SELECT first_name, last_name
FROM actor 
WHERE last_name LIKE 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- Answer: 1 payments
SELECT COUNT(amount) 
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- Answer: 72 films have the highest inventory count of 8, spread across 2 stores.

SELECT film_id, count(film_id)
FROM inventory
GROUP BY film_id
HAVING count(film_id) > 0
ORDER BY count(film_id) DESC


-- 4. How many customers have the last name 'William'?
-- Answer: 0
SELECT COUNT(last_name)
FROM customer 
WHERE last_name LIKE 'William';

-- 5. What store employee (get the id) sold the most rentals?
-- Answer: Mike Hillyer (staff ID 1)
SELECT count(rental_id) , staff_id
FROM rental 
GROUP BY staff_id;

-- 6. How many different district names are there?
-- Answer: 378
SELECT count(DISTINCT (district))
FROM address;
 

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Answer: Lambs Cincinatti (film_id: 508)
SELECT film_id, count(actor_id) 
FROM film_actor
GROUP BY film_id 
ORDER BY count(actor_id) DESC; 


-- 8. From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
-- Answer: 13 customers
SELECT store_id, count(last_name)
FROM customer 
WHERE last_name LIKE '%es'
GROUP BY store_id;


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250
-- for customers with ids between 380 and 430? (use GROUP BY and having > 250)
-- Answer: -423.01 (281), -425.01 (290), -427.01 (269)  

SELECT amount, count(amount)
FROM payment 
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(amount) > 250;

-- 10. Within the film table, how many rating categories are there?
-- And what rating has the most movies total?
-- Answer: 5 rating categories, PG-13 with 223 movies.
SELECT count(DISTINCT rating)
FROM film;

SELECT rating, count(film_id)
FROM film 
GROUP BY rating 
ORDER BY count(film_id);
