--in
SELECT * FROM customer
	WHERE city IN (‘Philadelphia’, ‘Seattle’);
	
--between
SELECT * FROM customer
	WHERE age BETWEEN 20 AND 30;

Which is same as
SELECT * FROM customer
	WHERE age>= 20 AND age<= 30;

SELECT * FROM customer
	WHERE age NOT BETWEEN 20 and 30;

SELECT * FROM sales
	WHERE ship_date BETWEEN ‘2015-04-01' AND ‘2016-04-01';
	
--like
SELECT * FROM customer_table
WHERE first_name LIKE 'Jo%’;

SELECT * FROM customer_table
WHERE first_name LIKE '%od%’;

SELECT first_name, last_name FROM customer_table
WHERE first_name LIKE 'Jas_n’; 

SELECT first_name, last_name FROM customer_table
WHERE last_name NOT LIKE 'J%’;

SELECT * FROM customer_table
WHERE last_name LIKE 'G\%';

--order by
SELECT * FROM customer
	WHERE state = 'California’ ORDER BY Customer_name ASC;

SELECT * FROM customer
	ORDER BY 2 DESC;

SELECT * FROM customer
	WHERE age>25 ORDER BY City ASC, Customer_name DESC;

SELECT * FROM customer
	ORDER BY age;
	
--limit
SELECT * FROM customer
	WHERE age >= 25
	ORDER BY age DESC
	LIMIT 8;

SELECT * FROM customer
	WHERE age >=25
	ORDER BY age ASC
	LIMIT 10;
	
--as
SELECT Cust_id AS “Serial number”, Customer_name as name, 
	Age as Customer_age
	FROM Customer ;
	
--count
SELECT COUNT(*) FROM sales;

SELECT COUNT (order_line) as "Number of Products Ordered",
	COUNT (DISTINCT order_id) AS "Number of Orders" 
	FROM sales WHERE customer_id = 'CG-12520';
	
--sum
SELECT sum(Profit) AS "Total Profit"
	FROM sales;

SELECT sum(quantity) AS “Total Quantity"
	FROM orders where product_id = ‘FUR-TA-10000577’;

--avg
SELECT avg(age) AS "Average Customer Age"
	FROM customer;

SELECT avg(sales * 0.10) AS "Average Commission Value"
	FROM sales;

--min
SELECT MIN(sales) AS Min_sales_June15 
	FROM sales 
	WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

--max
SELECT MAX(sales) AS Min_sales_June15 
	FROM sales 
	WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';
	
--group by
SELECT region, COUNT (customer_id) AS customer_count
	FROM customer GROUP BY region;

SELECT product_id, SUM (quantity) AS quantity_sold FROM sales 
	GROUP BY product_id ORDER BY quantity_sold DESC;

SELECT customer_id,
	MIN(sales) AS min_sales,
	MAX(sales) AS max_sales, 
	AVG(sales) AS Average_sales, 
	SUM(sales) AS Total_sales
	FROM sales 
	GROUP BY customer_id
	ORDER BY total_sales DESC 
	LIMIT 5;

--having
SELECT region, COUNT(customer_id) AS customer_count
	FROM customer
	GROUP BY region 
	HAVING COUNT(customer_id) > 200 ;

--case
SELECT *,
	CASE WHEN age<30 THEN ‘Young'
	WHEN age>60 THEN ‘Senior Citizen'
	ELSE ‘Middle aged'
	END AS Age_category
	FROM customer;

--create
Create table sales_2015 as 
	select * from sales where ship_date between '2015-01-01' and '2015-12-31';

create table customer_20_60 as 
	select * from customer 
	where age between 20 and 60;

--inner join
SELECT
	a.order_line ,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
	FROM sales_2015 AS a 
	INNER JOIN customer_20_60 AS b 
	ON a.customer_id = b.customer_id
	ORDER BY customer_id;

--left join
SELECT
	a.order_line ,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
	FROM sales_2015 AS a 
	LEFT JOIN customer_20_60 AS b 
	ON a.customer_id = b.customer_id
	ORDER BY customer_id;
	
--right join
SELECT
	a.order_line ,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
	FROM sales_2015 AS a 
	RIGHT JOIN customer_20_60 AS b 
	ON a.customer_id = b.customer_id
	ORDER BY customer_id;

--full outer join
SELECT
	a.order_line ,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age,
	b.customer_id
	FROM sales_2015 AS a 
	FULL JOIN customer_20_60 AS b 
	ON a.customer_id = b.customer_id
	ORDER BY a.customer_id , b.customer_id;

--cross join
SELECT  a.YYYY, b.MM
	FROM year_values AS a, month_values AS b
	ORDER BY a.YYYY, b.MM;

--intersect
SELECT customer_id
	FROM sales_2015 
	INTERSECT
	SELECT customer_id
	FROM customer_20_60
	ORDER BY customer_id;
	
--except
SELECT customer_id
	FROM sales_2015 
	EXCEPT
	SELECT customer_id
	FROM customer_20_60
	ORDER BY customer_id;

--union
SELECT customer_id
	FROM sales_2015 
	UNION
	SELECT customer_id
	FROM customer_20_60
	ORDER BY customer_id;

--subquery where
SELECT * FROM sales
	WHERE customer_ID IN 
	(SELECT DISTINCT customer_id
	FROM customer WHERE age >60);
	
--subquery from
SELECT 
	a.product_id ,
	a.product_name ,
	a.category,
	b.quantity
	FROM product AS a 
	LEFT JOIN (SELECT product_id,
	SUM(quantity) AS quantity 
	FROM sales GROUP BY product_id) AS b
	ON a.product_id = b.product_id
	ORDER BY b.quantity desc;

--subquery select
SELECT customer_id, 
	order_line, 
	(SELECT customer_name
	FROM customer 
	WHERE sales.customer_id = customer.customer_id)
	FROM sales 
	ORDER BY customer_id;

--view create
CREATE VIEW logistics AS 
	SELECT a.order_line, 
	a.order_id,
	b.customer_name,
	b.city, 
	b. state, 
	b. country 
	FROM sales AS a
	LEFT JOIN customer as b
	ON a.customer_id = b.customer_id
	ORDER BY a.order_line;

--view replace
REPLACE VIEW logistics AS 
	SELECT a.order_line, 
	a.order_id,
	b.customer_name,
	b.city, 
	b. state, 
	b. country 
	FROM sales AS a
	LEFT JOIN customer as b
	ON a.customer_id = b.customer_id
	ORDER BY a.order_line;

--view drop
DROP VIEW logistics;

--view update
UPDATE logistics
	SET Country = US
	WHERE Country = ‘United States’;
	
--index create
CREATE INDEX mon_idx
	ON month_values(MM);
	
 --index alter
ALTER INDEX IF EXISTS mon_idx,
	RENAME TO new_mon_idx;
	
 --index drop
DROP INDEX mon_idx;

--length
SELECT Customer_name, Length (Customer_name) as characters
	FROM customer
	WHERE age >30 ;

--upper
SELECT upper('Start-Tech Academy');

--lower
SELECT lower('Start-Tech Academy');

--replace
SELECT 
	Customer_name,
	country, 
	Replace (country,’United States’,’US’) AS country new
	FROM customer;

--trim
SELECT trim(leading ' ' from '     Start-Tech Academy   ');

SELECT trim(trailing ' ' from '  Start-Tech Academy  ');

SELECT trim(both ' ' from '    Start-Tech Academy   ');

SELECT trim('   Start-Tech Academy  ');

--rtrim
SELECT rtrim('  Start-Tech Academy    ', ' ');

--ltrim
SELECT ltrim('  Start-Tech Academy   ', ' ');

--concat
SELECT 
	Customer_name,
	city|| ' , '||state|| ' , '||country AS address
	FROM customer;

--substring
SELECT 
	Customer_id,
	Customer_name, 
	SUBSTRING (Customer_id FOR 2) AS cust_group
	FROM customer 
	WHERE SUBSTRING(Customer_id FOR 2) = ‘AB’;
	
SELECT 
	Customer_id,
	Customer_name, 
	SUBSTRING (Customer_id FROM 4 FOR 5) AS cust_number
	FROM customer 
	WHERE SUBSTRING(Customer_id FOR 2) = ‘AB’;
	
--string_agg
SELECT 
	order_id ,
	STRING_AGG (product_id,‘, ') 
	FROM sales 
	GROUP BY order_id;

--ceil
--floor
SELECT order_line, sales, 
	CEIL (sales), 
	FLOOR (sales) FROM sales
	WHERE discount>0;
	
--random
SELECT RANDOM()*(b-a)+a

SELECT FLOOR(RANDOM()*(b-a+1))+a;

--setseed
SELECT SETSEED(0.5);
SELECT RANDOM();
SELECT RANDOM();

--round
SELECT order_line, sales, 
	ROUND (sales)
	FROM sales
	
--power
SELECT POWER(6, 2);

SELECT age, power(age,2) FROM customer 
	ORDER BY age;

--current_date  
SELECT CURRENT_DATE;

--current_time
SELECT CURRENT_TIME;
SELECT CURRENT_TIME(1);

--current_timestamp
SELECT CURRENT_TIMESTAMP;

--age
SELECT age('2014-04-25', '2014-01-01’);

SELECT order_line, order_date, ship_date, 
	age(ship_date, order_date) as time_taken
	FROM sales
	ORDER BY time_taken DESC;

--extract day
SELECT EXTRACT(day from '2014-04-25’);

SELECT EXTRACT(day from '2014-04-25 08:44:21’);

--extract minute
SELECT EXTRACT(minute from '08:44:21’);

--extract epoch
SELECT order_line, 
	(EXTRACT(EPOCH FROM ship_date) - EXTRACT(EPOCH FROM order_date)) AS sec_taken
	FROM sales;

--~
SELECT * FROM customer
	WHERE customer_name~ '^a+[a-z\s]+$';
	
SELECT * FROM customer
	WHERE customer_name~* '^(a|b|c|d)+[a-z\s]+$';

SELECT * FROM customer
	WHERE customer_name~* '^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';
	
SELECT * FROM users
	WHERE name~* '^[a-z0-9\.\-\_]+@[a-z0-9\-]+\.[a-z]{2,5}$'
	
