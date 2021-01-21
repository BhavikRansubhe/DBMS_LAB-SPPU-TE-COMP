set serveroutput on;
-- parametrized

declare 
cursor c1(r int) is
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