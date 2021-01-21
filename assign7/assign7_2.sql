set serveroutput on;

create or replace procedure procedure_grade(rno number ,name varchar2,marks number)
is
class varchar2(20);

begin

          if(marks <=1500 and marks >= 990)then
            class := 'Disitinction';
            
          elsif(marks <=989 and marks >= 900)then
             class := 'First';
             
          elsif(marks <=899 and marks >= 825)then
            class := 'HIghet second';
            
          end if;
  
    insert into student_marks values(rno,name,marks);
    commit;
    
    insert into result values(rno,name,class);
    commit;    
    
end;
