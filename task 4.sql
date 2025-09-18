create database mathfunc;
use mathfunc;
create table employee(
empid int ,
name varchar(30),
dept varchar(10),
salary decimal(10.20),
city varchar(30));

drop table employee;

insert into employee
values(101,'kowsi','HR',45000,'chennai'),(102,'madhu','Dev',50000,'coimbatore'),(103,'maha','Test',60000,'chennai'),(104,'viji','Test',35000,'madhurai'),(105,'siva','tl',50000,'chennai'),(106,'junu','sales',40000,'trichy');
select*from employee;

select * from employee
where name like 'k%';

select* from employee
where name like '%m%';

select*from employee
where name like '%i';

select*from employee
where city like '%i';

select dept,count(dept) AS employee_count,avg(salary) AS avg_salary
from employee group by dept
HAVING count(dept) > 3
order by avg_salary desc;
