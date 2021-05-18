USE sakila;

#1, 27 rows
SELECT DATE(rental_date) AS `Date`, COUNT(rental_date) AS 'Rented Movies'
FROM rental
GROUP BY `Date`
HAVING COUNT(rental_date) >= 300;

#2, 10 rows
SELECT CONCAT(last_name,', ', first_name) AS `Name`, CONCAT(YEAR(rental_date),'-',MONTH(rental_date)) AS 'Rental Date', MONTH(rental_date) AS `Month`,
		COUNT(CONCAT(YEAR(rental_date),'-',MONTH(rental_date))) AS Rentals
FROM rental
JOIN staff USING (staff_id)
GROUP BY `Name`, `month`
ORDER BY `Name`, Rentals DESC;

#3, 5 rows
#Not sure if you wanted me to combine Year and Month in one column, or show them separately.
#In the first part of the problem, it seems like they supposed to be separated, but later you mention
#that they should be sorted as "Month Year" and "Month"
SELECT YEAR(payment_date) AS `Year`, MONTH(payment_date) AS `Month`, SUM(amount) AS Total
FROM payment
GROUP BY CONCAT(YEAR(payment_date),'-',MONTH(payment_date))
ORDER BY `Year` DESC, `Month` DESC;

#4, 12 rows
SELECT CONCAT(last_name,', ',first_name) AS `Name`, district, COUNT(payment_date) AS Payments, SUM(amount) AS Total
FROM customer
JOIN payment USING (customer_id)
JOIN address USING (address_id)
GROUP BY `Name`
HAVING total >170
ORDER BY Payments DESC;

#5, 8 rows
SELECT name, COUNT(film_id) AS `# of Films`
FROM film
JOIN film_category USING(film_id)
JOIN category USING (category_id)
GROUP BY name
HAVING `# of Films`>61
ORDER BY `# of Films` DESC;

#6, 2 rows
#Step 1
SELECT country_id
FROM country
WHERE country LIKE '%united%';

#Step 2
SELECT city
FROM city
WHERE country_id IN (SELECT country_id
					FROM country
					WHERE country LIKE '%united%')
AND city LIKE '%port%'
ORDER BY city;

#7, 10 rows
#Step 1
SELECT customer_id
FROM payment
WHERE amount > 11;

#Step 2
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE customer_id IN 	(SELECT customer_id
						FROM payment
						WHERE amount > 11)
ORDER BY email;

#8, 18 rows
#I found this problem to be rather confusing. I assumed that you wanted me to show films (titles) 
#that are 184min or longer and the category they are in. Becasue showing  DISTINCT cateory name wouldn't show much.
#Step 1
SELECT film_id
FROM film
WHERE length >= 184;

#Step 2
SELECT DISTINCT name, title
FROM film
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE film_id IN 	(SELECT film_id
					FROM film
					WHERE length >= 184)
ORDER BY name;

#Step 2.1 I case you wanted just DISTINCT category names
/*
SELECT DISTINCT name
FROM film
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE film_id IN 	(SELECT film_id
					FROM film
					WHERE length >= 184)
ORDER BY name;
*/

#9, 2 rows
#Step 1
SELECT film_id
FROM film
WHERE title = 'Alone Trip';

#Step 2
SELECT DISTINCT city
FROM film
JOIN inventory USING (film_id)
JOIN store USING (store_id)
JOIN address USING (address_id)
JOIN city USING (city_id)
WHERE film_id IN 	(SELECT film_id
					FROM film
					WHERE title = 'Alone Trip');

#10, 10 rows
#Step 1
SELECT city_id
FROM customer
JOIN address USING (address_id)
WHERE email LIKE '%mor%';

#Step 2
SELECT city
FROM city
WHERE city_id IN	(SELECT city_id
					FROM customer
					JOIN address USING (address_id)
					WHERE email LIKE '%mor%');


