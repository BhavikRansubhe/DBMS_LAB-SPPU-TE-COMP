set serveroutput on;
-- implicit
declare 
       rno1 O_Rolcalltb.rno%type;
       name1 O_Rolcalltb.name%type;
       age1 O_Rolcalltb.age%type;
       marks1 O_Rolcalltb.marks%type;
       
begin 
     select rno,name,age,marks
     into rno1,name1,age1,marks1;
     from O_Rollcall where rno=2;
     
     insert into N_Rollcalltb values(rno1,name1,age1,marks1);
     
     dbms_output.put_line('completed');
     
end;
/

--explicit

declare 
       rno1 O_Rolcalltb.rno%type;
       name1 O_Rolcalltb.name%type;
       age1 O_Rolcalltb.age%type;
       marks1 O_Rolcalltb.marks%type;
       
       Cursor expli_cur;
         select rno,name,age,marks from O_Rollcalltb;
         
begin
       open expli_cur;
       loop 
       fetch expli_cur into rno1,name1,age1, marks1;
       
       exit when expli_cur%norfound;
       
       insert into N_Rollcalltb values(rno1,name1,age1,marks1);
       
       end loop;
       dbms_output.put_line('inserted record');
       close expli_cur;
       
end;
/

-- For Loop

declare
       
       n_ro N_RollCalltb.rno%type;
       row_no O_RollCalltb%ROWTYPE;
       
       rno1 O_Rolcalltb.rno%type;
       name1 O_Rolcalltb.name%type;
       age1 O_Rolcalltb.age%type;
       marks1 O_Rolcalltb.marks%type;
       

cursor c1 is
select rno,name,age,marks from O_RollCalltb where rno not in(select rno from N_RollCalltb);

begin 
    for row_no in c1
    loop
    
        exit when c1%notfound;
        
        insert into N_RollCalltb values(row_no.rno,row_no.name,row_no.age,row_no.marks);
        
        end loop;
        
        exception 
        when no_data_found then
        dbms_output.put_line('NO record found');

end;
/

-- parametrized

declare 
cursor c1 is
select rno,name,age,marks from O_RollCalltb where rno=r and rno not in(select rno from N_RollCalltb);

begin 
     for row_no in c1(&r)
     loop
        
         exit when c1%notfound;
         
        insert into N_RollCalltb values(row_no.rno,row_no.name,row_no.age,row_no.marks);
        
         end loop;
        
        exception 
        when no_data_found then
        dbms_output.put_line('NO record found');

end;
/
