Transact SQL
ANSI SQL стандарт

Transact-SQL (T-SQL)
PL-SQL
MySql
......


Transact-SQL:
DML Data Manipulation Lang
insert
update
delete

DDL Data Definition language
create (database table view proc trigger)
alter
drop 

DQL Data Query language
select 

DCL Data control language
grant (grant select to vasya on table1)
deny 
revoke

CCL Common Command Language 
declare
set
if 
while




-- комментарий
/*
многострочный 
коммент
*/


declare @x int=34, @y int; 
set @x=45;
set @y=@x*@x+100; 
print @y;
select @y;



типы данных

логический
bit 1б

целочисленные
tinyint   1б
smallint  2б
int       4б
bigint    8б 

1бит - 1/0
2бит - 00 01 10 11
3бит - 000 001 010 011 100 101 110 111
8бит - 2Ё8 = 256    -127....128 
00000000

нецелые
фикс точка
decimal(5,3) 12,345
numeric(5,3)
dec (5,3)
num (5,3)

плавающая точка
float(56)   0.3Ё5
real = float(24)

валютные
smallmoney 4б   12.0000
money      8б	12.0000

дата и время
smalldatetime 4б
datetime	  8б 
date
time
datetimeoffset
declare @d datetimeoffset
select @d=GETDATE()
print @d



declare @d datetime
set @d = '14/12/2014'
set @d = GETDATE();
print @d;

текстовые
char 
char(8000)
varchar(10) 
nchar(4000)   --unicode
nvarchar(10)
nchar(max) -- 2Gb
text  --устаревш
ntext --устаревш
.....

бинарные
binary
varbinary(2000)


специфичные
sql_variant резиновый
uniqueidentifier 

declare @id uniqueidentifier
set @id = NEWID()
--set @id = NEWSEQUENTIALID()
print @id

xml
spatial 
geometry 
geography 
.....


declare @d datetime, @d2 datetime
set @d= '07/08/1985'
set @d2= GETDATE();
select DATEDIFF(ss, @d,@d2)

select dateadd(yy, 10, @d2)
select DATEPART(DAY, GETDATE())
select DATENAME(WEEKDAY, GETDATE())


len
ltrim 
rtrim
upper
lower
select substring('asdfghjkl', 2,2)
.......


abs
sin
cos
tan
cot
atan
degrees
radians
power(3,2)
log 
log10(10000)
sqrt
round(@x, 2)
ceiling
floor
...........


Declare @temp float;
set @temp =-90;

if @temp>0 
begin
 print 'тепло!!!!!'
end
else 
begin
 print 'холодина!!!'
end


Declare @temp float;
set @temp =60;
if @temp>=0 
 print 'тепло!!!!!'
else 
 begin
 print 'холодина!!!'
 print 'оденься теплее'
 end


циклы
for определ кол-во итерации, нет в sql
while с неопредел кол-вом итераций с предусловием
do while с неопредел кол-вом итераций с постусловием


declare @x int
set @x=0

while @x<100
begin
 set @x = @x+2;
 if @x=18 or @x=45 continue;
 print @x;
end



begin
 set @x = @x+2;
 print @x;
end
while @x<100

for (i=1; i<100; i=i+1)
begin
end

+-*><  <> !=  and or not !


break прерывает весь цикл
continue прерывает текущую итерацию цикла



declare @s int
declare @i int
set @s=0
set @i=0

while @i<1000
begin
 set @s = @s + @i
 set @i= @i+1
end

print @s


declare @s int
declare @i int
set @s=0
set @i=0

while @i<1000
begin
 if  @i%10 = 0 
	begin
		set @i= @i+1
		continue;
    end
 set @s = @s + @i
 set @i= @i+1
end

print @s


1
11
111
1111
11111
111111

declare @s int 
set @s=0
while @s<10
begin
 print replicate ('1', @s)
 set @s=@s+1
end

declare @s int, @i int, @str varchar(20)
set @s=0
set @str=''
while @s<10
begin
 set @str=''
 set @i=0
 while @i<@s
	begin
	 set @str=@str+'1'
	 set @i = @i+1
	end
 print @str
 set @s=@s+1
end

declare @width int, @s int, @i int, @j int, @str varchar(20)
 set @width = 10
 set @j=0 
 set @i=0
 set @str=''
 while @j<@width --цикл по строкам
	begin
		while @i<(@width-@j) --цикл по символам
			begin
              set @str = @str+' ' 
              set @i=@i+1 
			end 
			set @i=0
		while @i<(@j+1)*2-1 --цикл по символам 2
			begin
              set @str = @str+'1'  
              set @i=@i+1
			end 
			set @i=0
	print @str	
	set @j=@j+1
	set @str =''
	end -- ~ цикл по строкам




     1
    111
   11111
  1111111
 111111111
 
 
 
 
 
 
 
 
         1
        111
       12221
      1234321





--физ структура БД

первичный файл данных mdf    1
вторичные файлы данных ndf   >=0
файлы журнала транзакций ldf >=1

файловая группа
файловая группа primary



create database accp1510_2
on primary
(name = 'f1', filename='C:\temp2\f1.mdf', size=10Mb, maxsize=100Mb, filegrowth=5Mb),
(name = 'f2', filename='C:\temp2\f2.ndf', size=10Mb, maxsize=100Mb, filegrowth=5Mb),
(name = 'f3', filename='C:\temp2\f3.ndf', size=10Mb, maxsize=100Mb, filegrowth=5Mb),
filegroup fg1
(name = 'f4', filename='C:\temp2\f4.ndf', size=10Mb, maxsize=100Mb, filegrowth=5Mb),
(name = 'f5', filename='C:\temp2\f5.ndf', size=10Mb, maxsize=100Mb, filegrowth=5Mb),
(name = 'f6', filename='C:\temp2\f6.ndf', size=10Mb, maxsize=100Mb, filegrowth=5Mb)
log on
(name = 'fl1', filename='C:\temp2\fl1.ldf', size=10Mb, maxsize=100Mb, filegrowth=5Mb),
(name = 'fl2', filename='C:\temp2\fl2.ldf', size=10Mb, maxsize=100Mb, filegrowth=5Mb)
go
use accp1510


drop database accp1510_

alter database accp1510 
add file
(name = 'f7', filename='C:\temp2\f7.ndf', size=15Mb, maxsize=100Mb, filegrowth=5Mb) to filegroup fg1

alter database accp1510 
add filegroup fg2


alter database accp1510 
modify file f7 to filegroup fg2


alter database accp1510
remove file f7

sp_dboption 'accp1510', 'read_only', 'false'
sp_dboption 'accp1510', 'read_only' --устаревшая проц


alter database accp1510
set read_write


create database accp1510_ss2
on
(name = 'f1', filename='C:\temp2\f12.ss'),
(name = 'f2',filename='C:\temp2\f22.ss'),
(name = 'f3',filename='C:\temp2\f32.ss'),
(name = 'f4',filename='C:\temp2\f42.ss'),
(name = 'f5',filename='C:\temp2\f52.ss'),
(name = 'f6',filename='C:\temp2\f62.ss')
as snapshot of accp1510

create table testt
(col1 varchar(10))
go
insert testt values ('qwerty')
select * from testt
update testt set col1='dirtydata'

use accp1510
go
select * from testt

use accp1510_ss2
go
select * from testt

update accp1510.dbo.testt set col1 = (select col1 from accp1510_ss2.dbo.testt)
--или restore


use accp1510
go

create tAbLe [имя т]
(
 "ст1" тип ограничения,
 ст2 тип ограничения,
 ...
 ограничения_на_уровне_табл
) on filegroup файлов_группа

primary key только 1 pk, пусть иногда и составной
identity(100,-1) счётчик
unique 
not null запрет пустых значений
null по умолч
default getdate() 
check Age>18
check Category in ('a', 'b', 'c')
check (Дата_получ < Дата_возвр)
foreign key references Должности(ID_должности) 
foreign key references Должности(ID_должности) on delete cascade | no action | set null | set default
on update cascade | no action | set null | set default




create table Должности
(
 ID_Должности tinyint primary key identity(1,1),
 Название_должности varchar(40) not null,
 Базовый_оклад money check (Базовый_оклад>7000)
 )

select * from Должности

create table Отделы
(
 ID_Отдела tinyint primary key identity(1,1),
 Название_отдела varchar(40) not null,
 Категория char(1),
 constraint cat_constr check (Категория in ('a','b','c')),
 Телефон char(6)
)

select * from отделы

create table Сотрудники
(
 ID_Сотрудника int primary key identity(1,1),
 Фамилия varchar(40) not null,
 Имя varchar(40) not null,
 Отчество varchar(40),
 Дата_рождения date, 
 Дата_найма date default getdate(),
 [Индивид. коэффициент] float(10)
 )
 
 alter table Отделы add ID_Начальника int 
 alter table Отделы add constraint ref_boss foreign key (ID_Начальника) 
 references Сотрудники(ID_сотрудника)
 
 
 select * from Сотрудники
 
 
 alter table Сотрудники
 add ID_Должности tinyint 
 foreign key references Должности(ID_Должности) on delete cascade default 1
 
 alter table Сотрудники 
 add ID_Отдела tinyint
 
 alter table Сотрудники
 add constraint ref_dep foreign key (ID_Отдела) references Отделы(ID_Отдела)on delete cascade
 
 имя_сервера.имя_бд.имя_схемы.имя_объекта
 
 
 alter table сотрудники
 alter column ID_Отдела int 
 
 sp_help Сотрудники
 
 alter table сотрудники
 nocheck constraint ref_dep --выкл ограничение
 alter table сотрудники
 check constraint ref_dep --выкл ограничение
 
 alter table сотрудники
 drop constraint ref_dep --удалить ограничение 
 
 sp_rename сотр, 'сотрудники'
 
 alter table Сотрудники
 rename  to 'сотр'
 
 
 
 DML
 
 
 DQL 
 Date Query Language
 select 
 
 
 select GETDATE()
 print getdate()
 
 select GETDATE() -- from dual в оракл
 
 declare @df float=0.5 
 select 56*@df+100/300.0 * COS(@df), 'это результат выражения!!'
 select 56*@df+100/300.0 * COS(@df) as  'col1', 'это результат выражения!!' as col2
 
 
 use accp1510
 go
 select * from Должности -- * не всегда приветствуется в плане переносимости и поддерживаемости
 select ID_Должности, '- это должность-', Название_должности, (Базовый_оклад/61.5)*0.86 as [нетто] from Должности 
 select * from Должности  where Базовый_оклад>50000
 select * from Должности  where Базовый_оклад>50000 and LEN(Название_должности)>10
 select distinct Название_Должности from Должности
 select all Название_Должности from Должности --умолч
 select distinct Название_Должности from Должности order by Название_должности  asc  --desc
 select distinct Название_Должности, Базовый_оклад from Должности order by Название_должности  asc, Базовый_оклад desc
 select top 3 Название_Должности from Должности order by Базовый_оклад desc
 select top 33 percent Название_Должности from Должности order by Базовый_оклад desc
 select top 3 Название_Должности from Должности order by NEWID()  
 select   Название_Должности from Должности tablesample (30 percent)  order by NEWID()  
 
select Имя, 'по фамилиии ' as '===========' , Фамилия into new_t from сотрудники 
select * from new_t

select * from Отделы

declare @code int
set @code =64
print 'я из региона: ' + 
case @code 
	when 64 then ' Саратов' 
	when 63 then ' Cамара' 
	when 58 then ' Пенза'
	when 34 then ' Волгоград'
	else 'вообще непонятно откуда!!'
end 
  
select Название_отдела, case Категория when 'a' then 'высшая' when 'b' then 'обычная' end as Название_категории from Отделы

--множественные операции
select название_должности from Должности
union --all   --объединение
select название_отдела  from Отделы
select 'программист'

select название_должности from Должности
union all  
select 'программист'

select название_должности from Должности
except 
(select 'программист'
except 
select 'бухгалтер')

select название_должности from Должности
except 
select 'программист'
except 
select 'бухгалтер'

select название_должности from Должности
intersect  
select 'программист'

select * from сотрудники


join --соединения 

внутреннее inner join
внешние outer join 
	левое left outer join
	правое right outer join
	полное full outer join
перекрёстное (декартово произведение) cross join 

эквисоединение/ неэквисоединение
самосоединение 
простое/составное 

	
select * from отделы
select * from сотрудники

select сотрудники.Фамилия, сотрудники.Имя, Отделы.Название_отдела, Отделы.Категория
from сотрудники inner join Отделы on сотрудники.ID_Отдела = Отделы.ID_Отдела --только состоявшиеся пары

select сотрудники.Фамилия, сотрудники.Имя, Отделы.Название_отдела, Отделы.Категория
from сотрудники left join Отделы on сотрудники.ID_Отдела = Отделы.ID_Отдела -- все записи из подчин табл и соотв из главной 

select сотрудники.Фамилия, сотрудники.Имя, Отделы.Название_отдела, Отделы.Категория
from сотрудники right join Отделы on сотрудники.ID_Отдела = Отделы.ID_Отдела -- все записи из главн табл и соотв из подчин 

select сотрудники.Фамилия, сотрудники.Имя, Отделы.Название_отдела, Отделы.Категория
from сотрудники full join Отделы on сотрудники.ID_Отдела = Отделы.ID_Отдела -- левое и правое

select сотрудники.Фамилия, сотрудники.Имя, Отделы.Название_отдела, Отделы.Категория
from сотрудники cross join Отделы  --каждая с каждой 

select сотрудники.Фамилия, сотрудники.Имя, Отделы.Название_отдела, Отделы.Категория
from сотрудники, Отделы --каждая с каждой 

select сотрудники.Фамилия, сотрудники.Имя, Отделы.Название_отдела, Отделы.Категория
from сотрудники, Отделы where Отделы.ID_Отдела = сотрудники.ID_Отдела  --устаревш 


select сотрудники.Фамилия, сотрудники.Имя, Отделы.Название_отдела, Отделы.Категория, должности.Название_должности
from сотрудники inner join Отделы on сотрудники.ID_Отдела = Отделы.ID_Отдела--только состоявшиеся пары
inner join Должности on Должности.ID_Должности = Сотрудники.ID_должности


select * from Сотрудники
alter table Сотрудники add ID_босса  int 
foreign key references Сотрудники(ID_сотрудника) default 2 with values

select Фамилия, Имя, 'подчиняется ---> ', Фамилия, Имя
from сотрудники left join сотрудники on сотрудники.ID_босса = сотрудники.ID_Сотрудника --не пойдёт, надо уточнить 

select сотр.Фамилия, сотр.Имя, 'подчиняется ---> ', нач.Фамилия, нач.Имя
from сотрудники as сотр left join сотрудники as нач on сотр.ID_босса = нач.ID_Сотрудника

select сотр.Фамилия as [Фамилия сотрудника], сотр.Имя as [Имя сотрудника], 'подчиняется ---> ' as [-->],
 нач.Фамилия as [Фамилия его начальника], нач.Имя as [Имя его начальника]
from сотрудники as сотр left join сотрудники as нач on сотр.ID_босса = нач.ID_Сотрудника


--агрегатные функции 

sum(оклад)
avg 
min
max
count(ст1)
count(*)
stdev(ст1)

select Стаж from Сотрудники
select AVG(Стаж), SUM(Стаж) from Сотрудники

select * from Сотрудники
select GETDATE()

sp_help СОтрудники

--группировка 
select [Индивид. коэффициент], COUNT(*) as 'количество сотр', AVG(Стаж)/12.0 as 'средний стаж в годах'
from сотрудники group by [Индивид. коэффициент]


select [Индивид. коэффициент]/*, Дата_найма*/, COUNT(*) as 'количество сотр', AVG(Стаж/12.0) as 'средний стаж в годах'
from сотрудники group by [Индивид. коэффициент]


select [Индивид. коэффициент], COUNT(*) as 'количество сотр', AVG(Стаж/12.0) as 'средний стаж в годах'
from сотрудники 
where ABS(DATEDIFF(YY, Дата_рождения, GETDATE()))>18
group by [Индивид. коэффициент]
having AVG(Стаж/12.0)> 0

select * from Сотрудники

на какую сумму продал каждый продавец за последние 30 дней?
на какую сумму продал каждый продавец (мужского пола) за последние 30 дней?



select ID_Должности, count(*), AVG(Стаж) from сотрудники
group by  ID_Должности

select Сотрудники.ID_Должности, count(*), AVG(СОтрудники.Стаж) 
from сотрудники inner join Должности on сотрудники.ID_Должности = Должности.ID_Должности
group by  Сотрудники.ID_Должности

select Должности.Название_должности, count(*), AVG(СОтрудники.Стаж) 
from сотрудники inner join Должности on сотрудники.ID_Должности = Должности.ID_Должности
group by  Должности.Название_должности --возможны повторения значений поля, по которому группируем

select /*Должности.ID_Должности,*/ Должности.Название_должности, count(*), AVG(СОтрудники.Стаж) 
from сотрудники inner join Должности on сотрудники.ID_Должности = Должности.ID_Должности
group by  Должности.ID_Должности, Должности.Название_должности

 



insert Должности values ('программист', 45000)
select * from Должности
select * from сотрудники
insert сотрудники values ('Кузьминых','Егорка', 'Агафоныч', null, null, 3, 6,2,2)
insert сотрудники values ('Минкуз','Егор', 'Палыч', null, null, 3, 1,2,2)


--вложенные запросы 

select * from сотрудники


declare @sr float
select @sr =  AVG(Стаж) from сотрудники 
select *, @sr from сотрудники where Стаж > @sr

select * from сотрудники Where Стаж > (select AVG(Стаж) from сотрудники)

select *, (select AVG(Стаж) from сотрудники) as средний_стаж from сотрудники 
Where Стаж > (select AVG(Стаж) from сотрудники)

select * from (select Название_должности from Должности) -- не во всех версиях

select ID_Должности, Название_должности from Должности 
where ID_Должности in (2,5,3)

select ID_Должности, Название_должности from Должности 
where ID_Должности in (select distinct ID_Должности from сотрудники)

все товары, у которых цена отличается от средней не более чем на 10% 


select * from сотрудники 
Where	Стаж < (select AVG(Стаж)*1.1 from сотрудники) 
			and  
		Стаж > (select AVG(Стаж)*0.9 from сотрудники)
		
select * from сотрудники 
Where	Стаж between (select AVG(Стаж)*0.9 from сотрудники) and (select AVG(Стаж)*1.1 from сотрудники)		


		
select * from сотрудники 
Where	Стаж  (select AVG(Стаж)*0.1 from сотрудники)


declare @x int, @y int, @res float
set @x =9;
set @y=4;
set @res = cast(@x as float)/@y+100
print @res

print 5.0/6
результат выражения приводится к самому старшему типу в выражении




declare @price money, @discount float
set @price = 3000; set @discount=00.03
select @price - @price* isnull(@discount, 0)
-- предусматриваем подмену значения если вдруг оно окажется пустым


--вложенные коррелированные запросы

select * from сотрудники Where Стаж > (select AVG(Стаж) from сотрудники)

select * from сотрудники Where Стаж > 
(select AVG(Стаж) from сотрудники where ID_Сотрудника <> ID_Сотрудника)


select * from сотрудники Where Стаж > 
(select AVG(Стаж) from сотрудники where сотрудники.ID_Сотрудника <> сотрудники.ID_Сотрудника)


select Фамилия, Стаж, (select AVG(Стаж) from сотрудники as сотр_внутр where сотр_внутр.ID_Сотрудника <> сотр_вненшн.ID_Сотрудника) from сотрудники as сотр_вненшн Where Стаж > 
(select AVG(Стаж) from сотрудники as сотр_внутр where сотр_внутр.ID_Сотрудника <> сотр_вненшн.ID_Сотрудника)


select Фамилия, Стаж, 
(select AVG(Стаж) from сотрудники as сотр_внутр where сотр_внутр.ID_Сотрудника <> сотр_вненшн.ID_Сотрудника) from сотрудники as сотр_вненшн 




select Название_должности from Должности where
(select COUNT(*) from сотрудники where сотрудники.ID_Должности = Должности.ID_Должности)>=2
 
set implicit_transactions on

delete from Отделы where 
(select COUNT(*) from сотрудники where сотрудники.ID_Отдела = Отделы.ID_Отдела)=0

select @@VERSION

rollback
select * from Отделы


удалить товары с количеством продаж менее чем 5
удалить товары с количеством продаж за последние 10 дней менее чем 5



ранжирующие функции
rank
dense_rank
ntile
row_number  

select  Фамилия, Стаж , ROW_NUMBER() over (order by Стаж desc) from Сотрудники order by Фамилия
select  Фамилия, Стаж , RANK() over (order by Стаж desc) from Сотрудники  
select  Фамилия, Стаж , DENSE_RANK() over (order by Стаж desc) from Сотрудники  
select  Фамилия, Стаж , NTILE(4) over (order by Стаж desc) from Сотрудники  


select * from Сотрудники
select  Фамилия, Стаж , RANK() over (order by Стаж desc) from Сотрудники  

select [Индивид. коэффициент], Фамилия, Стаж , RANK() over (partition by [Индивид. коэффициент] order by Стаж desc)
 from Сотрудники  order by [Индивид. коэффициент]
 
 select Фамилия, AVG(стаж)  from сотрудники --не прокатит!!
 
 select Фамилия, AVG(стаж) over()  from сотрудники
 select ID_отдела, Фамилия, AVG(стаж) over(partition by ID_отдела)  from сотрудники 
 
 --динамический SQL
 
 DECLARE @x int
 set @x=5
	select Фамилия, имя from сотрудники 
	where Стаж>@X
	
	
	declare @dyn_query varchar(200), @param varchar(30)
	set @param = 'фамилия'
	set @dyn_query = 'select '+ @param + ' from сотрудники '
	print @dyn_query
	exec (@dyn_query)
	 
 ...
 
 
 --представления VIEW
 
  
 
alter view ключевые_показатели_должностей
 as
select Сотрудники.ID_Должности, count(*) as численность, AVG(СОтрудники.Стаж) as суммарный_стаж
from сотрудники inner join Должности on сотрудники.ID_Должности = Должности.ID_Должности
group by  Сотрудники.ID_Должности

материализованное представление - если есть кластерный  индекс 

преимущества представлений
повышается модульность, удобство сопровожд
выше безопасность и гибче разграничение прав доступа
скорость выше

ограничения представлений 
без
into 
compute 
compute by 
order by 
вложенность до 32 уровней
количество столбцов до 1024
изменение, добавление - только в 1 из базовых таблиц 
удаление - только в 1 из базовых таблиц 




select численность from ключевые_показатели_должностей



select * from ключевые_показатели_должностей inner join сотрудники 
on ключевые_показатели_должностей.ID_Должности=Сотрудники.ID_Должности



alter view список_сотр
--with encryption -- скрытие исходного кода представления 
--, schemabinding -- привязка к схеме 
 as
select dbo.сотрудники.Фамилия, dbo.сотрудники.Имя, dbo.Отделы.Название_отдела, dbo.Отделы.Категория, 
dbo.должности.Название_должности
from dbo.сотрудники inner join dbo.Отделы on dbo.сотрудники.ID_Отдела = dbo.Отделы.ID_Отдела--только состоявшиеся пары
inner join dbo.Должности on dbo.Должности.ID_Должности = dbo.Сотрудники.ID_должности
--order by Фамилия--нельзя!!
 
 
sp_helptext список_сотр 
select * from syscomments
 
 select * from  список_сотр  order by Фамилия
 
 
 
select * from sys.tables


--курсоры 
обрабатывает набор данных построчно


declare cur1 cursor
local --global 
forward_only --scroll
--static --keyset --dynamic       --fast_forward
read_only optimistic scroll_locks 
for update of st1, st2, st3
for
select ........... 


open cur1

fetch first from cur1 
last
next
prior 
absolute 4
absolute -4
absolute 0
relative 0
relative -3
relative 3 

fetch first from cur1 into @x, @y, @z
update table1 set st1= new_val, st2=new_val where CURRENT of cur1 


close cur1
open cur1
close cur1 
deallocate cur1
 
а теперь пример!!!!!

declare cur1 cursor
global
scroll
keyset
optimistic
for 
select dbo.сотрудники.Фамилия, dbo.сотрудники.Имя, dbo.Отделы.Название_отдела,   
dbo.должности.Название_должности
from dbo.сотрудники inner join dbo.Отделы on dbo.сотрудники.ID_Отдела = dbo.Отделы.ID_Отдела--только состоявшиеся пары
inner join dbo.Должности on dbo.Должности.ID_Должности = dbo.Сотрудники.ID_должности


open cur1 

fetch first from cur1 
while @@FETCH_STATUS=0
begin
waitfor delay '00:00:02:00'
fetch next from cur1 
end


declare @x varchar(30), @y varchar(30), @z varchar(30), @r varchar(30)
fetch first from cur1 into @x, @y, @z, @r
print @x+'   '+@y+'   '+@z+'   '+@r
while @@FETCH_STATUS=0
begin
waitfor delay '00:00:00:02'
fetch next from cur1 into @x, @y, @z, @r
print @x+'   '+ @y+'   '+@z+'   '+@r
end


close cur1
deallocate cur1