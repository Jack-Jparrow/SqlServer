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

insert into Student values('201215121', '����', '��', 20, 'CS');
insert into Student values('201215122', '����', 'Ů', 19, 'CS');
insert into Student values('201215123', '����', 'Ů', 18, 'MA');
insert into Student values('201215125', '����', '��', 19, 'IS');

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

insert into Course values('2', '��ѧ', null, '2');
insert into Course values('6', '���ݴ���', null, '2');
insert into Course values('7', 'PASCAL����', 6, '4')
insert into Course values('4', '����ϵͳ', 6, '3');;
insert into Course values('5', '���ݽṹ', 7, '4');
insert into Course values('1', '���ݿ�', 5, '4');
insert into Course values('3', '��Ϣϵͳ', 1, '4');

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
select Sname,Sno,Ssex from Student where Sname like'��%';
select Sname,Sno,Ssex from Student where Sname like'ŷ��_';
select Sname,Sno,Ssex from Student where Sname like'_��%';
select Sname,Sno,Ssex from Student where Sname not like'��%';

select Cno,Ccredit from Course where Cname like 'DB\_Design' escape'\';


/*��ϰ1*/
select Sno,Sname,Sage from Student where Ssex='Ů';
select Cno,Cname,Ccredit from course where Ccredit<4;
/*��ϰ2*/
select Cno,Cname,Ccredit from Course where Ccredit>2 and Ccredit<4;
select Cno,Cname,Ccredit from Course where Ccredit between 2 and 4;
/*��ϰ3*/
select * from Course where Cname like '%AB#%' escape '#';
select Cno,Cname,Ccredit from Course where Cname like '_��%';

select Sno, Cno from SC where Grade is null;

select Sname from Student where Sdept = 'CS' and Sage < 20;

select Sname, Ssex from Student where Sdept = 'IS' or Sdept = 'MA' or Sdept = 'CS';

select Cno, Cname from Course where Cpno is null;

select Sno, Sname, Sdept from Student where Sname like '��%' and Ssex = 'Ů';

select * from Student where Sage < 19 and Ssex = '��'and Sdept = 'CS';

select Sno, Grade from SC where Cno = '3' order by Grade desc; 

select * from Student order by Sdept, Sage desc;

select count(*) from Student;

select count(distinct Sno) from SC;
select count(Sno) from SC;

select avg(Grade) from SC where Cno = '1';

select max(Grade) from SC where Cno = '1';

select sum(Grade), avg(Grade) from SC where Sno = '201215122';

select max(Sage), min(Sage), avg(Sage) from Student where Sdept = 'CS';;

select count(*) from Student where Ssex = '��' and Sdept = 'CS';

select count(distinct Sno) from SC where Grade < 90;

select Cno, count(Sno) from SC group by Cno;

select Sno from SC group by Sno having count(*) > 3;

select Sno, count(*) from SC where Grade >= 85 group by Sno having count(*) > = 3;

select Sno as ѧ��, count(*) as ���� from SC group by Sno;

select Ssex as �Ա�, count(*) as ���� from Student group by Ssex;

select * from Student, Course; --�ѿ�����
select * from Student cross join Course; --�ѿ�����

select Student.*, SC.* from Student, SC where Student.Sno = Sc.sno;
select Student.*, SC.* from Student inner join SC on Student.Sno = SC.Sno;

select Student.Sno, Sname, Cno, Grade from Student inner join SC on Student.Sno = SC.Sno;

select Student.Sno, Sname, Cname, Grade from Student inner join SC on Student.Sno = SC.Sno inner join Course on SC.Cno = Course.Cno;
select Student.Sno, Sname, Cname, Grade from Student, SC, Course where Student.Sno = SC.Sno and SC.Cno = Course.Cno;

select First.Cno, Second.Cpno from Course First, Course Second where First.Cpno = Second.Cno;

select  First.Cno, First.Cname, First.Cpno, Second.Cname from Course First, Course Second where First.Cpno = Second.Cno;

select sum(Ccredit) from Course, SC where SC.Sno = '201215121'and SC.Cno = Course.Cno; --��ѧ����ѧ��

select Sno ѧ��, count(Sno) ����, sum(Ccredit) ��ѧ�� from Course, SC where SC.Cno = Course.Cno group by Sno; --ÿ��ѧ����ѧ�š���������ѧ��

select Student.Sno, Sname, Ssex, Sage, Sdept, Cno, Grade from Student left outer join SC on (Student.Sno = SC.Sno); --���ⲿ����

select Sno, Sname, Sdept from Student 
where Sdept in 
	(select Sdept 
	from Student 
	where Sname = '����');
select S1.Sno, S1.Sname, S1.Sdept from Student S1, Student S2 where S1.Sdept = S2.Sdept and S2.Sname = '����';

select Sno, Sname from Student 
where Sno in
	(select Sno 
	from SC 
	where Cno in
		(select Cno 
		from Course 
		where Cname = '��Ϣϵͳ'
	)
);
select Student.Sno, Sname from Student, SC, Course where Student.Sno = SC.Sno and SC.Cno = Course.Cno and Course.Cname = '��Ϣϵͳ';

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

select Sname, Sage from Student where Sage < any(select Sage from Student where Sdept = 'CS') and Sdept <> 'CS'; --��ѯ����ϵ�бȼ������ѧϵĳһѧ������С��ѧ��������������
select Sname, Sage
from Student 
where Sage <
	(select max(Sage)
	from Student
	where Sdept = 'CS')
and Sdept <> 'CS';

select Sname, Sage from Student where Sage < all(select Sage from Student where Sdept = 'CS') and Sdept <> 'CS'; --��ѯ����ϵ�бȼ������ѧϵ����ѧ������С��ѧ��������������
select Sname, Sage
from Student
where Sage <
	(select min(Sage)
	from Student
	where Sdept = 'CS')
and Sdept <> 'CS';

select Sname from Student where exists (select *  from SC where Sno = Student.Sno and SC.Cno = '1') -- ��ѯ����ѡ����1�ſγ̵�ѧ������
select Sname from Student, SC where Student.Sno = SC.Sno and SC.Cno = '1';

--��ѯ�롰��������ͬһ��ϵѧϰ��ѧ��
select Sno, Sname, Sdept
from Student S1
where exists
	(select *
	from Student S2
	where S2.Sdept = s1.Sdept and S2.Sname = '����'
	)
and Sname <> '����';

select Sno ѧ��, sum(Grade) �ܷ�, avg(Grade) ƽ����
from SC
where Sno in
	(select Sno
	from Student
	where Student.Sdept = 'CS')
group by Sno;

select Cno �κ�, count(Sno) ����, avg(Grade) ƽ���� from SC group by Cno;

insert into Student(Sno, Sname, Ssex, Sdept, Sage) values('201215128', '�¶�', '��', 'IS', 18);

insert into Student values('201215126' ,'�ų���', '��', 18, 'IS', null);

insert into SC(Sno, Cno) values('201215128', '1');

/*
--��ÿһ��ϵ����ѧ����ƽ�����䣬���ѽ���������ݿ�
create table Deptage(Sdept char(15), Avgage numeric(6/*����*/, 1/*С��λ��*/));
insert into Deptage(Sdept, Avgage) select Sdept, avg(Sage) from Student group by Sdept;
select * from Deptage;
*/

/*
--����ѧ���ɼ�����������ѧ�š��ܷ֡�ƽ�������������У������������
create table Analysis(Sno char(9), Sumgrade char(5), AvgGrade numeric(6, 1));
insert into Analysis(Sno, Sumgrade, AvgGrade) select Sno, sum(Grade), avg(Grade) from SC group by Sno; 
select * from Analysis;
*/

/*
--ѧ��ѡ�����������
create table AnalysisCourse(Sno char(9), Amount int, SumGrade int);
insert into AnalysisCourse(Sno, Amount, SumGrade) select Sno, count(*), sum(Ccredit) from SC, Course where SC.Cno = Course.Cno group by Sno; --�����Ӳ�ѯ��ͬʱѡ������ѯ��
select * from AnalysisCourse;
*/

update Student set Sage = 22 where Sno = '201215121'; --��201215121ѧ�������Ϊ22��

update Student set Sage = Sage + 1; --����ѧ����������һ��

update SC set Grade = 0 where Sno in (select Sno from Student where Sdept = 'CS'); --���������ѧϵȫϵѧ���ɼ�����

update Course set Cname = '�߼����Գ������', Cpno = 6, Ccredit = 5 where Cno in(select Cno from Course where Cno = 8); --��8�ſγ̸���Ϊ���߼����Գ�����ơ��� ���п�Ϊ6�ţ�ѧ��Ϊ5��

update SC set Grade = Grade * 1.1 where Sno in(select Sno from Student where Sdept = 'CS' and Ssex = 'Ů'); --�������Ů���ɼ����10%

update SC set Grade = Grade + 5 where Cno in(select Sno from Course where Cpno is null); --��û�����пεĿγ̳ɼ����5��

delete from Student where Sno = '201215128'; --ɾ��201215128ѧ����¼��ɾ������������Ԫ�飩

create view IS_Student as select Sno, Sname, Sage from Student where Sdept = 'IS';
select * from IS_Student;

--����һ����ӳѧ��������ݵ���ͼ
create view BT_S(Sno, Sname, Sbirth) as select Sno, Sname, 2020 - Sage from Student;
select * from BT_S;

--��ѧ����ѧ�ż�����ƽ���ɼ�����Ϊһ����ͼ
create view S_G(Sno, Gavg) as select Sno, avg(Grade) from SC group by Sno;
select * from S_G;

--��������Ϊv1����ͼ����ѯѧ����ѧ�š��������γ������ɼ�����Ȼ���ӣ�
create view v1(Sno, Sname, Cname, Grade) as select SC.Sno, Sname, Cname, Grade from SC, Student, Course where SC.Cno = Course.Cno and Student.Sno = SC.Sno;
select * from v1;

--��������Ϊv2����ͼ��ͳ�Ʊ�ѡ�γ̵Ŀγ̺š�ѡ��������ƽ���ɼ�
create view v2(Cno, Snum, Gavg) as select Cno, count(*), avg(Grade) from SC group by Cno;
select * from v2;