/* 
Приклади конструювання методів програмних классів 
на мові Oracle PL/SQL
*/

/* Методи класу My_Sulpture */
-- DROP TYPE Location FORCE;
CREATE OR REPLACE TYPE BODY My_Sulpture AS 

    /* конструктор екземплярів об'єктів класів.
       Вхідні параметри:
	   1) v_Sname - назва скульптури
	   умова 1) якщо в таблиці Sculp вже існує вказана скульптура,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Sculp створюється новий рядок з одночасним
	   створюється екземпляр класу 
	   Вихідний параметр - екземпляр обєкту класу
	*/
    CONSTRUCTOR FUNCTION My_Sulpture(v_Sname VARCHAR) 
        RETURN SELF AS RESULT
    IS
        v_dopInfo Sculp.DopInfo%TYPE;
	v_Difficulty  Sculp.Difficulty%TYPE;
    BEGIN
        SELECT DopInfo  INTO v_dopInfo
	SELECT Difficulty    INTO v_Difficulty  
        FROM Sculp
        WHERE 
            Sname = v_Sname;
        SELF.dopInfo := v_dopInfo;
        SELF.Sname   := v_Sname;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Sculp (Sname)
            VALUES (v_Sname)
        RETURNING dopInfo INTO v_dopInfo;
        SELF.dopInfo := v_dopInfo;
        SELF.Sname := v_Sname;
        RETURN;
    END My_Sulpture;

	/* Процедура зміни значення атрибутів */
	MEMBER PROCEDURE set_SName(v_SName  VARCHAR, v_DopInfo VARCHAR,v_Difficulty  NUMBER)
	IS
	BEGIN
        UPDATE Sculp SET Sname = v_SName
		WHERE DopInfo = v_DopInfo;
		SELF.Sname := v_Sname;
	END set_SName;

	/* Функції отримання значень атрибутів */
	/* get_Difficulty */
    MEMBER FUNCTION get_Difficulty 
	    RETURN NUMBER 
	IS
    BEGIN
       RETURN SELF.Difficulty ;
    END get_Difficulty;

	/* get_DopInfo */
    MEMBER FUNCTION get_DopInfo
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.DopInfo;
    END get_DopInfo ;	
    	/* get_SName */
    MEMBER FUNCTION get_SName
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.SName;
    END get_SName ;

    /* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display 
    IS
    BEGIN 
        dbms_output.put_line('DopInfo: ' || DopInfo);
        dbms_output.put_line('Sname: ' || Sname);
    END display;
END; 
/

/* Методи класу Department */
CREATE OR REPLACE TYPE BODY KUser  AS 
    /* Метод-процедура display виводу на екран 
    значень атрибутів екземпляру об'єкту класу */
    MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Kname : ' || Self.Kname); 
        dbms_output.put_line('Masterstvo: ' || Self.Masterstvo);   
	dbms_output.put_line('Phone: ' || Self.Phone);  
 --       dbms_output.put_line('locno: ' || Sculp.locno); 
 --       dbms_output.put_line('Sname: ' || Sculp.Sname); 
    END display;
END; 
/

/* Методи класу Employee */
CREATE OR REPLACE TYPE BODY Video  AS 
    MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Vname : ' || Self.Vname ); 
        dbms_output.put_line('Vsize : ' || Self.Vsize ); 
        dbms_output.put_line('format : ' || Self.format ); 
        dbms_output.put_line('locno: ' || Sculp.DopInfo); 
        dbms_output.put_line('Sname: ' || Sculp.Sname); 
    END display; 
END; 
/

/* Методи класу Manager 
CREATE OR REPLACE TYPE BODY Manager AS 
    OVERRIDING MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Name: '|| self.ename); 
        dbms_output.put_line('Job: '|| self.job); 
        dbms_output.put_line('Dept: '|| dept.dname); 
        dbms_output.put('Manages: {'); 
        FOR i IN 1..manage.COUNT LOOP
            dbms_output.put(manage(i).ename);
            IF i < manage.COUNT THEN 
                dbms_output.put(',');
            END IF;
        END LOOP;
        dbms_output.put_line('}');
    END display; 
END; 
/*/
