-- DROP TYPE My_Sulpture FORCE;
CREATE OR REPLACE TYPE My_Sulpture AS OBJECT (
    SName VARCHAR(15),       -- назва скульптури
    DopInfo VARCHAR(15),      --информация
    Difficulty  NUMBER -- складність скульптурирование
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

