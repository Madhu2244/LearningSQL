DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE (
    employee_id INTEGER AUTO_INCREMENT,
    employee_name VARCHAR(50),
    department_id INTEGER NOT NULL,
    phone VARCHAR(15),
    project_id INT NOT NULL,
    PRIMARY KEY (employee_id)
);

CREATE TABLE DEPARTMENT (
    department_id INTEGER PRIMARY KEY,
    name VARCHAR(30),
    location VARCHAR(30)
);

CREATE TABLE PROJECT (
    project_id INTEGER PRIMARY KEY,
    project_name VARCHAR(30),
    location VARCHAR(30)
);

ALTER TABLE EMPLOYEE 
ADD FOREIGN KEY (department_id) references DEPARTMENT(department_id);

ALTER TABLE EMPLOYEE 
ADD FOREIGN KEY (project_id) references PROJECT(project_id);

ALTER TABLE EMPLOYEE
ALTER phone SET DEFAULT NULL;

ALTER TABLE EMPLOYEE
ADD Phone varchar(20) unique;

-- drop column
ALTER TABLE EMPLOYEE
DROP  phone;

INSERT INTO EMPLOYEE(employee_name,department_id,phone,project_id) VALUE("Madhusudhan ", 23, "123-123-1233",20);
INSERT INTO EMPLOYEE VALUE(3,"William ", 23, "123-123-1233",40);
INSERT INTO EMPLOYEE(employee_name,department_id,phone,project_id) VALUE("Josiah Vo", 15, "123-123-1233",20);
INSERT INTO EMPLOYEE(employee_name,department_id,phone,project_id) VALUE("Blake", 15, "123-123-1233",40);
INSERT INTO EMPLOYEE(employee_name,department_id,phone,project_id) VALUE(null, 15, "123-123-1233",20);
INSERT INTO EMPLOYEE(employee_name,department_id,phone,project_id) VALUE(null, 15, "123-123-1233",20);
INSERT INTO EMPLOYEE(employee_name,department_id,phone,project_id) VALUE("jos", 15, "123-123-1233",20);
INSERT INTO EMPLOYEE(employee_name,department_id,phone,project_id) VALUE("string", 15, "123-123-1233",20);
INSERT INTO EMPLOYEE(employee_name,department_id,phone,project_id) VALUE("test", 10, "123-123-1233",20);

SELECT * FROM EMPLOYEE;
SELECT employee_name,project_id,
	CASE
		when project_id = 20 then "Project id is 20"
        when project_id = 40 then "Project id is 40"
        
		else "Project id is greater than 40."
	END 
    as text
    from EMPLOYEE;
    
SELECT employee_id,employee_name,project_id from EMPLOYEE order by (
CASE
	when employee_name is null then employee_id
    else employee_name
    end
);

SELECT * from EMPLOYEE order by (department_id);

SELECT "Project_id text" as text from employee;

INSERT INTO DEPARTMENT VALUES (23, "Information Technology", "Dallas");
INSERT INTO DEPARTMENT VALUES (10, "NASA", "Houston");
INSERT INTO DEPARTMENT VALUES (15, "Manufacturing", "New York");
INSERT INTO DEPARTMENT VALUES (5, "Woodwork", "New York");

INSERT INTO PROJECT VALUES(20, "Web Service", "New York");
INSERT INTO PROJECT VALUES(40, "IT Service", "Dallas");

/*Displaying Data*/

SELECT * FROM EMPLOYEE as e, DEPARTMENT as d, PROJECT as p where e.department_id=d.department_id and e.project_id = p.project_id;

SELECT * FROM EMPLOYEE WHERE employee_id BETWEEN 12 AND 15;

SELECT DISTINCT department_id from EMPLOYEE;

ALTER TABLE EMPLOYEE DROP COLUMN phone;

DELETE FROM EMPLOYEE WHERE employee_id = 13;

SELECT * FROM EMPLOYEE;

SELECT count(*) FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE employee_name like '%a%';

SELECT * FROM EMPLOYEE WHERE employee_id in (12,15,19);

SELECT * FROM EMPLOYEE where employee_id in (select employee_id from employee);

SELECT * FROM EMPLOYEE WHERE employee_id in (select department_id from DEPARTMENT where department.name = "Information Technology");

SELECT * FROM EMPLOYEE WHERE department_id = 15 and project_id=20;

SELECT * FROM EMPLOYEE WHERE department_id = 15 or project_id=20;

SELECT * FROM EMPLOYEE WHERE department_id = 15 and project_id=10;
/*Obvious*/
SELECT * FROM EMPLOYEE WHERE department_id = 15 and project_id=20 and employee_id = 14;
/*Prints name containing a and has project id of 20*/
SELECT * FROM EMPLOYEE WHERE employee_name like '%a%' and project_id = 20;
/*Prints name containing a and has project id of 20*/
SELECT * FROM EMPLOYEE WHERE project_id = 20 and employee_name like '%a%' ;
/*prints employee names containing a or n*/
SELECT * FROM EMPLOYEE WHERE employee_name like '%a%' or '%n';
/*Prints employee names that dont contain an a*/
SELECT * FROM EMPLOYEE where not employee_name like '%a%';
/*Prints all */
SELECT * FROM EMPLOYEE where not employee_id = 15 or not employee_id=14;
/*Prints out employee_id != 14 and !=15 (only id 12 and id 13)*/
SELECT * FROM EMPLOYEE WHERE NOT employee_id = 15 and not employee_id = 14;
/*Prints department id != 23 and employee id = 14;*/
SELECT * FROM EMPLOYEE WHERE NOT department_id = 23 and employee_id = 14;

/**********************************************WAT DOES THIS DO******************************************/
SELECT* FROM EMPLOYEE WHERE employee_id= 14 like '14';


/*SAME THING*/
SELECT * FROM EMPLOYEE WHERE NOT employee_id=12 OR employee_id=13 AND employee_id = 11;
SELECT * FROM EMPLOYEE WHERE (NOT employee_id=12) OR (employee_id=13 AND employee_id = 11);

/*returns 12,13,14 OR 15*/
SELECT * FROM EMPLOYEE WHERE employee_id in (12,13,14,15);

/*returns not 12,13, or 14 (meaning it returns 15) */
select * from employee where employee_id not in (12,13,14);

select * FROM employee where department_id =15;

SELECT * FROM EMPLOYEE WHERE employee_name = 'Blake';

select * from employee where employee_id not in (select department_id from department);

/*causes an error*/
select * from employee where employee_id not in (select * from department);

select * from employee where employee_id in (select department_id from department);
/* returns null names*/
select * from employee where employee_name is null;
select * from employee where employee_name is not null;


SELECT department_id from department;
SELECT * FROM EMPLOYEE WHERE employee_id = ANY(select department_id from department);
SELECT * FROM EMPLOYEE where employee_id = ANY (select project_id);
SELECT * FROM EMPLOYEE WHERE not employee_id = ANY (select project_id);

SELECT * FROM EMPLOYEE WHERE employee_id = ALL(select department_id from department);

SELECT * FROM EMPLOYEE WHERE employee_id < ALL(select department_id from department);

SElECT * FROM EMPLOYEE WHERE employee_id > 14;

SELECT * FROM EMPLOYEE WHERE employee_id > 14 and employee_id < 20;

SELECT * FROM EMPLOYEE WHERE project_id > ANY(select department_id from department) ;

SELECT * FROM EMPLOYEE WHERE project_id > ALL(select department_id from department) ;

SElECT * FROM EMPLOYEE WHERE employee_id >= 14;

SELECT count(employee_id) from employee group by project_id;
select project_id,count(employee_id) from employee group by project_id;
select department_id,count(employee_id) from employee group by department_id order by count(employee_id);
select department_id from department;

select project_id,count(employee_id) as count from employee group by project_id;  

/*ERROR*/
select dept_id from employee,department;
select e.department_id,d.department_id from Employee as e, Department as d;
select * from Employee ;

SELECT e.employee_id from employee e where employee_name like '%A%';
SELECT * FROM EMPLOYEE as e, DEPARTMENT as d, PROJECT as p where e.department_id=d.department_id and e.project_id = p.project_id;
/* can only use having with group by*/
select department_id,count(department_id) from Employee group by department_id having count(department_id);
select department_id,count(department_id) from Employee group by department_id;
SELECT MAX(department_id) count from employee group by department_id;

SELECT MAX(d.count) from (select e.department_id,count(department_id) as count from Employee as e group by department_id having count(department_id)) as d;
select e.department_id,count(department_id) as count from Employee as e group by department_id having count(department_id);
select count(department_id) from employee;
select count(project_id) from employee group by project_id;

SELECT MAX(d.count) from (select count(project_id) as count from employee group by project_id) as d;
SELECT MIN(d.count) from (select count(project_id) as count from employee group by project_id) as d;
select count(project_id) as count from employee group by project_id;
SELECT MAX(d.count) from (select count(department_id) as count from employee group by department_id) as d;
SELECT MIN(d.count) from (select count(department_id) as count from employee group by department_id) as d;
select count(project_id) as count from employee group by project_id;

select * from employee where employee_name IS null;
SELECT * FROM EMPLOYEE WHERE employee_name IS NULL;

SELECT employee_name from EMPLOYEE where exists(SELECT * FROM EMPLOYEE WHERE employee_id > 20);

SELECT * FROM EMPLOYEE;

drop table EMPLOYEE;
drop table DEPARTMENT;
drop table PROJECT;
show tables;