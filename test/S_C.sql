/*
create table Student
(
	Sno char(9) primary key,
	Sname char(20) unique,
	Ssex char(2),
	Sage smallint,
	Sdept char(20)
);
*/

select* from Student;

insert into Student values('201215121', '李勇', '男', 20, 'CS');
insert into Student values('201215122', '刘晨', '女', 19, 'CS');
insert into Student values('201215123', '王敏', '女', 18, 'MA');
insert into Student values('201215125', '张立', '男', 19, 'IS');

/*                                           
create table Course
(
	Cno char(4) primary key,
	Cname char(40) not null,
	Cpno char(4),
	Ccredit smallint,
	foreign key(Cpno)references Course(Cno)
);
*/

select* from Course;

insert into Course values('2', '数学', null, '2');
insert into Course values('6', '数据处理', null, '2');
insert into Course values('7', 'PASCAL语言', 6, '4')
insert into Course values('4', '操作系统', 6, '3');;
insert into Course values('5', '数据结构', 7, '4');
insert into Course values('1', '数据库', 5, '4');
insert into Course values('3', '信息系统', 1, '4');

/*
create table SC
(
	Sno char(9),
	Cno char(4),
	Grade smallint,
	primary key(Sno, Cno),
	foreign key(Sno)references Student(Sno),
	foreign key(Cno)references Course(Cno),
);
*/

select* from SC;

insert into SC values('201215121', '1', 92);
insert into SC values('201215121', '2', 85);
insert into SC values('201215121', '3', 88);
insert into SC values('201215122', '2', 90);
insert into SC values('201215122', '3', 80);

alter table Student add S_entrance date;

alter table Student alter column Sage int;

select* from Student

alter table Course add unique(Cname);

select* from Course;

/*
create clustered index Stuname on Student(Sname);

create unique index Stuname on Student(Sname desc);

create index i_cname on Course(Cname);
*/

select Sno,Sname from student;
select Sname,Sno,Sdept from Student;
select Sno,Sname,Ssex,Sage,Sdept from Student;
select * from Student;
select Sname,2021-Sage from Student;
select Sname,'Year of Birth:',2021-Sage,lower(Sdept) from Student;
select Sname NAME, 'Year of Birth:' BIRTH, 2021-Sage BIRTHDAY, lower(Sdept) DEPARTMENT from Student;
select Sno from SC;
select distinct Sno from SC;
select Sname from Student where Sdept='CS';
select Sname ,Sage from Student where Sage<20;
select distinct Sno from SC where Grade<60;

select Sname,Sdept,Sage from Student where Sage between 20 and 23;
select Sname,Sdept,Sage from Student where Sage not between 20 and 23;

select Sname,Ssex from Student where Sdept in('CS','MA','IS');
select Sname,Ssex from Student where Sdept not in('CS','MA','IS');

select * from Student where Sno='201215121';
select Sname,Sno,Ssex from Student where Sname like'刘%';
select Sname,Sno,Ssex from Student where Sname like'欧阳_';
select Sname,Sno,Ssex from Student where Sname like'_阳%';
select Sname,Sno,Ssex from Student where Sname not like'刘%';

select Cno,Ccredit from Course where Cname like 'DB\_Design' escape'\';


/*练习1*/
select Sno,Sname,Sage from Student where Ssex='女';
select Cno,Cname,Ccredit from course where Ccredit<4;
/*练习2*/
select Cno,Cname,Ccredit from Course where Ccredit>2 and Ccredit<4;
select Cno,Cname,Ccredit from Course where Ccredit between 2 and 4;
/*练习3*/
select * from Course where Cname like '%AB#%' escape '#';
select Cno,Cname,Ccredit from Course where Cname like '_语%';

select Sno, Cno from SC where Grade is null;

select Sname from Student where Sdept = 'CS' and Sage < 20;

select Sname, Ssex from Student where Sdept = 'IS' or Sdept = 'MA' or Sdept = 'CS';

select Cno, Cname from Course where Cpno is null;

select Sno, Sname, Sdept from Student where Sname like '李%' and Ssex = '女';

select * from Student where Sage < 19 and Ssex = '男'and Sdept = 'CS';

select Sno, Grade from SC where Cno = '3' order by Grade desc; 

select * from Student order by Sdept, Sage desc;

select count(*) from Student;

select count(distinct Sno) from SC;
select count(Sno) from SC;

select avg(Grade) from SC where Cno = '1';

select max(Grade) from SC where Cno = '1';

select sum(Grade), avg(Grade) from SC where Sno = '201215122';

select max(Sage), min(Sage), avg(Sage) from Student where Sdept = 'CS';;

select count(*) from Student where Ssex = '男' and Sdept = 'CS';

select count(distinct Sno) from SC where Grade < 90;

select Cno, count(Sno) from SC group by Cno;

select Sno from SC group by Sno having count(*) > 3;

select Sno, count(*) from SC where Grade >= 85 group by Sno having count(*) > = 3;

select Sno as 学号, count(*) as 门数 from SC group by Sno;

select Ssex as 性别, count(*) as 人数 from Student group by Ssex;

select * from Student, Course; --笛卡尔积
select * from Student cross join Course; --笛卡尔积

select Student.*, SC.* from Student, SC where Student.Sno = Sc.sno;
select Student.*, SC.* from Student inner join SC on Student.Sno = SC.Sno;

select Student.Sno, Sname, Cno, Grade from Student inner join SC on Student.Sno = SC.Sno;

select Student.Sno, Sname, Cname, Grade from Student inner join SC on Student.Sno = SC.Sno inner join Course on SC.Cno = Course.Cno;
select Student.Sno, Sname, Cname, Grade from Student, SC, Course where Student.Sno = SC.Sno and SC.Cno = Course.Cno;

select First.Cno, Second.Cpno from Course First, Course Second where First.Cpno = Second.Cno;

select  First.Cno, First.Cname, First.Cpno, Second.Cname from Course First, Course Second where First.Cpno = Second.Cno;

select sum(Ccredit) from Course, SC where SC.Sno = '201215121'and SC.Cno = Course.Cno; --该学生的学分

select Sno 学号, count(Sno) 门数, sum(Ccredit) 总学分 from Course, SC where SC.Cno = Course.Cno group by Sno; --每个学生的学号、门数、总学分

select Student.Sno, Sname, Ssex, Sage, Sdept, Cno, Grade from Student left outer join SC on (Student.Sno = SC.Sno); --左外部连接

select Sno, Sname, Sdept from Student 
where Sdept in 
	(select Sdept 
	from Student 
	where Sname = '刘晨');
select S1.Sno, S1.Sname, S1.Sdept from Student S1, Student S2 where S1.Sdept = S2.Sdept and S2.Sname = '刘晨';

select Sno, Sname from Student 
where Sno in
	(select Sno 
	from SC 
	where Cno in
		(select Cno 
		from Course 
		where Cname = '信息系统'
	)
);
select Student.Sno, Sname from Student, SC, Course where Student.Sno = SC.Sno and SC.Cno = Course.Cno and Course.Cname = '信息系统';

select Sno, Cno
from SC x
where Grade >= 
	(select avg(Grade) 
	from SC y 
	where y.Sno = x.Sno);

select Sno, Cno 
from SC x 
where Grade >= 
	(select avg(Grade) 
	from SC y 
	where y.Sno = x.Sno);

select Sname, Sage from Student where Sage < any(select Sage from Student where Sdept = 'CS') and Sdept <> 'CS'; --查询其他系中比计算机科学系某一学生年龄小的学生的姓名和年龄
select Sname, Sage
from Student 
where Sage <
	(select max(Sage)
	from Student
	where Sdept = 'CS')
and Sdept <> 'CS';

select Sname, Sage from Student where Sage < all(select Sage from Student where Sdept = 'CS') and Sdept <> 'CS'; --查询其他系中比计算机科学系所有学生年龄小的学生的姓名和年龄
select Sname, Sage
from Student
where Sage <
	(select min(Sage)
	from Student
	where Sdept = 'CS')
and Sdept <> 'CS';

select Sname from Student where exists (select *  from SC where Sno = Student.Sno and SC.Cno = '1') -- 查询所有选修了1号课程的学生姓名
select Sname from Student, SC where Student.Sno = SC.Sno and SC.Cno = '1';

--查询与“刘晨”在同一个系学习的学生
select Sno, Sname, Sdept
from Student S1
where exists
	(select *
	from Student S2
	where S2.Sdept = s1.Sdept and S2.Sname = '刘晨'
	)
and Sname <> '刘晨';

select Sno 学号, sum(Grade) 总分, avg(Grade) 平均分
from SC
where Sno in
	(select Sno
	from Student
	where Student.Sdept = 'CS')
group by Sno;

select Cno 课号, count(Sno) 人数, avg(Grade) 平均分 from SC group by Cno;

insert into Student(Sno, Sname, Ssex, Sdept, Sage) values('201215128', '陈东', '男', 'IS', 18);

insert into Student values('201215126' ,'张成民', '男', 18, 'IS', null);

insert into SC(Sno, Cno) values('201215128', '1');

/*
--对每一个系，求学生的平均年龄，并把结果存入数据库
create table Deptage(Sdept char(15), Avgage numeric(6/*精度*/, 1/*小数位数*/));
insert into Deptage(Sdept, Avgage) select Sdept, avg(Sage) from Student group by Sdept;
select * from Deptage;
*/

/*
--建立学生成绩分析表，包括学号、总分、平均分三个属性列，插入汇总数据
create table Analysis(Sno char(9), Sumgrade char(5), AvgGrade numeric(6, 1));
insert into Analysis(Sno, Sumgrade, AvgGrade) select Sno, sum(Grade), avg(Grade) from SC group by Sno; 
select * from Analysis;
*/

/*
--学生选课情况分析表
create table AnalysisCourse(Sno char(9), Amount int, SumGrade int);
insert into AnalysisCourse(Sno, Amount, SumGrade) select Sno, count(*), sum(Ccredit) from SC, Course where SC.Cno = Course.Cno group by Sno; --（连接查询，同时选多个表查询）
select * from AnalysisCourse;
*/

update Student set Sage = 22 where Sno = '201215121'; --将201215121学生年龄改为22岁

update Student set Sage = Sage + 1; --所有学生年龄增加一岁

update SC set Grade = 0 where Sno in (select Sno from Student where Sdept = 'CS'); --将计算机科学系全系学生成绩清零

update Course set Cname = '高级语言程序设计', Cpno = 6, Ccredit = 5 where Cno in(select Cno from Course where Cno = 8); --将8号课程改名为“高级语言程序设计”， 先行课为6号，学分为5分

update SC set Grade = Grade * 1.1 where Sno in(select Sno from Student where Sdept = 'CS' and Ssex = '女'); --将计算机女生成绩提高10%

update SC set Grade = Grade + 5 where Cno in(select Sno from Course where Cpno is null); --将没有先行课的课程成绩提高5分

delete from Student where Sno = '201215128'; --删除201215128学生记录（删除满足条件的元组）

create view IS_Student as select Sno, Sname, Sage from Student where Sdept = 'IS';
select * from IS_Student;

--定义一个反映学生出生年份的视图
create view BT_S(Sno, Sname, Sbirth) as select Sno, Sname, 2020 - Sage from Student;
select * from BT_S;

--将学生的学号及他的平均成绩定义为一个视图
create view S_G(Sno, Gavg) as select Sno, avg(Grade) from SC group by Sno;
select * from S_G;

--建立名称为v1的视图，查询学生的学号、姓名、课程名、成绩（自然连接）
create view v1(Sno, Sname, Cname, Grade) as select SC.Sno, Sname, Cname, Grade from SC, Student, Course where SC.Cno = Course.Cno and Student.Sno = SC.Sno;
select * from v1;

--建立名称为v2的视图，统计被选课程的课程号、选课人数和平均成绩
create view v2(Cno, Snum, Gavg) as select Cno, count(*), avg(Grade) from SC group by Cno;
select * from v2;