-- Creating the customers table.

CREATE TABLE customers (ID INTEGER PRIMARY KEY, 
Name TEXT, 
LastName TEXT, 
City, TEXT);

-- Displays info about the customers table.
SHOW COLUMNS FROM customers;

-- Inserting values in the customers table.
INSERT INTO customers VALUES(1, "John", "Smith", "New York");
INSERT INTO customers VALUES(2, "David", "Williams", "Los Angeles");
INSERT INTO customers VALUES(3, "Chloe", "Anderson", "Chicago");
INSERT INTO customers VALUES(4, "Emily", "Adams", "Houston");
INSERT INTO customers VALUES(5, "James", "Roberts", "Philadelphia");
INSERT INTO customers VALUES(6, "Andrew", "Thomas", "New York");
INSERT INTO customers VALUES(7, "Daniel", "Harris", "New York");

SELECT * FROM customers;

-- Creating the items table.
CREATE TABLE items (ID INTEGER PRIMARY KEY, 
Name TEXT, 
Cost VARCHAR(60), 
Seller_id INTEGER);

-- Inserting values in the items table.
INSERT INTO items VALUES(39, "Book", 5.9, 1);
INSERT INTO items VALUES(24, "Box", 2.99, 1);
INSERT INTO items VALUES(72, "Toy", 23.7, 2);
INSERT INTO items VALUES(36, "Flowers", 50.75, 2);
INSERT INTO items VALUES(18, "T-Shirt", 22.5, 3);
INSERT INTO items VALUES(16, "Notebook", 150.22, 4);
INSERT INTO items VALUES(74, "Perfume", 90.9, 6);

SELECT * FROM items;

-- LIMIT retrieves a subset of records.
SELECT * FROM customers LIMIT 3;

-- DISTINCT eliminates all duplicate records and returns only UNIQUE ones.
SELECT DISTINCT City FROM customers;

-- OFFSET can pickup a set of records from particular offset.
SELECT ID, Name, City FROM CUSTOMERS OFFSET 2 LIMIT 2;

