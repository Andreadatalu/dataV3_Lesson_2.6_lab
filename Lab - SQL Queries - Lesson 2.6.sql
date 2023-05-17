USE sakila;

-- In the table actor, which are the actors whose last names are not repeated?
SELECT last_name, COUNT(*) AS 'unique'
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;


SELECT DISTINCT (last_name)
FROM sakila.actor
ORDER BY last_name ASC;

-- Which last names appear more than once?
SELECT last_name, COUNT(*) AS repetitions
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- how many rentals were processed by each employee.

SELECT staff_id, COUNT(*) AS 'Rentals by employee'
FROM sakila.rental
GROUP BY staff_id
HAVING COUNT(*) + 1;

-- how many films were released each year.

SELECT release_year, COUNT(*) AS 'Films by year'
FROM sakila.film
GROUP BY release_year
HAVING COUNT(*) + 1;

-- find out for each rating how many films were there.
SELECT rating, COUNT(*) AS 'Rating by films'
FROM sakila.film
GROUP BY rating
HAVING COUNT(*) + 1;

-- What is the mean length of the film for each rating type.
SELECT rating, AVG(length) AS 'AVG length', round((AVG(length))/100,2) AS 'mean length'
FROM sakila.film
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, AVG(length) > 120 AS 'Films +2'
FROM sakila.film
GROUP BY rating;

-- Rank films by length
SELECT title, length, RANK() OVER (ORDER BY length DESC) AS 'Rank'
FROM sakila.film
WHERE length IS NOT NULL AND length > 0;
