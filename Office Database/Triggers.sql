-- Creating the Employees Table 

CREATE TABLE Employee(
    emp_id INTEGER PRIMARY KEY, 
    first_name VARCHAR(40), 
    last_name VARCHAR(40), 
    birth_date DATE, 
    sex VARCHAR(1), 
    salary INTEGER, 
    super_id INTEGER, 
    branch_id INTEGER
);

-- surrogate key: RANDOM number assigned to each row. NO MAPPING to anything in real world. Type of primary key.
-- surrogate key example: 'emp_id'

-- natural key: has purpose/mapping in the real world.
-- natural key example: 'emp_ssn'

-- Creating the Branch Table
CREATE TABLE Branch(
    branch_id INTEGER PRIMARY KEY, 
    branch_name VARCHAR(40), 
    mgr_id INTEGER, 
    mgr_start_date DATE, 
    FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
);

-- foreign key: primary key for ANOTHER TABLE.
-- foreign key example: branch_id from branch table in employee table

-- Turn branch_id to FOREIGN KEY and super_id to FORIEGN KEY.
ALTER TABLE Employee 
ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;

ALTER TABLE Employee 
ADD FOREIGN KEY(super_id) REFERENCE Employee(emp_id) ON DELETE SET NULL;

-- Creating Client Table 
CREATE TABLE client(
    client_id INTEGER PRIMARY KEY, 
    client_name VARCHAR(40), 
    branch_id INTEGER, 
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

-- composite keys: 2 or more columns make up the PRIMARY KEY.
-- composite key example: 'branch_id' and 'supplier_name' in branch_supplier table.

-- Creating the Works_with table and its composite keys(on delete cascade)
CREATE TABLE works_with(
    emp_id INTEGER, 
    client_id INTEGER, 
    total_sales INTEGER, 
    PRIMARY KEY(emp_id, client_id), 
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- Creating the branch_supplier table 
CREATE TABLE branch_supplier(
    branch_id INTEGER, 
    supplier_name VARCHAR(40), 
    supply_type VARCHAR(40), 
    PRIMARY KEY(branch_id, supplier_name), 
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- INSERTING OUR VALUES

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawanna County', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

-- TRIGGERS: block of code that defines action that should happen when a certain operation is performed on the DB
-- Example: when an entry is added --> do something

CREATE TABLE trigger_test(
    message VARCHAR(40)
);

-- EXAMPLE: Before any new item is inserted into 'Employee', for each new item --> ('added new employee')
DELIMITER $$
CREATE 
    TRIGGER my_trigger BEFORE INSERT ON Employee 
    FOR EACH ROW BEGIN 
    INSERT INTO trigger_test VALUES('added new employee');
    END $$ 
    -- changed the delimiter to $$
DELIMITER ;
-- changed the delimiter back to $. DO NOT FORGET THE SPACE :P

-- Now add an employee
INSERT INTO Employee 
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

SELECT * FROM trigger_test;

-- Creating a new trigger and GETTING ATTRIBUTES.
DELIMITER $$
    CREATE 
    TRIGGER my_trigger1 BEFORE INSERT ON Employee 
    FOR EACH ROW BEGIN 
    INSERT INTO trigger_test VALUES(NEW.first_name);
    -- GRABBING AN ATTRIBUTE with NEW
    END $$
DELIMITER ;

INSERT INTO Employee 
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

SELECT * FROM trigger_test;

-- COMPLICATED TRIGGERS(Conditional)
DELIMITER $$
CREATE 
-- you can switch out BEFORE with AFTER!
    TRIGGER my_trigger2 BEFORE INSERT ON Employee 
    FOR EACH ROW BEGIN 
        IF NEW.sex = 'M' THEN 
            INSERT INTO trigger_test VALUES('added male employee');
        ELSEIF NEW.sex = 'F' THEN 
            INSERT INTO trigger_test VALUES('added female employee');
        ELSE 
            INSERT INTO trigger_test VALUES('added other employee');
        END IF;
    END $$
DELIMITER ;

INSERT INTO Employee 
VALUES(111, 'Pam', 'Beesly', '1979-03-25', 'F', 69000, 106, 3);

SELECT * FROM trigger_test;


-- DELETING TRIGGERS
DROP TRIGGER my_trigger;
