CREATE TABLE Застосунок_для_скульптур(
id_dodatok SERIAL PRIMARY KEY,
Назва varchar,
тип varchar,
Розмір float,
Мінімальні_характеристики_для_запуску  varchar(300),
Зміст  varchar(300),
);


CREATE TABLE скульптура(
id_sculpture SERIAL PRIMARY KEY,
Назва varchar,
Додаткова_інформація varchar(1500),
id_dodatok int references Додаток(id_dodatok) ON DELETE CASCADE
);

CREATE TABLE Користувач(
id_korystuvach SERIAL PRIMARY KEY,
Прізвище varchar,
Імя varchar,
Вік int,
Рівень_майстерні int,
Номер_телефону char,
id_dodatok int references Додаток(id_dodatok) ON DELETE CASCADE
);

CREATE TABLE Інформація(
id_informacion SERIAL PRIMARY KEY,
Дата_започаткування date,
жанр varchar,
Складність int,
Вид_скульптури char,
Доп_інформація char(1500)
id_sculpture int references Скульптура(id_sculpture) ON DELETE CASCADE
);

CREATE TABLE Відео(
id_video SERIAL PRIMARY KEY,
Назва varchar,
Розмір_файлу int,
Формат char,
Тривалість int,
id_sculpture int references Скульптура(id_sculpture) ON DELETE CASCADE
);

CREATE TABLE КористувачкаВідео(
id_korystuvach int references Користувач(id_korystuvach) ON DELETE CASCADE,
id_video int references Відео(id_video) ON DELETE CASCADE,
primary key(id_video, id_korystuvach)
);

CREATE TABLE КористувачІнформація(
id_korystuvach int references Користувач(id_korystuvach) ON DELETE CASCADE,
id_informacion int references Інформація(id_informacion) ON DELETE CASCADE,
primary key(id_informacion, id_korystuvach)
);
ALTER TABLE Користувач ADD CONSTRAINT nickname_template
    CHECK (regexp_like(Прізвище, 
	           '@[a-z0-9_-]+'));

ALTER TABLE Користувач ADD CONSTRAINT user_phone_template
    CHECK ( regexp_like(Номер_телефону, 
	          '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));
