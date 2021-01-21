SET SERVEROUTPUT ON;
declare
       roll_no integer := &roll_no;
       issuedate date;
       amount integer := 0;
       name_of_book varchar2(20) := '&nameofbook';
       days integer := 0;


begin
     select dateofissue into issuedate 
     from borrower
     where rollin = roll_no         
           and
           nameofbook = name_of_book;

     days := sysdate-issuedate;
 
     if days < 30 then
        if days > 15 then

             amount := 5*days;
             insert into fine values( roll_no, sysdate , amount); 
             
            
             commit;
        end if;
     
        elsif days > 30 then

             amount := 50*days;
             insert into fine values( roll_no, sysdate , amount); 
             

             commit;
     end if;

      update borrower set status = 'R'
             where rollin = roll_no         
                   and
                   nameofbook = name_of_book;

  
      commit;

  EXCEPTION
      when no_data_found then
      dbms_output.put_line('Record not found....!');
end;