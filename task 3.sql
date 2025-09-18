create database mathfunc;
use mathfunc;
create table employee(
empid int ,
name varchar(30),
dept varchar(10),
salary decimal(10.20),
city varchar(30));

insert into employee
values(101,'kowsi','HR',45000,'chennai'),(102,'madhu','Dev',50000,'coimbatore'),(103,'maha','Test',60000,'chennai'),(104,'viji','Test',35000,'madhurai'),(105,'siva','tl',50000,'chennai'),(106,'junu','sales',40000,'trichy');
select*from employee;

select count(dept) from employee;

select count(dept) from employee where dept='Hr';

select avg(salary) from employee;

select *from employee order by salary;

SELECT empid,name, dept, salary
FROM employee
ORDER BY dept ASC, salary ASC;

select * from employee order by dept asc, salary asc;
