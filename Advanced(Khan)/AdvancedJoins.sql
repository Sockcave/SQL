CREATE TABLE students (id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT);

INSERT INTO students (id, first_name, last_name, email, phone, birthdate)
    VALUES (1, "Peter", "Rabbit", "peter@rabbit.com", "555-6666", "2002-06-24");
INSERT INTO students (id, first_name, last_name, email, phone, birthdate)
    VALUES (2, "Alice", "Wonderland", "alice@wonderland.com", "555-4444", "2002-07-04");
    
CREATE TABLE student_grades (id INTEGER PRIMARY KEY,
    student_id INTEGER,
    test TEXT,
    grade INTEGER);

INSERT INTO student_grades (id, student_id, test, grade)
    VALUES (1, 1, "Nutrition", 95);
INSERT INTO student_grades (id, student_id, test, grade)
    VALUES (2, 2, "Nutrition", 92);
INSERT INTO student_grades (id, student_id, test, grade)
    VALUES (3, 1, "Chemistry", 85);
INSERT INTO student_grades (id, student_id, test, grade)
    VALUES (4, 2, "Chemistry", 95);

CREATE TABLE student_projects (id INTEGER PRIMARY KEY, 
student_id INTEGER, 
title TEXT);

INSERT INTO student_projects VALUES(1, 1, 'Carrotapault');

-- CROSS-JOINS: Left table to right table join (think left table times right table)
SELECT * FROM student_grades, students;

-- INNER JOIN IMPLICIT Example: We want test grades next to names.
SELECT * FROM student_grades, students WHERE student_grades.student_id = students.id;

-- EXPLICIT INNER JOIN (Uses JOIN keyword)
SELECT * FROM student_grades JOIN students 
ON student_grades.student_id = students.id;

-- Get the first name, last name, email, testm and grade from students with a grade > 90
SELECT first_name, last_name, email, test, grade FROM student_grades 
JOIN students 
ON student_grades.student_id = students.id
WHERE grade > 90;

-- Same example ^ with Prefixed Tabled Names
SELECT students.first_name, students.last_name, students.email, student_grades.test, student_grades.grade 
FROM student_grades 
JOIN students 
ON student_grades.student_id = students.id 
WHERE grade > 90;

-- We also have the student_projects table.
SELECT * FROM student_projects;

-- LEFT JOIN(inner join example)
SELECT students.first_name, students.last_name, student_projects.title FROM students 
JOIN student_projects 
ON students.id = student_projects.student_id;

-- We want ALL students even if they have no projects.
SELECT students.first_name, students.last_name, student_projects.title FROM students 
LEFT OUTER JOIN student_projects 
ON students.id = student_projects.student_id;
