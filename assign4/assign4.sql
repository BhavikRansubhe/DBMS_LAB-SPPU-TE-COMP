CREATE database assign4;
use assign4;

CREATE TABLE customer(
customer_id int(10) NOT NULL AUTO_INCREMENT,
name varchar(50) NOT NULL,
city varchar(50) NOT NULL,
phone varchar(50) DEFAULT NULL,
age varchar(50) NOT NULL,
PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO customer(name,city,phone,age) VALUES
('Bhavik','Pune','9090909090','20'),
('Shahrukh','Kolkata','8080808080','52'),
('Mukesh','Mumbai','7070707070','60'),
('vijay','Banglore','6060606060','40'),
('salman','lonavala','5050505050','52'),
('Jhonny','Pune','4040404040','20');

select * from customer;

CREATE TABLE orders(
order_id int(10) NOT NULL AUTO_INCREMENT,
cust_id int(10) NOT NULL,
o_date DATE,
amount varchar(50) NOT NULL,
PRIMARY KEY (order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO orders(cust_id,o_date,amount) VALUES
('1','2020-10-04','500'),
('1','2020-10-04','700'),
('2','2020-10-05','100'),
('3','2020-10-06','200'),
('4','2020-10-07','1000');

select * from orders;

CREATE TABLE customer2(
customer2_id int(10) NOT NULL AUTO_INCREMENT,
name varchar(50) NOT NULL,
city varchar(50) NOT NULL,
phone varchar(50) DEFAULT NULL,
age varchar(50) NOT NULL,
PRIMARY KEY (customer2_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* JOINS */

SELECT customer_id, name, amount ,o_date
FROM customer
INNER JOIN orders
ON customer.customer_id = orders.cust_id;

SELECT customer_id, name, amount ,o_date
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.cust_id;

SELECT customer_id, name, amount ,o_date
FROM customer
RIGHT JOIN orders
ON customer.customer_id = orders.cust_id;

/*FULL JOIN DOSENT WORK*/
SELECT customer_id, name, amount ,o_date
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.cust_id
UNION All
SELECT customer_id, name, amount ,o_date
FROM customer
RIGHT JOIN orders
ON customer.customer_id = orders.cust_id;

/*SELF JOIN*/
SELECT a.customer_id, a.name, a.age
FROM customer a, customer b
WHERE a.age < b.age;

/* CARTESIAN/CROSS JOIN*/
SELECT customer_id, name, amount ,o_date
FROM customer
CARTESIAN JOIN orders;

/* SUBQUERY */
SELECT name, city FROM customer WHERE
city IN (SELECT city FROM customer WHERE city = 'Pune');

SELECT name, city ,age  FROM customer WHERE
age = (SELECT MAX(age) FROM customer);
 
SELECT name, city ,age  FROM customer WHERE
age > (SELECT AVG(age) FROM customer);  

INSERT INTO customer2 SELECT * FROM customer
WHERE customer_id IN (SELECT customer_id FROM customer);
select * from customer2;

UPDATE customer
SET city = 'LA'
WHERE age IN (SELECT age FROM customer2
WHERE age = 40 );

DELETE FROM customer2
WHERE age IN (SELECT age FROM customer
WHERE age = 40 );

/* Views */

CREATE VIEW view1 AS    
SELECT * FROM customer2;    

select * from view1;

UPDATE view1 
SET name = 'Salman bhai'
WHERE customer2_id= 5;

INSERT INTO view1(name,city,phone,age) VALUES
('Modi','Gujrat','1000000000','70');

drop view view1;
