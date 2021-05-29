 create table 职工
 (
	职工号 nchar(6) primary key,
	姓名 varchar(8) not null,
	性别 nchar(1),
	出生日期 date,
	工资 numeric(10, 2)
 )

 select * from 职工

 insert into 职工 values('100001', '李四', '男', '1998-1-1', 5000)