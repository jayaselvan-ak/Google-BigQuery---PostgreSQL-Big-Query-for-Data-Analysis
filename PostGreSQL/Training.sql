--copy
COPY customer_table FROM 
	'C:\Program Files\PostgreSQL\13\data\import_files\copy.csv'
	DELIMITER ',' CSV HEADER;
	
COPY customer_table FROM 
	'C:\Program Files\PostgreSQL\13\data\import_files\copytext.txt'
	DELIMITER ',';
	
--insert
INSERT INTO customer_table VALUES 
	(1, 'bee', 'cee', 32, 'bc@xyz.com');
	
INSERT INTO customer_table (cust_id, first_name, age, email_id)
	VALUES (2, 'dee', 23, 'd@xyz.com');

INSERT INTO customer_table VALUES 
	(3, 'eee', 'fee', 25, 'ef@xyz.com'),
	(4, 'gee', 'hee', 45, 'gh@xyz.com');
	
--create
CREATE TABLE Customer_table(
	Cust_id int,
	First_name varchar,
	Last_name varchar,
	age int,
	email_id varchar
);

--select
SELECT first_name FROM customer_table;

SELECT first_name, last_name FROM customer_table;

SELECT * FROM customer_table;

SELECT DISTINCT first_name FROM customer_table;

SELECT DISTINCT * FROM customer_table;

--where
SELECT DISTINCT first_name FROM customer_table
	WHERE age = 25;
	
SELECT DISTINCT first_name FROM customer_table
	WHERE age > 25;
	
SELECT * FROM customer_table
	WHERE first_name = 'Gee';

--and --or
SELECT first_name, last_name, age
	FROM customer_table
	WHERE age>20
	AND age<30;
	
SELECT first_name, last_name, age
	FROM customer_table
	WHERE age<20
	OR age>30
	OR first_name = ‘John’;

--not
SELECT first_name,last_name, age
	FROM employee
	WHERE  NOT age=25;
	
SELECT first_name,last_name, age
	FROM employee
	WHERE  NOT age=25
	AND NOT first_name = ‘JAY’;

--update
UPDATE Customer_table
	SET Age = 17, Last_name = ‘Pe'
	WHERE Cust_id = 2;
	
UPDATE Customer_table
	SET email_id = ‘gee@xyz.com
	WHERE First_name = ‘Gee’ or First_name = ‘gee’;
	
--delete
DELETE FROM CUSTOMERS
	WHERE ID = 6;

DELETE FROM CUSTOMERS
	WHERE age>25;

DELETE FROM CUSTOMERS;

--alter --add
ALTER TABLE  Customer_table
	ADD test varchar(255);
	
--alter --drop
ALTER TABLE  Customer_table
	DROP test varchar(255);
	
ALTER TABLE  Customer_table
	DROP COLUMN test varchar(255);

--alter --column
ALTER TABLE Customer_table
	ALTER COLUMN age TYPE varchar(255);

--alter --rename
ALTER TABLE Customer_table
	RENAME COLUMN email_id TO cust_email_id;
	
--alter --constraint
ALTER TABLE Customer_table 
	ALTER COLUMN cust_id 
	SET NOT NULL;

ALTER TABLE Customer_table 
	ALTER COLUMN cust_id 
	DROP NOT NULL;

ALTER TABLE Customer_table 
	ADD CONSTRAINT 
	cust_id CHECK (cust_id<0);

ALTER TABLE Customer_table
	ADD PRIMARY KEY cust_id;
