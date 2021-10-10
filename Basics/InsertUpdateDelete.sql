CREATE TABLE employees2(ID INTEGER PRIMARY KEY NOT NULL, 
FirstName TEXT, 
LastName TEXT, 
Age VARCHAR(60));

INSERT INTO employees2 VALUES(1, 'Emily', 'Adams', 34);
INSERT INTO employees2 VALUES(2, 'Chloe', 'Anderson', 27);

SELECT * FROM employees2;

-- Can specify SPECIFIC COLUMNS when inserting values.
INSERT INTO employees2(ID, FirstName, LastName, Age)
VALUES(8, 'Anthony', 'Young', 36);

-- Possible to insert data at SPECIFIC COLUMNS ONLY.
INSERT INTO employees2(ID, FirstName, LastName)
VALUES(9, 'Samuel', 'Clark');

SELECT * FROM employees2;


-- UPDATE allows you to alter data in the table.
UPDATE employees2
SET Age = 25
WHERE ID = 1;

-- Can update multiple columns.
UPDATE employees2
SET Age = 26, FirstName = 'Andy'
WHERE ID = 8;

SELECT * FROM employees2;

-- DELETE removes data from your table permanently.
DELETE FROM employees2
WHERE ID = 2;

SELECT * FROM employees2;