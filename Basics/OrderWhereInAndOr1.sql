-- Creating the customers table.

CREATE TABLE customers2 (ID INTEGER PRIMARY KEY, 
Name TEXT, 
LastName TEXT, 
City TEXT, 
Age INTEGER);

-- Displays info about the customers table.
SHOW COLUMNS FROM customers2;

-- Inserting values in the customers table.
INSERT INTO customers2 VALUES(1, "John", "Smith", "New York", 35);
INSERT INTO customers2 VALUES(2, "David", "Smith", "Los Angeles", 23);
INSERT INTO customers2 VALUES(3, "Chloe", "Anderson", "Chicago", 27);
INSERT INTO customers2 VALUES(4, "Emily", "Adams", "Houston", 34);
INSERT INTO customers2 VALUES(5, "James", "Roberts", "Philadelphia", 31);
INSERT INTO customers2 VALUES(6, "Andrew", "Thomas", "New York", 45);
INSERT INTO customers2 VALUES(7, "Daniel", "Harris", "New York", 30);

SELECT * FROM customers2;

-- ORDER BY sorts the returned data.

-- Sorts by LastName FIRST and then Age
SELECT * FROM customers2 ORDER BY LastName, Age;

-- WHERE extracts records that fulfill a specified condition
SELECT * FROM customers2 WHERE ID = 7;

SELECT * FROM customers2 WHERE ID BETWEEN 3 AND 7;

SELECT ID, Name, LastName, City FROM customers2 WHERE City = "New York";

-- AND operator
SELECT ID, Name, LastName, Age FROM customers2 WHERE Age>=30 AND Age<=40;

-- AND & OR operator COMBINED
SELECT * FROM customers2 WHERE City = 'New York' AND (Age = 30 OR Age = 35);

-- IN used when you want to compare a column with MORE THAN ONE VALUE.

-- Method 1
SELECT * FROM customers2 WHERE City = 'New York' 
OR City = 'Los Angeles'
OR City = 'Chicago';

-- Method 2 using IN
SELECT * FROM customers2 WHERE City IN ('New York', 'Los Angeles', 'Chicago');

-- NOT IN lets you exclude a list of specific values from the result set.
SELECT * FROM customers2 WHERE City NOT IN ('New York', 'Los Angeles', 'Chicago');