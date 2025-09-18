create database diya;

use diya;
create table owner(
veg_id int,
veg_name varchar(20),
veg_price int,
sales_id int);

select * from owner;

insert into owner (veg_id,veg_name,veg_price,sales_id)
values(101,'apple',200,2035);

insert into owner (veg_id,veg_name,veg_price,sales_id)
values(102,'orange',300,2042);

insert into owner (veg_id,veg_name,veg_price,sales_id)
values(103,'pomegranate kesar',400,2049);

insert into owner (veg_id,veg_name,veg_price,sales_id)
values(104,'kiwi',250,2030);

insert into owner (veg_id,veg_name,veg_price,sales_id)
values(105,'mango',450,2055);

select * from owner;

create table owner2(
veg_name varchar(20),
veg_id int,
cus_id int,
price int,
sal_id int);

select * from owner2;

insert into owner2(veg_name,veg_id,cus_id,price,sal_id)
values('guava',101,00001,100,2010);

insert into owner2(veg_name,veg_id,cus_id,price,sal_id)
values('grapes',102,00002,150,2050);

insert into owner2(veg_name,veg_id,cus_id,price,sal_id)
values('mosambi',103,00003,220,2080);

insert into owner2(veg_name,veg_id,cus_id,price,sal_id)
values('sapota',104,00004,250,2044);

insert into owner2(veg_name,veg_id,cus_id,price,sal_id)
values('pinapple',105,00005,300,2048);

select * from owner;
select * from owner2;

select o.veg_id,o.veg_name,o.sales_id,o2.veg_name,o2.veg_id,o2.cus_id,o2.price,o2.sal_id
from owner o inner join owner2 o2
on o.veg_id = o2.veg_id

select o.veg_id,o.veg_name,o.sales_id,o2.veg_name,o2.veg_id,o2.cus_id,o2.price,o2.sal_id
from owner o left join owner2 o2
on o.veg_id = o2.veg_id
union all

select o.veg_id,o.veg_name,o.sales_id,o2.veg_name,o2.veg_id,o2.cus_id,o2.price,o2.sal_id
from owner o right join owner2 o2
on o2.veg_name = o2.veg_name
