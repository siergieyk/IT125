USE sakila;

#1, 42 rows
SELECT title
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
WHERE first_name = 'Gina' AND last_name = 'Degeneres'; 

/*


#2, 36 rows
SELECT first_name, last_name, address, city, district, postal_code, country 
FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
WHERE country = 'United States';

#3, 759 rows
SELECT DISTINCT store_id, film_id, title
FROM store
JOIN inventory USING(store_id)
JOIN film USING (film_id)
WHERE store_id = 1;


#?3, 759 rows
SELECT DISTINCT inventory.store_id, inventory.film_id, film.title
from inventory, film
WHERE inventory.film_id = film.film_id AND store_id = 1;



#4, 183 rows
SELECT customer_id, first_name, last_name, email, title
FROM customer
JOIN rental USING (customer_id)
JOIN inventory USING (inventory_ID)
JOIN film USING (film_ID)
WHERE return_date IS NULL;


#5, 32 rows
SELECT payment_date, amount
FROM customer
JOIN payment USING (customer_id)
WHERE first_name = 'Mary' AND last_name = 'Smith'
ORDER BY payment_date DESC;

#6, 273 rows
SELECT DISTINCT customer.last_name, customer.first_name, customer.email
FROM customer 
JOIN staff USING (store_id)
WHERE staff.first_name = 'Jon' AND staff.last_name = 'Stephens'
ORDER BY customer.last_name, customer.first_name;

#7, 286 rows
SELECT last_name, first_name, title
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE category.name = 'Comedy'
ORDER BY last_name, first_name;

#8, 409 rows
SELECT last_name, first_name, title, description
FROM actor
JOIN film_actor USING (actor_id)
JOIN film_text USING (film_id)
WHERE description LIKE '%robot%';

#9, 220 rows
SELECT last_name, first_name, amount, payment_date
FROM country
JOIN city USING (country_id)
JOIN address USING (city_id)
JOIN customer USING (address_id)
JOIN payment USING (customer_id)
WHERE country = 'United Kingdom';

#10, rows 6 ?
SELECT city, country
FROM film
JOIN inventory USING (film_id)
JOIN store USING (store_id)
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
WHERE title = 'American Circus';

#11 ??
SELECT DISTINCT last_name, first_name, city, country
FROM country
LEFT OUTER JOIN city USING (country_id)
LEFT OUTER JOIN address USING (city_id)
LEFT OUTER JOIN customer USING (address_id)
LEFT OUTER JOIN payment USING (customer_id);

USE ex;

#12 ??
SELECT 	CONCAT(emps.last_name, ', ', emps.first_name) AS Employee,
		CONCAT(mgrs.last_name, ', ', mgrs.first_name) AS Manager,
		CONCAT(exec.last_name, ', ', exec.first_name) AS Executive
FROM employees emps
JOIN employees mgrs
ON emps.manager_id = mgrs.employee_id
JOIN employees exec
ON exec.manager_id IS NULL
WHERE Manager <> (last_name = 'Smith');
#WHERE (CONCAT(mgrs.last_name, ', ', mgrs.first_name) = CONCAT(exec.last_name, ', ', exec.first_name)) IS NULL;


#12
SELECT 	CONCAT(emps.last_name, ', ', emps.first_name) AS Employee,
		CONCAT(mgrs.last_name, ', ', mgrs.first_name) AS Manager
FROM employees emps
JOIN employees mgrs
ON emps.manager_id = mgrs.employee_id;





#13
SELECT DISTINCT CONCAT(emps.last_name, ', ', emps.first_name) AS 'Left',
				CONCAT(mgrs.last_name, ', ', mgrs.first_name) AS 'Right' 
FROM employees emps
JOIN employees mgrs
WHERE CONCAT(emps.last_name, ', ', emps.first_name) <> CONCAT(mgrs.last_name, ', ', mgrs.first_name);

/*
 1.2 Design

	|top_ports------------|DataType---|Length---|Decimals---|NotNULL(NN)?-|
	|port_id			  | INT		  |  11     |   NO      |   YES		  |
	|port_name      	  |	CHAR	  |  35     |	NO      |   YES       | 
	|ID					  | (copy)	  | (copy)  |  (copy)   |  (copy)     |
    |metric_tones         |	DECIMAL	  |  4      |   YES     |   YES       |
    |ranking    		  | INT       |  3      |   NO    	|   YES       |
	|_____________________|___________|_________|___________|_____________|
    
    -Since length for the city ID is 11 digits, I think it will appropriate for the port ID to
     equal 11 as well.
    -Since length for the city's Name is 35 characters, I think it will appropriate for the port 
     ID to equal 35 as well. Some ports are named after the city they are located in. 
     For example Port of Seattle.
    -length for metric tons should equal to 4, since we limit the number to 999.9 (in millions).
	 It shouldn't be NULL, because even if there were no deliveries or very small deliveries, it still can be
     written as 0 (zero).
    -Since we consider only top 100 ports, ranking should have length equal to 3 digits.
    
    
	|top_ports------------------|			|city-------------------|
	| -port_id          INT (PK)|			| -ID      		INT (PK)|
	| -port_name		CHAR    |			| -port_id 		INT (FK)| 
    | -ID 			    INT (FK)|>|------||-| -Name       	CHAR    |
	| -metric_tones     INT		| 			| -CountryCode 	CHAR(FK)|
	| -renking 			INT  	|			| -District 	CHAR	|
	|___________________________|			| -Population  	INT		|
											|_______________________|
                                            
	-Relationship between city and ports is one to many, since one city can have multiple ports.
	-Each port has a unique port_id, that is also the primary key for this table.

	-The fact that certain cities have no ports is irrelevant in this problem. When the tables
     will JOIN together, cities that have NO PORTS wont't show up.
	-If we decide that we want to pull all data, cities that have no ports will have NULL in the
     port data section.
     
     */

                                            
	



