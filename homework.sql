-- Week 5 - Wednesday
-- Questions
-- (WEEK 4)

-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

--ANSWER: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99

--ANSWER: "Douglas","Graf","919.67"
-- "Mary","Smith","478.86"
-- "Alfredo","Mcadams","74.94"
-- "Harold","Martino","81.99"
-- "Mary","Smith","34.95"
-- "Mary","Smith","980.45"
-- "Peter","Menard","128.99"
-- "Peter","Menard","122.99"
-- "Peter","Menard","128.99"
-- "Peter","Menard","123.99"
-- "Peter","Menard","128.99"
-- "Peter","Menard","126.99"
-- "Peter","Menard","121.99"
-- "Peter","Menard","127.99"
-- "Alvin","Deloach","33.44"
-- "Peter","Menard","123.99"
-- "Peter","Menard","121.99"
-- "Peter","Menard","129.99"
-- "Peter","Menard","125.99"
-- "Peter","Menard","125.99"
-- "Peter","Menard","121.99"
-- "Peter","Menard","127.99"
-- "Peter","Menard","125.99"
-- "Peter","Menard","123.99"
-- "Peter","Menard","125.99"
-- "Peter","Menard","121.99"
-- "Peter","Menard","123.99"
-- "Peter","Menard","123.99"
-- "Peter","Menard","130.99"

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- ANSWER: Mary Smith and Peter Menard

-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, last_name, city
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
WHERE city.city_id = 'Nepal';

SELECT *
FROM city;
-- ANSWER: I found no customers in Nepal.

-- 5. Which staff member had the most
-- transactions?

SELECT staff.staff_id, first_name, last_name, COUNT(rental_id)
FROM staff
INNER JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id;

--ANSWER: Mike Hillyer with 8040 rentals

-- 6. How many movies of each rating are
-- there?
SELECT rating, COUNT(film_id)
FROM film;
GROUP BY rating;

-- There are: 209 NC-17 movies.
--178 G movies
--223 PG-13 movies
-- 194 PG movies
-- 196 R movies

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT first_name, last_name,customer_id
FROM customer
WHERE customer_id IN (
    SELECT payment.customer_id
    FROM payment
    WHERE payment.amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

--ANSWER: Harold Martino
-- Douglas Graf
-- Alvin Deloach
-- Alfredo Mcadams

-- 8. How many free rentals did our stores give away?

SELECT amount
FROM payment
WHERE amount = 0;