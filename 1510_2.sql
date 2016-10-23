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