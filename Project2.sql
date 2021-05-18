

USE ex;

#1
SELECT customer_last_name, customer_first_name, customer_phone
FROM customers;

#2
SELECT customer_last_name AS 'Last', customer_first_name AS 'First', customer_phone AS 'Phone'
FROM customers;

#3
SELECT invoice_number AS 'Invoice', round(invoice_total*1.01, 2) AS 'With Interest'
FROM active_invoices;

#4
SELECT invoice_number, invoice_total, invoice_due_date
FROM active_invoices
WHERE invoice_total >= '1000';

#5
SELECT DISTINCT terms_id
FROM active_invoices;

#6
SELECT invoice_number, invoice_total, credit_total
FROM active_invoices
WHERE invoice_total >= '1000' AND credit_total >'0';

#7
SELECT customer_first_name, customer_last_name, customer_city, customer_zip, customer_state
FROM customers
WHERE customer_city ='Peoria' OR customer_city ='Normal';


#8 Not really sure hwo to solve it, since OR (I think in this case) is a logical operator.
# I created two solutions. One uses OR (in case OR is not a logical operator), and the other uses UNION.

#8a
SELECT invoice_number, invoice_date, terms_id
FROM active_invoices
WHERE terms_id = '2' OR terms_id = '3' OR terms_id = '4';

#8b
SELECT invoice_number, invoice_date, terms_id
FROM active_invoices
WHERE terms_id = '2'
	UNION
SELECT invoice_number, invoice_date, terms_id
FROM active_invoices
WHERE terms_id = '3'
	UNION
SELECT invoice_number, invoice_date, terms_id
FROM active_invoices
WHERE terms_id = '4';

#9
SELECT invoice_number, invoice_date, terms_id
FROM active_invoices
WHERE terms_id BETWEEN '2' AND '4';

#10
SELECT invoice_number
FROM active_invoices
WHERE invoice_number LIKE '%-%' OR invoice_number LIKE '%/%';

#11
SELECT invoice_id, invoice_total
FROM null_sample
WHERE invoice_total IS NOT NULL;

#12
SELECT customer_last_name, customer_first_name, customer_phone
FROM customers
WHERE customer_state = 'IN'
ORDER BY customer_last_name, customer_first_name;

#13
SELECT invoice_number, invoice_due_date, invoice_total
FROM active_invoices
WHERE invoice_total > '1000'
ORDER BY invoice_total DESC;

#14
SELECT invoice_number, invoice_total, invoice_due_date, terms_id
FROM active_invoices
WHERE (terms_id = '4') AND (invoice_total BETWEEN '100' AND '2000') AND (invoice_due_date LIKE '2014-07%')
ORDER BY invoice_due_date DESC;

#15
SELECT customer_last_name, customer_first_name, customer_state
FROM customers
WHERE (customer_last_name LIKE 'R%' OR customer_last_name LIKE 'S%' OR customer_last_name LIKE 'T%')
	AND (customer_state LIKE 'WA' OR customer_state LIKE 'OR' OR customer_state LIKE 'CA')
ORDER BY customer_state, customer_last_name, customer_first_name;


#1.2 Design
/*
	|AncientCityName----------------|
	| -Ancient_City_Name 	CHAR(PK)| Ancient_City_Name is the unique element in this table, so it is a Primary Key.
	| -ID 					INT (FK)| ID is a foreign key from the City table.
	| -Year_it_ceased 		INT		| This is and integer, it is not unique. can't be NULL
	| -BCE_or_CE 			CHAR	| this is the CE or BCE differentiator. Comes in connection with the Year_it_ceased.
	|_______________________________|

	|Column---------------|DataType---|Length---|Decimals---|NotNULL?---|
	|Ancient_City_Name	  |	CHAR	  |  30     |	NO      |   YES     |
	|ID					  | (copy)	  | (copy)  |  (copy)   |  (copy)   |
    |Year_it_Ceased       |	INT		  |   5     |   NO      |   YES     |
    |BCE_or_CE   		  | CHAR      |   3     |   NO    	|   YES     |
	|_____________________|___________|_________|___________|___________|
    
Fot Year_it_Ceased I selected length equal to 5, just to be on the safe side. 
Who knows what historians will discover in the coming years. The length equal to 5, 
will help with future expansion of the database .

People started to settle permanently in the given locations during the Neolithic revolution 
(beginning of farming) around 10,000 BCE (length 5). 

The relationship between the city table and the AncientCityName table is one to many. 
One modern city could have had multiple names through the history.

BCE_or_CE is used in order to improve the filtering experience. We will be able to filter 
for certain year ranges in a given era. 
For example:

SELECT Ancient_City_Name, Year_it_Ceased
FROM AncientCityName
WHERE (BCE_or_CE=  CE) AND (Year_it_Ceased BETWEEN '100' AND '2000')
*/












