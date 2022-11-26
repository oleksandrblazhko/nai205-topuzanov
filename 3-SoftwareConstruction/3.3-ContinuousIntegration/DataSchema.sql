/* видалення таблиць з каскадним видаленням 
можливих описів цілісності */
drop table Sculpture CASCADE CONSTRAINTS;
drop table KUser CASCADE CONSTRAINTS;
drop table Video CASCADE CONSTRAINTS;

 CREATE SEQUENCE s_user; --
 CREATE SEQUENCE s_sculpture; --
 CREATE SEQUENCE s_video;    --послідовності для заповнення таблиць


/* Створення об'єктного типу (класу) KUser */
CREATE TABLE KUser (
	 user_id INT, -- id користувача
	 Kname  VARCHAR(15),      -- имя/фамлиия   
	 Masterstvo NUMBER(2),        -- мастерство   
	 Phone   VARCHAR(15),         -- телефон
); 

CREATE TABLE Sculpture ( -- опис скульптур
	Sculpture_id INT
	SName VARCHAR(15),       -- назва скульптури
	DopInfo VARCHAR(15),      --информация
	Difficulty  NUMBER -- складність скульптурирование
);

CREATE TABLE Video ( -- опис онлайн-повідомлень
	Video_id INT, -- id замовлення
	Vname VARCHAR(10), -- ім'я видео 
	Vsize INT, -- размер фалйла
	format VARCHAR(10), -- формат видео
);


---------- обмеження первинних ключів
ALTER TABLE KUser ADD CONSTRAINT user_pk
PRIMARY KEY (user_id);
ALTER TABLE Sculpture ADD CONSTRAINT sculpture_pk
PRIMARY KEY (Sculpture_id);
ALTER TABLE Video ADD CONSTRAINT video_pk
PRIMARY KEY (Video_id);
	

-- обмеження вмісту стовпчиків таблиць

ALTER TABLE KUser ADD CONSTRAINT user_phone_template
    CHECK ( regexp_like(Phone, 
	          '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));
			  
