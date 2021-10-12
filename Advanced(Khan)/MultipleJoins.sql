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
INSERT INTO students (id, first_name, last_name, email, phone, birthdate)
    VALUES (3, "Aladdin", "Lampland", "aladdin@lampland.com", "555-3333", "2001-05-10");
INSERT INTO students (id, first_name, last_name, email, phone, birthdate)
    VALUES (4, "Simba", "Kingston", "simba@kingston.com", "555-1111", "2001-12-24");
    
CREATE TABLE student_projects (id INTEGER PRIMARY KEY,
    student_id INTEGER,
    title TEXT);
    
INSERT INTO student_projects (id, student_id, title)
    VALUES (1, 1, "Carrotapault");
INSERT INTO student_projects (id, student_id, title)
    VALUES (2, 2, "Mad Hattery");
INSERT INTO student_projects (id, student_id, title)
    VALUES (3, 3, "Carpet Physics");
INSERT INTO student_projects (id, student_id, title)
    VALUES (4, 4, "Hyena Habitats");
    
CREATE TABLE project_pairs (id INTEGER PRIMARY KEY,
    project1_id INTEGER,
    project2_id INTEGER);

INSERT INTO project_pairs (id, project1_id, project2_id)
    VALUES(1, 1, 2);
INSERT INTO project_pairs (id, project1_id, project2_id)
    VALUES(2, 3, 4);

-- Example: We want the titles of project team reciews NEXT to each other!
-- Project 1 and Project 2 will PEER REVIEW EACH OTHER.

SELECT a.title, b.title FROM project_pairs 
    JOIN student_projects a 
    ON project_pairs.project1_id = a.id 
    JOIN student_projects b 
    ON project_pairs.project2_id = b.id;