CREATE TABLE employees3(ID INTEGER PRIMARY KEY NOT NULL, 
FirstName TEXT, 
LastName TEXT, 
Age INTEGER, 
Salary INTEGER);

INSERT INTO employees3 VALUES(1, 'Emily', 'Adams', 34, 5000);
INSERT INTO employees3 VALUES(2, 'Chloe', 'Anderson', 27, 10000);

-- View: virtual table that lets you structure data as you see fit.
-- Can be used to restrict data access or summarize data(generate reports)

CREATE VIEW List AS 
SELECT FirstName, Salary 
FROM employees3;

SELECT * FROM List;

-- Update our view to also select 'LastName'
CREATE OR REPLACE VIEW List AS 
SELECT FirstName, LastName, Salary 
FROM employees3;

SELECT * FROM List;

-- Delete a view
DROP VIEW List;