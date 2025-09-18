create database sql_table;
use sql_table;
 -- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50));

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50));

CREATE TABLE Enrollments (
    student_id INT,
    subject_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id));

-- Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2));

-- Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    description VARCHAR(200));

-- Students
INSERT INTO Students (student_id, student_name)
VALUES (1,'maha'),(2,'madhu'),(3,'mahes')
ON DUPLICATE KEY UPDATE student_name = VALUES(student_name);

INSERT INTO Subjects VALUES (101,'tamil'),(102,'Science'),(103,'socil');
INSERT INTO Enrollments VALUES (1,101),(1,102),(2,101),(3,103);

-- Employees
INSERT INTO Employees VALUES 
(1,'janu','HR',50000),
(2,'meenu','HR',60000),
(3,'devi','sale',70000),
(4,'junu','id',75000),
(5,'arjun','Finance',65000);

-- Products
INSERT INTO Products VALUES 
(1,'Laptop','This is a loptop with high performance'),
(2,'Phone','Smart phone with good camera');

-- 1.A teacher wants a list of all subjects each student has enrolled in.
SELECT s.student_name, sub.subject_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Subjects sub ON e.subject_id = sub.subject_id;
