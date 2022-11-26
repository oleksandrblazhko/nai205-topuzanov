CREATE TABLE KUser (
	 user_id INT, -- id користувача
	 Kname  VARCHAR(15),      -- имя/фамлиия   
	 Masterstvo NUMBER(2),        -- мастерство   
	 Phone   VARCHAR(15),         -- телефон
    	NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
