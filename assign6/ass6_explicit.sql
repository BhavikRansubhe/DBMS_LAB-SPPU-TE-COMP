set serveroutput on;
--explicit
declare 
       rno1 O_Rollcalltb.rno%type;
       name1 O_Rollcalltb.name%type;
       age1 O_Rollcalltb.age%type;
       marks1 O_Rollcalltb.marks%type;
       
       Cursor expli_cur is
         select rno,name,age,marks from O_Rollcalltb;
         
begin
       open expli_cur;
       loop 
       fetch expli_cur into rno1,name1,age1, marks1;
       
       exit when expli_cur%notfound;
       
       insert into N_Rollcalltb values(rno1,name1,age1,marks1);
       commit;
       
       end loop;
       dbms_output.put_line('inserted record');
       close expli_cur;
      
end;
/