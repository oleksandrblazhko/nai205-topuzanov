/* 
Приклади використання методів програмних классів 
на мові Oracle PL/SQL
*/

SET SERVEROUTPUT ON 
SET LINESIZE 2000
SET PAGESIZE 100

/* Приклади роботи з класом My_Sulpture 
*/
DECLARE
    Sculp1 My_Sulpture ;
BEGIN 
    Sculp1:= NEW My_Sulpture('Mikelandgelo');
	dbms_output.put_line('get DopInfo : ' || loc1.get_DopInfo);
	dbms_output.put_line('get Sname: ' || loc1.get_Sname);
    Sculp1.display();
END;
/


/* Приклад роботи з класами My_Sulpture, VIDEO, KUser */
DECLARE 
   Sculp1 My_Sulpture; 
   V1 Video ;
   KU KUser;
BEGIN
    Sculp1 := My_Sulpture('MISLITEL'); 
    V1 := VIDEO('MISLITEL',10,mp4);
    KU := KUser('Bogdan',3,'0665901232' );
    KU.display(); 
END;
/

