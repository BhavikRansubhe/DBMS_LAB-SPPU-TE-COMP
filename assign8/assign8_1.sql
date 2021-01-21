set SERVEROUTPUT ON;

create or replace trigger trig
before update or delete on Library
for each row 
begin

  insert into Library_Audit values(:old.id,:old.name,:old.status);

end;
/



--set SERVEROUTPUT ON;
--
--create or replace trigger trig
--after update or delete on Library
--for each row 
----declare
----  id Library.id%type;
----  name Library.name%type;
----  status Library.status%type;
----  
----  Cursor c is select * from Library;
----  
--begin
----  open c;
----  fetch c into id,name,status;
--  
--  insert into Library_Audit values(:old.id,:old.name,:old.status);
----  close c;
--end;
--/