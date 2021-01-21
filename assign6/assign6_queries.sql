create table O_Rollcalltb(
rno integer not null primary key,
name varchar2(20),
age integer,
marks integer);

describe O_Rollcalltb;

create table N_Rollcalltb(
rno integer not null primary key,
name varchar2(20),
age integer,
marks integer);

describe N_Rollcalltb;

INSERT INTO O_Rollcalltb values(1,'Bhavik',20,99);
INSERT INTO O_Rollcalltb values(2,'Gaurav',20,98);
INSERT INTO O_Rollcalltb values(3,'Rithvik',20,94);
INSERT INTO O_Rollcalltb values(4,'Advait',20,97);
INSERT INTO O_Rollcalltb values(5,'Adesh',20,96);

commit;

select * from O_Rollcalltb;

select * from N_Rollcalltb;


TRUNCATE TABLE N_Rollcalltb;