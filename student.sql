/* I create a Student Table with a Student ID, Student Name, Student Phone Number, and Student Street Address and Class id (Which is going to be connected to the Class Table)*/
CREATE TABLE STUDENT (student_id INTEGER, student_name  varchar(30), student_phone varchar(15), student_address varchar(50), class_id INTEGER,
PRIMARY KEY (student_id)
);
/* I create a Professor Table with a Professor ID, Professor Name, and Professor Phone Number*/
CREATE TABLE PROFESSOR (professor_id INTEGER PRIMARY KEY, professor_name varchar(30), professor_phone varchar(15));
/* I creat a Class Table with a Class ID, CLass Name, and Professor ID (Which is going to be connected to the Professor Table)*/
CREATE TABLE CLASS (class_id INTEGER PRIMARY KEY, class_name varchar(30), professor_id INTEGER);

/* Here I create my connections*/
                                                                                                              
ALTER TABLE CLASS 
ADD FOREIGN KEY (professor_id) references PROFESSOR(professor_id);

ALTER TABLE STUDENT
ADD FOREIGN KEY (class_id) references CLASS(class_id);

INSERT INTO PROFESSOR VALUE(1, "Mr. Sharma", "123-123-1234");
INSERT INTO PROFESSOR VALUE(2, "Mr. William", "321-321-3210");
INSERT INTO PROFESSOR VALUE(3, "Mr. Jake", "234-234-2345");

INSERT INTO CLASS VALUE(1, "Math", 1);
INSERT INTO CLASS VALUE(2, "English", 1);
INSERT INTO CLASS VALUE(3, "Science", 2);
INSERT INTO CLASS VALUE(4, "History", 3);

INSERT INTO STUDENT VALUE(12,"Madhusudhan ", "123-123-1233","2020 Youth Road", 1);
INSERT INTO STUDENT VALUE(13,"William ", "123-123-1233","4040 Adult Road", 2);
INSERT INTO STUDENT VALUE(14,"Josiah Vo", "123-123-1233","5050 Fast Road", 3);
INSERT INTO STUDENT VALUE(15,"Blake", "123-123-1233","5050 Fast Road", 4);

SELECT * FROM STUDENT;

SELECT * FROM PROFESSOR;

SELECT * FROM CLASS;

SELECT * FROM STUDENT as s, CLASS as c, PROFESSOR as p where c.professor_id=p.professor_id and c.class_id = s.class_id;

/* Optional */
drop table PROFESSOR;
drop table STUDENT;
drop table CLASS;
