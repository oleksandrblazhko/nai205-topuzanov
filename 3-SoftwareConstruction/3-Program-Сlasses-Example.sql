CREATE OR REPLACE TYPE Sculpture UNDER Info and Video (
 id_Sculpture SERIAL PRIMARY KEY,
Name varchar,
DopInfo varchar(1500),
      OVERRIDING MEMBER PROCEDURE display 
);
CREATE OR REPLACE TYPE Info (
 d_informacion SERIAL PRIMARY KEY,
Дата_започаткування date,
Hanr varchar,
Difficulty int,
Type_Sculpture char,
Hinfo char(1500),
      OVERRIDING MEMBER PROCEDURE display 
);
CREATE OR REPLACE TYPE Video AS OBJECT (
  id_video SERIAL PRIMARY KEY,
Name varchar,
File_size int,
Format char,
Dlina int,
      MEMBER PROCEDURE display
); 
CREATE OR REPLACE TYPE KUser AS OBJECT (
  id_korystuvach SERIAL PRIMARY KEY,
Fname varchar,
Sname varchar,
Age int,
Masterstvo int,
Phone_number char,
  
      MEMBER PROCEDURE display
); 
CREATE OR REPLACE TYPE AppSculpture UNDER Sculpture AS OBJECT (
  id_dodatok SERIAL PRIMARY KEY,
Name varchar,
Type_ varchar,
Rozmer float,
MinHaracteristiki  varchar(300),
Soderzhanie  varchar(300),
      MEMBER PROCEDURE display
  CONSTRUCTOR FUNCTION Video(Name varchar)
          RETURN SELF AS RESULT,
        /* Функції отримання значень атрибутів */
    MEMBER FUNCTION get_Informacion RETURN NUMBER,
    MEMBER FUNCTION get_Video RETURN VARCHAR,
    MEMBER FUNCTION get_price RETURN NUMBER,
  /* Процедура виводу на екран значень атрибутів */
      MEMBER PROCEDURE display
); 
