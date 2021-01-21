set serveroutput on;

CREATE OR REPLACE TRIGGER My_trigger
  BEFORE UPDATE OR INSERT OR DELETE ON Library

DECLARE 
  CURSOR my_cur IS 
    SELECT * FROM Library;
    
BEGIN
  for row_no in my_cur 
    LOOP
      INSERT INTO Library_Audit values(row_no.id,row_no.name,row_no.status);
      
    end LOOP;
    
    exception
    when no_data_found then
      dbms_output.put_line('not found');
END;
/
    