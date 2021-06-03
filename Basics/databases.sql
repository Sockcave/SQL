-- Databases: collection of data organized for efficient management and updating.
-- Can be made of multiple tables to store relevant info. 

-- We can use a database to create websites.
-- For example, a website like YouTube.
-- YouTube has info like videos, usernames, passwords, and comments.

-- Tables: stores data with rows and columns.
-- For example, a table of names and telephone numbers.

-- Primary Key: field in table that UNIQUELY identifies the table records.
-- Must contain UNIQUE VALUES for EACH row.
-- CANNOT contain null values.
-- For example an ID column, as people can have the same first name.

-- A table is limited to ONE primary key each.
-- A primary key's value must be different for EACH ROW.

CREATE TABLE student (
    student_id INT AUTO_INCREMENT, 
    name VARCHAR(20) NOT NULL, 
    major VARCHAR(20) DEFAULT "Undeclared", 
    PRIMARY KEY(student_id)
);