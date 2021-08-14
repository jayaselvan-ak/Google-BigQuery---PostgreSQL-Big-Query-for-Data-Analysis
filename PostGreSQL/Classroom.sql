--copy
COPY science_class FROM 
	'C:\Program Files\PostgreSQL\13\data\import_files\Student.csv'
	DELIMITER ',' CSV HEADER;

--insert
INSERT INTO science_class VALUES
	(1, 'Popeye', 33),
	(2, 'Olive', 54),
	(3, 'Brutus', 98);

--create
CREATE TABLE science_class(
	enrollment_no int,
	student_name varchar,
	science_marks int
);