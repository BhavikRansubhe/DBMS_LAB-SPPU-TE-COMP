set serveroutput on;
-- For Loop
declare
       n_ro N_RollCalltb.rno%type;
       row_no O_RollCalltb%ROWTYPE;
       
       rno1 O_Rollcalltb.rno%type;
       name1 O_Rollcalltb.name%type;
       age1 O_Rollcalltb.age%type;
       marks1 O_Rollcalltb.marks%type;
       
cursor c1 is
select rno,name,age,marks from O_RollCalltb where rno not in(select rno from N_RollCalltb);

begin 
    for row_no in c1
    loop
    
        exit when c1%notfound;
        
        insert into N_RollCalltb values(row_no.rno,row_no.name,row_no.age,row_no.marks);
        commit;
        end loop;
        
        exception 
        when no_data_found then
        dbms_output.put_line('NO record found');

end;
/