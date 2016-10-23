

select * from Должности

insert into Должности 
values ('Бухгалтер', 'вести бухгалтерию')

insert into Должности 
values ('Директор', null)

insert into Должности 
values ('Директор', default)

insert into Должности(Название_должности) 
values ('Программист')


insert into Должности 
select 'Тестер', 'тестировать'

insert into Отделы
values ('Отдел разработки'), ('Отдел тестирования'), ('Отдел бухгалтерия'), ('Отдел администрация')

insert into Отделы
values ('Отдел Администрация')

update Отделы 
set Название_отдела = 'Отдел разработки ядра' 
where Название_отдела like 'Отдел разработки'

delete  from Отделы 
where ID_отдела = 1


truncate table Отделы 

select * from Должности
select * from ОТделы

select * from сотрудники

insert into Сотрудники values
('Иванов','02.02.1985', 1,2)
insert into Сотрудники values
('Петров','02.02.1987', 2,4)
insert into Сотрудники values
('Сидорович','02.02.1985', 1,4)


merge  (aka upsert (update/insert))



create table agents
(
id_agent int primary key identity(1,2),
first_name varchar(20),
last_name varchar(20),
salary smallmoney,
category char check (category in('a','b','c'))
)
go
insert into agents values
('Качур','Кач', 30000, 'a'),
('Ермаков','Ермак', 30000, 'a'),
('Шварц','Шварц', 30000, 'b'),
('Козлов','Иван', 30000, 'c'),
('Якубович','Якуб', 30000, 'b')

select * from managers
select * from agents

merge managers as man 
using (select * from agents) as ag
on (man.id_manager = ag.id_agent)
when matched then 
	update set man.first_name = ag.first_name, man.last_name = ag.last_name
when not matched then
	insert (first_name, last_name, salary,category) values (ag.first_name, ag.last_name, ag.salary, ag.category)
;


merge managers as man 
using (select * from agents) as ag
on (man.id_manager = ag.id_agent)
when matched and category in('a','c') then 
	update set man.first_name = ag.first_name, man.last_name = ag.last_name
when not matched then
	insert (first_name, last_name, salary,category) values (ag.first_name, ag.last_name, ag.salary, ag.category)
;


