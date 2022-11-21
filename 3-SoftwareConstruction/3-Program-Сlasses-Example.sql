
/* Створення об'єктного типу (клас) My_Sulpture,
при створенні потрібен термінальний символ /
як при реєстрації звичайного програмного модуля PL/SQL
*/
-- DROP TYPE My_Sulpture FORCE;
CREATE OR REPLACE TYPE My_Sulpture AS OBJECT (
    SName VARCHAR(15),       -- назва скульптури
    DopInfo VARCHAR(15),      --информация
    Difficulty  NUMBER -- складність скульптурирование
    /* конструктор екземплярів об'єктів класів.
       Вхідні параметри:
	   1) SName - назва 
	   Вихідний параметр - екземпляр обєкту класу
	*/
    CONSTRUCTOR FUNCTION My_Sulpture (SName VARCHAR)
        RETURN SELF AS RESULT,
	/* Процедура зміни значення атрибутів */
	MEMBER PROCEDURE set_SName( SName VARCHAR, DopInfo VARCHAR,Difficulty  NUMBER),
    /* Функції отримання значень атрибутів */
	MEMBER FUNCTION get_Difficulty RETURN NUMBER,
	MEMBER FUNCTION get_SName RETURN VARCHAR,
 MEMBER FUNCTION get_DopInfo RETURN VARCHAR,
    /* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display
); 
/
-- show errors;


/* Створення об'єктного типу (класу) KUser */
CREATE OR REPLACE TYPE KUser AS OBJECT (
 Kname  VARCHAR(15),      -- имя/фамлиия   
 Masterstvo NUMBER(2),        -- мастерство   
 Phone   VARCHAR(15),         -- телефон
	/* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Video */
CREATE OR REPLACE TYPE Video AS OBJECT (
    Vname VARCHAR(10), -- ім'я видео 
    Vsize INT, -- размер фалйла
    format VARCHAR(10), -- формат видео
    MEMBER PROCEDURE display
);
/
/* Створення типу для зберігання списку співробітників - 
"Колекція екземплярів об`єктів класу Employee */
CREATE TYPE KUser_List IS TABLE OF KUser;
/

/* Cтворення об'єктного типу (класу) Manager, 
що успадковує об'єктний тип Employee */
CREATE OR REPLACE TYPE Manager UNDER KUser (
    manage KUser_List, -- список співробітників, якими керує менеджер
	/* перевизначення методу-процедури класу KUser */
    OVERRIDING MEMBER PROCEDURE display 
);
/
