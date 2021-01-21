CREATE database assign3;
use assign3;

CREATE TABLE employee(
employee_id int(10) NOT NULL AUTO_INCREMENT,
name varchar(50) NOT NULL,
city varchar(50) NOT NULL,
phone varchar(50) DEFAULT NULL,
salary varchar(50) NOT NULL,
PRIMARY KEY (employee_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO employee(name,city,phone,salary) VALUES
('Bhavik','Pune','9090909090','10000'),
('Shahrukh','Kolkata','8080808080','12000'),
('Mukesh','Mumbai','7070707070','9000'),
('vijay','Banglore','6060606060','18000');

SELECT * FROM employee;

CREATE TABLE employee2(
employee2_id int(10) NOT NULL AUTO_INCREMENT,
name varchar(50) NOT NULL,
city varchar(50) NOT NULL,
phone varchar(50) DEFAULT NULL,
salary varchar(50) NOT NULL,
PRIMARY KEY (employee2_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO employee2(name,city,phone,salary) VALUES
('kim','LA','5050505050','13000'),
('Bhavik','Pune','9090909090','10000'),
('kylee','LV','4040404040','15000');

SELECT * FROM employee2;

/*  Clause */

SELECT * FROM employee2 ORDER BY salary DESC;

SELECT * FROM employee ORDER BY name ASC;

SELECT distinct(city) from employee ; 

select name,phone from employee group by employee_id having employee_id in (1,2);

/*SET OPERATIONS*/

SELECT name,salary FROM employee 
UNION 
SELECT name,salary FROM employee2;

SELECT name,salary FROM employee 
UNION ALL
SELECT name,salary FROM employee2;

/*
SELECT name,salary FROM employee 
INTERSECT
SELECT name,salary FROM employee2;

SELECT name,salary FROM employee 
MINUS
SELECT name,salary FROM employee2;
*/

/* Operators */

SELECT * FROM employee WHERE SALARY > 13000;

SELECT * FROM employee WHERE SALARY < 13000;

SELECT * FROM employee WHERE SALARY = 12000;

SELECT * FROM employee WHERE SALARY != 12000;

SELECT * FROM employee WHERE SALARY <> 10000;

SELECT  name,salary FROM employee WHERE
salary > 12000 AND city = 'Banglore';

SELECT  name,salary FROM employee WHERE
salary > 15000 OR city = 'Pune';

-- like operator
SELECT * FROM employee WHERE name LIKE 'B%' ; 

-- IN operator
SELECT * from employee WHERE city IN('Pune','Mumbai'); 

-- NULL operator
SELECT * from employee WHERE salary is null; 
SELECT * from employee WHERE salary is not null; 

/* FUNCTIONS */

SELECT MAX(salary) FROM employee2;

SELECT MIN(salary) FROM employee2;

SELECT COUNT(employee_id) FROM employee;

SELECT AVG(salary) FROM employee;

SELECT SUM(salary)FROM employee;

/* Update & Delete */
INSERT INTO employee2(name,city,phone,salary) VALUES
('Justin','New York','303030303030','17000');

select * from employee2;

update employee2
SET city = 'Califronia'
where employee2_id = 4;

DELETE FROM employee2 WHERE employee2_id=4;
