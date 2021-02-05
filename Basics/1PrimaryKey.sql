create database testdb1;
use testdb1;

CREATE TABLE participants(
      id int primary key,
      Fullname varchar(20) 
);

insert into participants values(1,'tarun') ,(2,'jeff'),(3,'vicky');

select * from participants;

insert into participants values(4,NULL);
insert into participants values(5,'');

create table salary
(
salaray int ,
id int ,
foreign key (id)
references participants(id)
)
insert into salary values(35000,1),(30000,2),(24000,3);
select * from salary;
insert into salary values(35000,5);

delete from participants where id = 5;

