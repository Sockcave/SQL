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

-- NESTED QUERIES

-- EXAMPLE: Find names of all employees who have sold more than 30000 to a single client.

-- Step 1) Get emp_id from works_with that sold more than 30000
SELECT emp_id FROM works_with WHERE total_sales > 30000;

-- Step 2) Get first and last names
SELECT Employee.first_name, Employee.last_name FROM Employee 
WHERE Employee.emp_id IN 
(SELECT works_with.emp_id FROM works_with WHERE total_sales > 30000);

-- EXAMPLE 2: Find all clients who are handled by the branch that Michael Scott manages. 
-- Assume you know Michael Scott's ID(102).

-- Step 1) Get the branch_id of the branch that Michael Scott manages.
SELECT branch_id FROM branch WHERE branch.mgr_id = 102;

-- Step 2) Get the client names from the clients whose branch_id is from the branch Michael Scott manages.
SELECT client.client_name FROM client WHERE client.branch_id = (
    SELECT branch.branch_id FROM branch WHERE branch.mgr_id = 102
);