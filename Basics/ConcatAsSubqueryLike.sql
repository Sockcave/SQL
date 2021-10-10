-- Creating the customers table.

CREATE TABLE customers3 (ID INTEGER PRIMARY KEY, 
FirstName TEXT, 
LastName TEXT, 
City TEXT, 
Age INTEGER);

-- Displays info about the customers table.
SHOW COLUMNS FROM customers3;

-- Inserting values in the customers table.
INSERT INTO customers3 VALUES(1, "John", "Smith", "New York", 35);
INSERT INTO customers3 VALUES(2, "David", "Smith", "Los Angeles", 23);
INSERT INTO customers3 VALUES(3, "Chloe", "Anderson", "Chicago", 27);
INSERT INTO customers3 VALUES(4, "Emily", "Adams", "Houston", 34);
INSERT INTO customers3 VALUES(5, "James", "Roberts", "Philadelphia", 31);
INSERT INTO customers3 VALUES(6, "Andrew", "Thomas", "New York", 45);
INSERT INTO customers3 VALUES(7, "Daniel", "Harris", "New York", 30);

SELECT * FROM customers3;

-- CONCAT used to concatenate 2 or more text values and returns the concatenating string. Results in a NEW column.

-- Concatenate FirstName with City and separate them with a comma.

SELECT CONCAT(FirstName, ', ', City) FROM customers3;

-- AS used to assign a custom name to the resulting column.
SELECT CONCAT(FirstName, ', ', City) AS new_column FROM customers3;

-- Creating the Employees Table
CREATE TABLE employees (ID INTEGER PRIMARY KEY, 
FirstName TEXT, 
LastName TEXT, 
Salary INTEGER);

INSERT INTO employees VALUES(1, 'John', 'Smith', 2000);
INSERT INTO employees VALUES(2, 'David', 'Williams', 1500);
INSERT INTO employees VALUES(3, 'Chloe', 'Anderson', 3000);

-- Functions (+, -, *, /)
SELECT ID, FirstName, LastName, Salary+500 AS Salary FROM employees;

SELECT FirstName, UPPER(LastName) AS LastName FROM employees;

SELECT Salary, SQRT(Salary) FROM employees;

SELECT AVG(Salary) FROM employees;

SELECT SUM(Salary) FROM employees;

-- Subquery is a query within another query.

-- Want list of employees whose salaries are greater than the average.
SELECT FirstName, Salary FROM employees 
WHERE Salary > (SELECT AVG(Salary) FROM employees)
ORDER BY Salary DESC;

-- MIN returns minimum value of an expression in a SELECT statement.
SELECT MIN(Salary) AS Salary FROM employees;

-- LIKE is useful when specifying a search condition withn WHERE clause.

-- Select employees where FirstName begins with the letter 'A'
SELECT * FROM employees WHERE FirstName LIKE 'A%';

-- Select employees whose LastName ends with 's'
SELECT * FROM employees WHERE LastName LIKE '%s';