set serveroutput on;
-- implicit
declare 
       rno1 O_Rollcalltb.rno%type;
       name1 O_Rollcalltb.name%type;
       age1 O_Rollcalltb.age%type;
       marks1 O_Rollcalltb.marks%type;
       
begin 
     select rno,name,age,marks
     into rno1,name1,age1,marks1
     from O_Rollcalltb where rno=2;
     
     insert into N_Rollcalltb values(rno1,name1,age1,marks1);
    commit;
     dbms_output.put_line('completed');
     
end;
/