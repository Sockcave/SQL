CREATE TABLE People(ID INTEGER PRIMARY KEY NOT NULL, 
FirstName TEXT, 
LastName TEXT, 
City TEXT);

INSERT INTO People VALUES(1, 'John', 'Smith', 'New York');
INSERT INTO People VALUES(2, 'David', 'Williams', 'Los Angeles');
INSERT INTO People VALUES(3, 'Chloe', 'Anderson', 'Chicago');

SELECT * FROM People;

-- ALTER TABLE is used to add, delete, or modify COLUMNS in an existing table.
ALTER TABLE People ADD DateofBirth DATE;

SELECT * FROM People;

-- Dropping columns from tables.
ALTER TABLE People
DROP COLUMN DateofBirth;

SELECT * FROM People;

-- Renaming COLUMNS in tables.
ALTER TABLE People
RENAME COLUMN FirstName TO Name;

SELECT * FROM People;

-- Renaming Entire table
RENAME TABLE People TO Users;

-- DROP TABLE deletes the entire table.
DROP TABLE Users;