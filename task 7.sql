create database sql_practice;

use sql_practice;

CREATE TABLE student1 (
studentid INT primary key,
name VARCHAR(10),
email VARCHAR(100) unique,
city VARCHAR(10),
joindate DATE);

drop table student1;

CREATE TABLE courses (
course_id INT PRIMARY KEY,
title VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2));


CREATE TABLE Enrollments (
EnrollID INT PRIMARY KEY,
StudentID INT NOT NULL,
CourseID INT NOT NULL,
EnrollDate DATE NOT NULL,
Status VARCHAR(20));


CREATE TABLE Payments (
PaymentID INT PRIMARY KEY,
StudentID INT NOT NULL,
Amount DECIMAL(10, 2) NOT NULL,
PayDate DATE NOT NULL);



-- 1. Add a new student who joined today

INSERT INTO student1 (studentid, name, email, city, joindate) VALUES
(1, 'renu', 'renu123@email.com', 'trichy', '2025-09-17'),
(2, 'jaanu', 'jaanu123@email.com', 'chennai', '2025-09-16');

-- 2. Insert 3 new courses

insert into courses(course_id,title,category,price)values
(101,'python','programming',599),
(102,'graphic design','designing',499),
(103,'digital marketing','marketing',699);

-- 3. A student enrolls in 2 courses

INSERT INTO Enrollments (EnrollID, StudentID, CourseID, EnrollDate, Status)values
(1,1,101,'2025-07-17','active'), 
(2,2,102,'2025-09-16', 'Completed');

-- 4. Record a payment

insert into payments(paymentid,studentid,amount,paydate)values
(101,1,5000.50,'2025-09-15'),
(102,2,6000.50,'2025-09-16'),
(103,3,7000.50,'2025-09-17');


-- 5. Insert multiple students

INSERT INTO student1 (studentid, name, email, city, joindate) VALUES
(3,'kavi','kavi123@email.com','chennai','2025-08-15'),
(4,'banu','banu1234@email.com','madhurai','2025-07-18'),
(5,'junu','junu1234@email.com','trichy','2025-09-15');


-- 6. Update a student’s city

UPDATE student1
SET city = 'Bangalore'
WHERE studentid = 2


-- 7. Increase Programming course prices by 10%

UPDATE Courses SET Price = Price * 1.10
WHERE Category = 'Programming';

-- 8. Update enrollment status to Completed

UPDATE Enrollments SET Status = 'Completed'
WHERE StudentID = 2 AND CourseID = 102;


-- 9. Correct a wrongly typed email

update student1 set email = 'renu.renaka123@email.com'
where studentid = 1;


-- 10. Delete a student

delete from student1 where studentid = 4;


-- 11. Delete all enrollments for a specific course

delete from enrollments where courseid = 102;


-- 12. Truncate payments table

truncate table payments;

-- 14. Drop Payments table

drop table payments;

-- 15. Total number of students enrolled

select count(distinct studentid) as total_students
from enrollments;

-- 16. Average course price by category

SELECT Category,
AVG(Price) AS Avg_Price
FROM Courses
GROUP BY Category;

-- 17. Highest payment

select max(amount) as gighest_payment
from payments;

-- 18. Students with more than 2 enrollments

select studentid,count(*) as total_enrollments
from enrollments
group by studentid
having count(*) > 2;

-- 19. Courses with no enrollments

select course_id,title
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

-- 20. Student who paid max amount

SELECT StudentID, Name
FROM Student1
WHERE StudentID = (
    SELECT StudentID
    FROM Payments
    WHERE Amount = (SELECT MAX(Amount) FROM Payments));
    
-- 21. Procedure to add student

DELIMITER //
CREATE PROCEDURE AddStudent(IN pName VARCHAR(100), IN pEmail VARCHAR(100), IN pCity VARCHAR(50))
BEGIN
    INSERT INTO Students (Name, Email, City, JoinDate)
    VALUES (pName, pEmail, pCity, '2025-09-17');
END //
DELIMITER ;

-- 22. Procedure to get courses for a student

DELIMITER //
CREATE PROCEDURE GetStudentCourses(IN pStudentID INT)
BEGIN
    SELECT c.CourseID, c.Title, c.Category
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE e.StudentID = pStudentID;
END //
DELIMITER ;

-- 23. Trigger: Auto Active Status

DELIMITER //
CREATE TRIGGER trg_AutoActive
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    SET NEW.Status = 'Active';
END //
DELIMITER ;

-- 24. Trigger: Prevent negative payment
DELIMITER //
CREATE TRIGGER trg_CheckPayment
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.Amount < 0 THEN
        SIGNAL SQLSTATE '30000'
        SET MESSAGE_TEXT = 'Payment amount cannot be negative';
    END IF;
END //
DELIMITER ;

-- Trigger to archive student on delete
DELIMITER //
CREATE TRIGGER trg_ArchiveStudent1
BEFORE DELETE ON Student1
FOR EACH ROW
BEGIN
    INSERT INTO Archive_Student1 (StudentID, Name, Email, City, JoinDate)
    VALUES (OLD.StudentID, OLD.Name, OLD.Email, OLD.City, OLD.JoinDate);
END //
DELIMITER ;

-- When student deletes account
DELETE FROM Enrollments WHERE StudentID = 1;
DELETE FROM Payments WHERE StudentID = 1;
DELETE FROM Student1 WHERE StudentID = 1;

select * from student1;
select * from courses;
select * from enrollments;
select * from payments;
