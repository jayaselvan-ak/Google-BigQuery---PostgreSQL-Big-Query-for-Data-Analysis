--select
SELECT * FROM `silken-hulling-319007.DB_1.cust_drive_upload`;

--insert
INSERT INTO DB_1.customer_table VALUES 
	(1, 'bee', 'cee', 32, 'bc@xyz.com');
	
INSERT INTO DB_1.customer_table (cust_id, first_name, age, email_id)
	VALUES (2, 'dee', 23, 'd@xyz.com');

INSERT INTO DB_1.customer_table VALUES 
	(3, 'eee', 'fee', 25, 'ef@xyz.com'),
	(4, 'gee', 'hee', 45, 'gh@xyz.com');

-- create
CREATE TABLE DB_1.customer_table (
    Cust_id int64,
	first_name string,
	last_name string,
	age int64,
	email_id string
);

--select
SELECT first_name FROM DB_1.customer_table;

SELECT first_name, last_name FROM DB_1.customer_table;

SELECT * FROM DB_1.customer_table;

SELECT DISTINCT Cust_id FROM DB_1.customer_table;

SELECT DISTINCT Cust_id, first_name FROM DB_1.customer_table;

--where
SELECT * FROM DB_1.customer_table
	WHERE cust_id = 1;
	
SELECT DISTINCT first_name FROM customer_table
	WHERE age > 30;
	
SELECT * FROM DB_1.customer_table
	WHERE first_name = 'Gee';
	
--and --or
SELECT first_name, last_name, age
	FROM DB_1.customer_table
	WHERE age>20
	AND age<30;
	
SELECT first_name, last_name, age
	FROM DB_1.customer_table
	WHERE age<20
	OR age>30
	OR first_name = ‘John’;
	
--not
SELECT first_name,last_name, age
	FROM DB_1.employee
	WHERE  NOT age=25; 
	
SELECT first_name,last_name, age
	FROM DB_1.employee
	WHERE age <> 25;
	
SELECT first_name,last_name, age
	FROM DB_1.employee
	WHERE  NOT age=25
	AND NOT first_name = ‘JAY’;
	
--update
UPDATE DB_1.Customer_table
	SET Age = 17, Last_name = ‘Pe'
	WHERE Cust_id = 2;
	
UPDATE DB_1.Customer_table
	SET email_id = ‘gee@xyz.com
	WHERE First_name = ‘Gee’ or First_name = ‘gee’;
	
--delete
DELETE FROM DB_1.CUSTOMERS
	WHERE ID = 6;
	
DELETE FROM DB_1.CUSTOMERS
	WHERE ID = 100000000;
	
