mysql> create database if not exists university_db;
Query OK, 1 row affected, 1 warning (0.01 sec)

mysql> use university_db;
Database changed
mysql> create table students(student_id int auto_increment primary key,name varchar(100) not null,email varchar(100) not null unique);
Query OK, 0 rows affected (0.05 sec)

mysql> create table courses(course_id int auto_increment primary key,course_name varchar(100) not null, credits int not null,check(credits>0 andcredits<=6));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'andcredits<=6))' at line 1
mysql> create table courses(course_id int auto_increment primary key,course_name varchar(100) not null, credits int not null,check(credits>0 and credits<=6));
Query OK, 0 rows affected (0.04 sec)

mysql> create table enrollments(enrollment_id int auto_increment primary key,student_id int not null,course_id int not null,enrollment_date date not null default(current_date),foreign key(student_id)references student(student_id) on delete cascade on update cascade,unique(student_id,course_id));
ERROR 1824 (HY000): Failed to open the referenced table 'student'
mysql> create table enrollments(enrollment_id int auto_increment primary key,student_id int not null,course_id int not null,enrollment_date date not null default(current_date),foreign key(student_id)references student(student_id) on delete cascade on update cascade,foreign key(course_id)references courses(course_id) on delete cascade on update cascade,unique(student_id,course_id));
ERROR 1824 (HY000): Failed to open the referenced table 'student'
mysql> create table enrollments(enrollment_id int auto_increment primary key,student_id int not null,course_id int not null,enrollment_date date not null default(current_date),foreign key(student_id)references students(student_id) on delete cascade on update cascade,foreign key(course_id)references courses(course_id) on delete cascade on update cascade,unique(student_id,course_id));
Query OK, 0 rows affected (0.06 sec)

mysql> insert into students(name,email)values('raj','raj@gmail.com'),('bob',bob@gmail.com');
    '> insert into students(name,email)values('raj','raj@gmail.com'),('bob',bob@gmail.com');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '@gmail.com');
insert into students(name,email)values('raj','raj@gmail.com'),('bo' at line 1
mysql> insert into students(name,email)values('raj','raj@gmail.com'),('bob',bob@gmail.com');
insert into students(name,email)values('raj','raj@gmail.com'),('bob','bob@gmail.com');
    '> 
    '> insert into students(name,email)values('raj','raj@gmail.com'),('bob',bob@gmail.com');
insert into students(name,email)values('raj','raj@gmail.com'),('bob','bob@gmail.com');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '@gmail.com');
insert into students(name,email)values('raj','raj@gmail.com'),('bo' at line 1
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select*from students
    -> select*from students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select*from students' at line 2
mysql> select*fromstudents;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fromstudents' at line 1
mysql> select*from students;
+------------+------+---------------+
| student_id | name | email         |
+------------+------+---------------+
|          1 | raj  | raj@gmail.com |
|          2 | bob  | bob@gmail.com |
+------------+------+---------------+
2 rows in set (0.00 sec)

mysql> insert into course(course_name,credits)values('database system',3),('computer networks',4);
ERROR 1146 (42S02): Table 'university_db.course' doesn't exist
mysql> insert into courses(course_name,credits)values('database system',3),('computer networks',4);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select*from courses;
+-----------+-------------------+---------+
| course_id | course_name       | credits |
+-----------+-------------------+---------+
|         1 | database system   |       3 |
|         2 | computer networks |       4 |
+-----------+-------------------+---------+
2 rows in set (0.00 sec)

mysql> insert into enrollments(student_id,course_id)values(1,1),--raj in database system (2,1),--bob in database system(1,2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--raj in database system (2,1),--bob in database system(1,2)' at line 1
mysql> insert into enrollments(student_id,course_id)values(1,1),--raj in database system (2,1),--bob in database system (1,2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--raj in database system (2,1),--bob in database system (1,2)' at line 1
mysql> insert into enrollments(student_id,course_id)values(1,1),--raj in database system (2,1),--bob in database system (1,2);--raj in computer networks
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--raj in database system (2,1),--bob in database system (1,2)' at line 1
    -> insert into enrollments(student_id,course_id)values(1,1), (2,1), (1,2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--raj in computer networks
insert into enrollments(student_id,course_id)values(1' at line 1
mysql>  insert into enrollments(student_id,course_id)values(1,1), (2,1), (1,2);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select*from enrollments;
+---------------+------------+-----------+-----------------+
| enrollment_id | student_id | course_id | enrollment_date |
+---------------+------------+-----------+-----------------+
|             1 |          1 |         1 | 2026-07-28      |
|             2 |          2 |         1 | 2026-07-28      |
|             3 |          1 |         2 | 2026-07-28      |
+---------------+------------+-----------+-----------------+
3 rows in set (0.00 sec)

mysql> delete from students where student_id=2;
Query OK, 1 row affected (0.01 sec)

mysql> delete from course where curse_id=2;
ERROR 1146 (42S02): Table 'university_db.course' doesn't exist
mysql> delete from courses where curse_id=2;
ERROR 1054 (42S22): Unknown column 'curse_id' in 'where clause'
mysql> delete from courses where course_id=2;
Query OK, 1 row affected (0.01 sec)

mysql> select*from courses;
+-----------+-----------------+---------+
| course_id | course_name     | credits |
+-----------+-----------------+---------+
|         1 | database system |       3 |
+-----------+-----------------+---------+
1 row in set (0.00 sec)

mysql> drop table if exits enrollments;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'exits enrollments' at line 1
mysql> drop table if exists enrollments;
Query OK, 0 rows affected (0.03 sec)

mysql> drop table if exists students;
Query OK, 0 rows affected (0.03 sec)

mysql> drop database university_db;
Query OK, 1 row affected (0.03 sec)


