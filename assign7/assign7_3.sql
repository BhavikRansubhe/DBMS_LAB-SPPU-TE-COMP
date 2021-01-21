set serveroutput on;

create or replace function fun1
return int as b INT:=2;
cursor c1 
is
SELECT rno,name ,marks from student_marks;
rowx student_marks%ROWTYPE;

begin 
      open c1;
      LOOP
             
      FETCH c1 INTO rowx;
      EXIT WHEN c1%NOTFOUND;
              if (rowx.marks <= 1500 and rowx.marks >= 990) then
                insert into result values(rowx.rno,rowx.name,'Distinction');
                
              elsif (rowx.marks <= 989 and rowx.marks >= 900) then
                insert into result values(rowx.rno,rowx.name,'First');
                
              elsif (rowx.marks <= 899 and rowx.marks >= 825) then
                insert into result values(rowx.rno,rowx.name,'Second');
                
              end if;
          
        commit;
        END LOOP;
        close c1;
        return b;
end;
