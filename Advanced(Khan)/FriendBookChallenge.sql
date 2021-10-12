CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    fullname TEXT,
    age INTEGER);
    
INSERT INTO persons (id, fullname, age) VALUES (1, "Bobby McBobbyFace", "12");
INSERT INTO persons (id, fullname, age) VALUES (2, "Lucy BoBucie", "25");
INSERT INTO persons (id, fullname, age) VALUES (3, "Banana FoFanna", "14");
INSERT INTO persons (id, fullname, age) VALUES (4, "Shish Kabob", "20");
INSERT INTO persons (id, fullname, age) VALUES (5, "Fluffy Sparkles", "8");

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);

INSERT INTO friends (person1_id, person2_id)
    VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
    VALUES (2, 3);

SELECT * FROM persons;

SELECT * FROM hobbies;

-- EXAMPLE: Display a table showing people's names with their hobbies.
SELECT persons.fullname, hobbies.name FROM persons 
    JOIN hobbies 
        ON persons.id = hobbies.person_id;

SELECT * FROM friends;

-- EXAMPLE: Show the names of each pair of friends.
SELECT a.fullname, b.fullname FROM friends 
    JOIN persons a
        ON friends.person1_id = a.id 
    JOIN persons b
        ON friends.person2_id = b.id;