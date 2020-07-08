/*************************CREATING TABLES********************************/
DROP TABLE SALESMAN;
CREATE TABLE SALESMAN (
    salesman_id INTEGER AUTO_INCREMENT,
    name VARCHAR(35),
    city VARCHAR(15),
    comission FLOAT,
    PRIMARY KEY (salesman_id)
);

DROP TABLE ORDERS;
CREATE TABLE ORDERS (
	ord_no INTEGER AUTO_INCREMENT,
    purch_amt FLOAT,
    ord_date VARCHAR(15),
    customer_id INTEGER,
    salesman_id INTEGER,
    PRIMARY KEY (ord_no)
);

DROP TABLE CUSTOMERS;
CREATE TABLE CUSTOMERS (
    customer_id INTEGER,
    cust_name VARCHAR(30),
    city VARCHAR(30),
    grade INTEGER,
    salesman_id INTEGER,
	PRIMARY KEY(customer_id)
);



SELECT * FROM CUSTOMERS;
/******************************Adding foreign key************/
ALTER TABLE ORDERS
ADD FOREIGN KEY (salesman_id) references SALESMAN(salesman_id);

ALTER TABLE CUSTOMERS
ADD FOREIGN KEY (salesman_id) references SALESMAN(salesman_id);

ALTER TABLE ORDERS
ADD FOREIGN KEY (customer_id) references CUSTOMERS(customer_id);
/***************************ADDING DATA*************************/
INSERT INTO SALESMAN VALUE (5001, "James Hoog", "New York", 0.15);
INSERT INTO SALESMAN VALUE (5002, "Nail Knite", "Paris", 0.13);
INSERT INTO SALESMAN VALUE (5005, "Pit Alex", "London", 0.11);
INSERT INTO SALESMAN VALUE (5006, "Mc Lyon", "Paris", 0.14);
INSERT INTO SALESMAN VALUE (5003, "Lauson Hen", "San Jose", 0.12);
INSERT INTO SALESMAN VALUE (5007, "Paul Adam", "Rome", 0.13);
INSERT INTO SALESMAN VALUE (5008, "Madhu Sharma", "Dallas", 0.12);
INSERT INTO SALESMAN VALUE (5009, "William", "San Jose", 0.14);
INSERT INTO SALESMAN VALUE (5010, "Jake", "Rome", 0.15);
INSERT INTO SALESMAN VALUE (5011, "Jake", "Rome", 0.15);

INSERT INTO CUSTOMERS VALUE(3002, "Nick Rimando", "New York", 100, 5001);
INSERT INTO CUSTOMERS VALUE(3007, "Brad Davis", "New York", 200, 5001);
INSERT INTO CUSTOMERS VALUE(3005, "Graham Zusi", "California", 200, 5002);
INSERT INTO CUSTOMERS VALUE(3008, "Julian Green", "London", 300, 5002);
INSERT INTO CUSTOMERS VALUE(3004, "Fabian Johnson", "Paris", 300, 5006);
INSERT INTO CUSTOMERS VALUE(3009, "Geoff Cameron", "Berlin", 100, 5003);
INSERT INTO CUSTOMERS VALUE(3003, "Jozy Altidor", "Moscow", 200, 5007);
INSERT INTO CUSTOMERS VALUE(3001, "Brad Guzan", "London", NULL, 5005);

INSERT INTO ORDERS VALUE (70001, 150.5, "2012-10-05", 3005, 5002);
INSERT INTO ORDERS VALUE (70009, 270.65, "2012-09-10", 3001, 5005);
INSERT INTO ORDERS VALUE (70002, 65.26, "2012-10-05", 3002, 5001);
INSERT INTO ORDERS VALUE (70004, 110.5, "2012-08-17", 3009, 5003);
INSERT INTO ORDERS VALUE (70007, 948.5, "2012-09-10", 3005, 5002);
INSERT INTO ORDERS VALUE (70005, 2400.6, "2012-07-27", 3007, 5001);
INSERT INTO ORDERS VALUE (70008, 5760, "2012-09-10", 3002, 5001);
INSERT INTO ORDERS VALUE (70010, 1983.43, "2012-10-10", 3004, 5006);
INSERT INTO ORDERS VALUE (70003, 2480.4, "2012-10-10", 3009, 5003);
INSERT INTO ORDERS VALUE (70012, 250.45, "2012-06-27", 3008, 5002);
INSERT INTO ORDERS VALUE (70011, 75.29, "2012-08-17", 3003, 5007);
INSERT INTO ORDERS VALUE (70013, 3045.6, "2012-04-25", 3002, 5001);
INSERT INTO ORDERS VALUE (70014, 251.6, "2012-04-25", 3002, 5008);

INSERT INTO ORDERS VALUE (70015, 251.6, "2012-04-25", 3002, 5009);
INSERT INTO ORDERS VALUE (70016, 251.6, "2012-04-25", 3002, 5010);	
/********* DISPLAYING DATA *************/
SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT MAX(comission) FROM SALESMAN;
SELECT salesman_id,count(salesman_id) AS count FROM ORDERS GROUP BY salesman_id;
SELECT * FROM SALESMAN WHERE salesman_id IN (SELECT salesman_id FROM ORDERS GROUP BY salesman_id HAVING count(salesman_id)> 1);
SELECT salesman_id,count(salesman_id) AS COUNT FROM ORDERS GROUP BY salesman_id;
SELECT salesman_id FROM ORDERS GROUP BY salesman_id HAVING count(salesman_id)> 1;

SELECT MAX(comission) FROM SALESMAN;
SELECT MAX(comission) FROM SALESMAN WHERE comission NOT IN (SELECT MAX(comission) FROM SALESMAN);

-- max
SELECT MAX(d.count) from (SELECT count(salesman_id) AS COUNT FROM ORDERS GROUP BY salesman_id) as d;

SELECT count(salesman_id) FROM SALESMAN WHERE salesman_id IN (SELECT salesman_id FROM ORDERS GROUP BY salesman_id HAVING count(salesman_id)< (SELECT MAX(d.count) from (SELECT count(salesman_id) AS COUNT FROM ORDERS GROUP BY salesman_id) as d));
SELECT MAX(s.count) FROM (SELECT count(salesman_id) AS count FROM ORDERS GROUP BY salesman_id) as s WHERE s.count NOT IN (SELECT MAX(dS.count) FROM (SELECT count(salesman_id) AS COUNT FROM ORDERS GROUP BY salesman_id) as d);

SELECT s.name FROM ORDERS AS o, SALESMAN as s GROUP BY salesman_id;

SELECT * FROM EMPLOYEE as e, DEPARTMENT as d, PROJECT as p where e.department_id=d.department_id and e.project_id = p.project_id;

SELECT MAX (salesman_id) FROM SALESMAN;

SELECT MAX(d.count),salesman_id FROM (SELECT o.salesman_id,count(salesman_id) AS count FROM ORDERS AS o GROUP BY salesman_id) as d;
SELECT * FROM ORDERS WHERE salesman_id = 5005;
SELECT salesman_id FROM SALESMAN WHERE city = "London";

SELECT * FROM ORDERS WHERE salesman_id = (SELECT salesman_id FROM SALESMAN WHERE city = "London");
SELECT * FROM ORDERS ORDER BY salesman_id,customer_id;
/*************************************************************************************************************************************************************/
SELECT o.ord_no, s.name FROM ORDERS as o, SALESMAN as s; 
SELECT o.ord_no, s.name FROM ORDERS as o, SALESMAN as s WHERE o.salesman_id = s.salesman_id;
/*joins*/
SELECT o.ord_no, s.name from ORDERS AS o JOIN SALESMAN as s;
SELECT o.ord_no, s.name from ORDERS AS o NATURAL JOIN SALESMAN as s;
-- natural detects a common point (same column name)

SELECT o.ord_no, s.name from ORDERS as o inner join salesman as s on o.salesman_id = s.salesman_id;
select o.ord_no, s.name from salesman as s left join ORDERS as o on o.salesman_id = s.salesman_id;
select o.ord_no, s.name from salesman as s right join ORDERS as o on o.salesman_id = s.salesman_id;
-- doesnt work select o.ord_no, s.name from salesman as s full join ORDERS as o on o.salesman_id = s.salesman_id;

SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT ord_no FROM ORDERS WHERE salesman_id = (SELECT salesman_id FROM SALESMAN WHERE name = "Paul Adam");
SELECT * FROM ORDERS as o INNER JOIN SALESMAN as s on o.salesman_id = s.salesman_id WHERE s.name = "Paul Adam";
SELECT * FROM ORDERS as o INNER JOIN SALESMAN as s on o.salesman_id = s.salesman_id;
SELECT * FROM ORDERS as o INNER JOIN SALESMAN as s on o.salesman_id = s.salesman_id WHERE city = "Rome";
SELECT * FROM SALESMAN WHERE comission = 0.15;
SELECT * FROM SALESMAN WHERE city = "Rome";
SELECT * FROM SALESMAN WHERE salesman_id = 5001;
/* 
*SELECT * FROM SALESMAN WHERE CAST(comission as DECIMAL) =CAST(0.15 as DECIMAL);
* HALPS*/

SELECT s.comission FROM SALESMAN as s INNER JOIN ORDERS as o on o.salesman_id = s.salesman_id WHERE city = "Paris";
SELECT count(c.customer_id) FROM CUSTOMERS as c WHERE c.grade > (SELECT AVG(grade) FROM CUSTOMERS WHERE city = "New York");  
SELECT salesman_id,name FROM SALESMAN WHERE salesman_id in (SELECT salesman_id FROM CUSTOMERS GROUP BY salesman_id HAVING count(salesman_id) > 1);
SELECT count(salesman_id) FROM CUSTOMERS GROUP BY salesman_id;
SELECT * FROM CUSTOMERS GROUP BY salesman_id HAVING count(salesman_id) = 1;
SELECT count(c.customer_id) FROM CUSTOMERS as c WHERE c.grade > (SELECT AVG(grade) FROM CUSTOMERS WHERE city = "New York");  
SELECT salesman_id,name FROM SALESMAN WHERE salesman_id in (SELECT salesman_id FROM CUSTOMERS GROUP BY salesman_id HAVING count(salesman_id) = 1);

SELECT * FROM SALESMAN as s WHERE count(salesman_id);
SELECT count(customer_id),salesman_id FROM customers GROUP BY customer_id;

SELECT customer_id FROM ORDERS GROUP BY customer_id HAVING count(customer_id) >1;
SELECT * FROM CUSTOMERS WHERE customer_id in (SELECT customer_id FROM ORDERS GROUP BY customer_id HAVING count(customer_id) >1);
SELECT * FROM CUSTOMERS as c INNER JOIN SALESMAN as s on s.salesman_id = c.salesman_id WHERE customer_id in (SELECT customer_id FROM ORDERS GROUP BY customer_id HAVING count(customer_id) >1);

SELECT * FROM SALESMAN as s INNER JOIN CUSTOMERS as c on s.salesman_id = c.salesman_id WHERE c.city = s.city;

SELECT * FROM SALESMAN as s INNER JOIN CUSTOMERS as c ON s.city=c.city;
SELECT * FROM SALESMAN as s WHERE s.city IN ( SELECT city FROM CUSTOMERS);
SELECT city FROM CUSTOMERS;


SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
