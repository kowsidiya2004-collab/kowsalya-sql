create table teacher(
teacher_id int,
teacher_name varchar(30),
contact bigint,
salary decimal(10,2),
departmentname varchar(10));
drop table teacher;
select * from teacher;

insert into teacher(teacher_id,teacher_name,contact,salary,departmentname)
values(1,'bino',9780894465,60000.50,'hr'),(2,'ruthran',9097865483,70000.60,'tl'),(3,'vanji',748395788,80000.40,'manager'),
(4,'soniya',8097654743,65000.50,'sales'),(5,'vino',9780965633,90000.50,'officer');

create table update_teacherdetails(
teacher_id int,
teacher_name varchar(20),
contact bigint,
oldsalary decimal(10,2),
newsalary decimal(10,2),
dateandTime datetime );
drop table update_teacherdetails;

delimiter $$
create trigger update_trigger
after update 
on teacher
for each row
begin
    insert into update_teacherdetails
    values(old.teacher_id,old.teacher_name,old.contact,old.salary,new.salary,now());
end $$
delimiter ;
drop trigger update_trigger;

update teacher set salary = salary+100001;

select * from update_teacherdetails;

delimiter $$
create procedure update_teacherdetails(in teacher_id int,in newsalary decimal(10,2),out message varchar(50))
begin
    declare currentsalary decimal(10,2);
    
    select salary into currentsalary from update_teacherdetails where teacher_id =teacher_id;

	if newsalary > currentsalary then
    update update_teacherdetails set salary = newsalary where teacher_id = teacher_id;   
    set message = 'teacherdetails updated successfully';
    else
    set message = 'current salary is heigher then new salary';
    end if;
end $$
delimiter ;

select * from update_teacherdetails;

SET @msg = '';
CALL update_teacherdetails(1, 'hr', @msg);
SELECT @msg;
