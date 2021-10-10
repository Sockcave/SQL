CREATE TABLE first (ID INTEGER PRIMARY KEY NOT NULL, 
FirstName TEXT, 
LastName TEXT, 
City TEXT);

CREATE TABLE second (ID INTEGER PRIMARY KEY NOT NULL, 
FirstName TEXT, 
LastName TEXT, 
City TEXT);

INSERT INTO first VALUES(1, 'John', 'Smith', 'New York');
INSERT INTO first VALUES(2, 'David', 'Williams', 'Los Angeles');

INSERT INTO second VALUES(1, 'James', 'Roberts', 'Philadelphia');
INSERT INTO second VALUES(2, 'David', 'Williams', 'Los Angeles');

-- UNION combines multiple datasets into a single dataset, removes duplicates.

SELECT ID, FirstName, LastName, City FROM first
UNION
SELECT ID, FirstName, LastName, City FROM second;

-- UNION ALL combines multiple datasets into a single dataset, DOES NOT remove duplicates.
SELECT ID, FirstName, LastName, City FROM first
UNION ALL
SELECT ID, FirstName, LastName, City FROM second;

