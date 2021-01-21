create table Library(
id number(10),
name varchar2(20),
status char
);

create table Library_Audit(
id number(10),
name varchar2(20),
status char
);

INSERT INTO Library values (1,'SEPM','I');
INSERT INTO Library values (2,'DBMS','I');
INSERT INTO Library values (3,'TOC','I');
INSERT INTO Library values (4,'CN','I');
INSERT INTO Library values (5,'ISEE','I');

update Library
set name ='CNL'
where id=4;

select * from Library;

select * from Library_Audit;

TRUNCATE table Library;
TRUNCATE table Library_Audit;

DROP table Library;
DROP table Library_Audit;

alter table Library disable all triggers;