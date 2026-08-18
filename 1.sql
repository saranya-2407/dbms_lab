mysql> ``sql
    -> -- 1. Create Database
    -> CREATE DATABASE CyberDB;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '``sql

CREATE DATABASE CyberDB' at line 1
mysql> 
mysql> USE CyberDB;
Database changed
mysql> 
mysql> -- 2. Create Users Table
mysql> CREATE TABLE Users (
    ->     UserID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     DateOfBirth DATE
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> -- 3. Create Enrollments Table
mysql> CREATE TABLE Enrollments (
    ->     EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    ->     CourseTitle VARCHAR(100),
    ->     Trainer VARCHAR(50),
    ->     UserID INT,
    ->     FOREIGN KEY (UserID) REFERENCES Users(UserID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> 
mysql> -- 4. Insert Data into Users
mysql> INSERT INTO Users VALUES
    -> (101, 'Alice', 'Walker', 'alice.walker@example.com', '2003-06-01'),
    -> (102, 'Jack', 'Smith', 'jack.smith@example.com', '2004-07-15'),
    -> (103, 'Jenny', 'Brown', 'jenny.brown@example.com', '2005-08-20'),
    -> (104, 'David', 'Lee', 'david.lee@example.com', '2002-09-25'),
    -> (105, 'Julia', 'White', 'julia.white@example.com', '2001-10-30');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- 5. Insert Data into Enrollments
mysql> INSERT INTO Enrollments (CourseTitle, Trainer, UserID) VALUES
    -> ('Cyber Security Basics', 'Dr. Kevin Mitnick', 101),
    -> ('Advanced Hacking', 'Dr. Ada Lovelace', 102),
    -> ('Digital Forensics', 'Dr. Grace Hopper', 103),
    -> ('Cryptography', 'Dr. Alan Turing', 104),
    -> ('AI in Security', 'Dr. Elon Musk', 102),
    -> ('Ethical Hacking', 'Dr. Linus Torvalds', 105);
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- 6. Count Users Born After a Certain Date
mysql> SELECT COUNT(*) AS UsersAfter2004
    -> FROM Users
    -> WHERE DateOfBirth > '2004-01-01';
+----------------+
| UsersAfter2004 |
+----------------+
|              2 |
+----------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- 7. Average EnrollmentID for Courses by Specific Trainer
mysql> SELECT AVG(EnrollmentID) AS AvgEnrollmentID
    -> FROM Enrollments
    -> WHERE Trainer = 'Dr. Alan Turing';
+-----------------+
| AvgEnrollmentID |
+-----------------+
|          4.0000 |
+-----------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- 8. Sum EnrollmentIDs for a Specific Trainer
mysql> SELECT SUM(EnrollmentID) AS TotalEnrollmentsudo mysql
[sudo] password for ifetcslab: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.45-0ubuntu0.24.04.1 (Ubuntu)

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database company;
ERROR 1007 (HY000): Can't create database 'company'; database exists
mysql> drop database company;
Query OK, 2 rows affected (0.06 sec)

mysql> create database company;
Query OK, 1 row affected (0.01 sec)

mysql> use company;
Database changed
mysql> create a table employee(emp_no int primary key,e_name varchar(50),e_address varchar(100),e_ph_no varchar
    -> (15),dept_no int,dept_name varchar(50),job_id char(10),salary decimal(10,2));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'a table employee(emp_no int primary key,e_name varchar(50),e_address varchar(100' at line 1
mysql> create a table employee(emp_no int primary key,e_name varchar(50),e_address varchar(100),e_ph_no varchar(15),dept_no int,dept_name varchar(50),job_id char(10),salary decimal(10,2));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'a table employee(emp_no int primary key,e_name varchar(50),e_address varchar(100' at line 1
mysql> create a table employee(emp_no int primary key,e_name varchar(50),e_address varchar(100),e_ph_no varchar(15),dept_no int,dept_name varchar(50),job_id char(10),salary decimal(10,2));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'a table employee(emp_no int primary key,e_name varchar(50),e_address varchar(100' at line 1
mysql> create table employee (emp_no int primary key,e_name varchar(50),e_address varchar(100),e_ph_no varchar(15),dept_no int, dept_name varchar(50),job_id char (10),salary decimal(10,2));
Query OK, 0 rows affected (0.05 sec)

mysql> describe employee;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| emp_no    | int           | NO   | PRI | NULL    |       |
| e_name    | varchar(50)   | YES  |     | NULL    |       |
| e_address | varchar(100)  | YES  |     | NULL    |       |
| e_ph_no   | varchar(15)   | YES  |     | NULL    |       |
| dept_no   | int           | YES  |     | NULL    |       |
| dept_name | varchar(50)   | YES  |     | NULL    |       |
| job_id    | char(10)      | YES  |     | NULL    |       |
| salary    | decimal(10,2) | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

mysql> alter table employee add hiredate date;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee modify job_id varchar(10);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee rename column emp_no to e_no;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee modify job_id varchar(20);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee add constraint uq_e_ph_no unique(e_ph_no);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee modify e_name varchar(50) not null;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee add constraint chk_salary check(salary>0);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employee(e_no,e_name,e_address,e_ph_no,dept_no,dept_name,job_id,salary,hiredate)values(1,'priya','123 main st','555-1234',101,'sales','j1001',50000.00,'20-08-24'); 
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee(e_np,e_name,e_address,e_ph_no,dept_no,dep_name,->job_id,salary,hiredate)values(2,'saranya','456 oak st','555-5678',102,'marketing','j1002',60000.00,'4-06-18');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '->job_id,salary,hiredate)values(2,'saranya','456 oak st','555-5678',102,'marketi' at line 1
mysql> insert into employee(e_np,e_name,e_address,e_ph_no,dept_no,dep_name,job_id,salary,hiredate)values(2,'saranya','456 oak st','555-5678',102,'marketing','j1002',60000.00,'4-06-18');
ERROR 1054 (42S22): Unknown column 'e_np' in 'field list'
mysql> insert into employee(e_no,e_name,e_address,e_ph_no,dept_no,dep_name,job_id,salary,hiredate)values(2,'saranya','456 oak st','555-5678',102,'marketing','j1002',60000.00,'4-06-18');
ERROR 1054 (42S22): Unknown column 'dep_name' in 'field list'
mysql> insert into employee(e_no,e_name,e_address,e_ph_no,dept_no,dept_name,job_id,salary,hiredate)values(2,'saranya','456 oak st','555-5678',102,'marketing','j1002',60000.00,'4-06-18');
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee(e_no,e_name,e_address,e_ph_no,dept_no,dept_name,job_id,salary,hiredate)values(3,'keerthi','789 pine st','555-9012',103,'hr','j1003',55000.00,'4-07-15');
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee(e_no,e_name,e_address,e_ph_no,dept_no,dept_name,job_id,salary,hiredate)values(4,'vishnu','112 apple st','555-1112',104,'admin','j1004',45000.00,'4-03-15');
Query OK, 1 row affected (0.01 sec)

mysql> select*from employee;
+------+---------+--------------+----------+---------+-----------+--------+----------+------------+
| e_no | e_name  | e_address    | e_ph_no  | dept_no | dept_name | job_id | salary   | hiredate   |
+------+---------+--------------+----------+---------+-----------+--------+----------+------------+
|    1 | priya   | 123 main st  | 555-1234 |     101 | sales     | j1001  | 50000.00 | 2020-08-24 |
|    2 | saranya | 456 oak st   | 555-5678 |     102 | marketing | j1002  | 60000.00 | 0004-06-18 |
|    3 | keerthi | 789 pine st  | 555-9012 |     103 | hr        | j1003  | 55000.00 | 0004-07-15 |
|    4 | vishnu  | 112 apple st | 555-1112 |     104 | admin     | j1004  | 45000.00 | 0004-03-15 |
+------+---------+--------------+----------+---------+-----------+--------+----------+------------+
4 rows in set (0.00 sec)

mysql> update employee set salary=55000.00 where e_no=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set dept_name='digital marketing'where dept_no=102;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from employee;
+------+---------+--------------+----------+---------+-------------------+--------+----------+------------+
| e_no | e_name  | e_address    | e_ph_no  | dept_no | dept_name         | job_id | salary   | hiredate   |
+------+---------+--------------+----------+---------+-------------------+--------+----------+------------+
|    1 | priya   | 123 main st  | 555-1234 |     101 | sales             | j1001  | 55000.00 | 2020-08-24 |
|    2 | saranya | 456 oak st   | 555-5678 |     102 | digital marketing | j1002  | 60000.00 | 0004-06-18 |
|    3 | keerthi | 789 pine st  | 555-9012 |     103 | hr                | j1003  | 55000.00 | 0004-07-15 |
|    4 | vishnu  | 112 apple st | 555-1112 |     104 | admin             | j1004  | 45000.00 | 0004-03-15 |
+------+---------+--------------+----------+---------+-------------------+--------+----------+------------+
4 rows in set (0.00 sec)

mysql> delete from employee where e_no=3;
Query OK, 1 row affected (0.01 sec)

mysql> delete from employee where dept_no=101;
Query OK, 1 row affected (0.01 sec)

mysql> select*from employee;
+------+---------+--------------+----------+---------+-------------------+--------+----------+------------+
| e_no | e_name  | e_address    | e_ph_no  | dept_no | dept_name         | job_id | salary   | hiredate   |
+------+---------+--------------+----------+---------+-------------------+--------+----------+------------+
|    2 | saranya | 456 oak st   | 555-5678 |     102 | digital marketing | j1002  | 60000.00 | 0004-06-18 |
|    4 | vishnu  | 112 apple st | 555-1112 |     104 | admin             | j1004  | 45000.00 | 0004-03-15 |
+------+---------+--------------+----------+---------+-------------------+--------+----------+------------+
2 rows in set (0.00 sec)

mysql> truncate table employee;
Query OK, 0 rows affected (0.07 sec)

mysql> select*from employee;
Empty set (0.00 sec)




