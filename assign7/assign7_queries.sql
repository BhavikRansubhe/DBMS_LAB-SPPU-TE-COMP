create table student_marks(
rno number(5),
name varchar2(20),
marks number(6)
 );

create table result(
rno number(5),
name varchar2(20),
class varchar2(20)
 );

--without para

insert into student_marks values(1,'Bhavik',1400);
insert into student_marks values(2,'Kim',850);
insert into student_marks values(3,'Kylie',970);

select * from student_marks;

exec procedure_grade_withoutparameters;

select * from result;

--with para

truncate table student_marks;
truncate table result;

exec procedure_grade(1,'Bhavik',1450);
exec procedure_grade(2,'Selena',870);
exec procedure_grade(3,'Kindal',950);

select * from student_marks;

select * from result;


--stored fun

truncate table student_marks;
truncate table result;

insert into student_marks values(1,'Bhavik',1450);
insert into student_marks values(2,'Ronaldo',960);
insert into student_marks values(3,'Messi',840);

select * from student_marks;

exec dbms_output.put_line(fun1);
select * from result;


