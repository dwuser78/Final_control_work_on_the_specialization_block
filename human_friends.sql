CREATE DATABASE `human_friends`;

USE human_friends;

CREATE TABLE animal_types
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    Class_name VARCHAR(20)
);

CREATE TABLE pet_animals
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    family_name VARCHAR (20),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES animal_types (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE packed_animals
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    family_name VARCHAR (20),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES animal_types (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dogs
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    family_id int,
    Foreign KEY (family_id) REFERENCES pet_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cats
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    family_id int,
    Foreign KEY (family_id) REFERENCES pet_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE hamsters
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    family_id int,
    Foreign KEY (family_id) REFERENCES pet_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE horses
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    family_id int,
    Foreign KEY (family_id) REFERENCES packed_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE camels
(       
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    family_id int,
    Foreign KEY (family_id) REFERENCES packed_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE donkeys
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birthday DATE,
    commands VARCHAR(50),
    family_id int,
    Foreign KEY (family_id) REFERENCES packed_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO animal_types (Class_name)
VALUES ('Домашние'),
('Вьючные');

INSERT INTO pet_animals (family_name, type_id)
VALUES ('Собаки', 1),
('Кошки', 1),
('Хомяки', 1);

INSERT INTO packed_animals (family_name, type_id)
VALUES ('Лошади', 2),
('Верблюды', 2),
('Ослы', 2);

INSERT INTO dogs (name, birthday, commands, family_id)
VALUES ('Рекс', '2017-03-01', 'Лежать', 1),
('Тузик', '2019-05-11', 'Ко мне', 1),
('Шарик', '2018-03-01', 'Сидеть', 1);

INSERT INTO cats (name, birthday, commands, family_id)
VALUES ('Мурка', '2016-01-01', 'Брысь', 2),
('Юки', '2013-01-01', 'Кушать', 2);

INSERT INTO hamsters (name, birthday, commands, family_id)
VALUES ('Пух', '2022-01-12', '', 3),
('Гуфи', '2021-04-09', '', 3),
('Рон', '2022-03-10', '', 3);

INSERT INTO horses (name, birthday, commands, family_id)
VALUES ('Беркут', '2019-01-01', 'Вперёд, Рысь, Хоп, Стой', 1),
('Астон', '2020-02-12', 'Вперёд, Рысь, Хоп, Стой', 1),
('Зевс', '2018-05-12', 'Вперёд, Рысь, Хоп, Стой', 1);

INSERT INTO camels (name, birthday, commands, family_id)
VALUES ('Лила', '2021-02-10', 'Гит, Дур, Каш', 2),
('Омлет', '2019-07-11', 'Гит, Дур, Каш', 2),
('Луша', '2020-06-06', 'Гит, Дур, Каш', 2);

INSERT INTO donkeys (name, birthday, commands, family_id)
VALUES ('Чупа', '2019-01-10', '', 3),
('Хэм', '2020-02-08', '', 3),
('Вудди', '2017-5-12', '', 3);


SET SQL_SAFE_UPDATES = 0;
DELETE FROM camels;
SET SQL_SAFE_UPDATES = 1;

SELECT name, birthday, commands FROM horses
UNION SELECT  name, birthday, commands FROM donkeys;


CREATE TEMPORARY TABLE animals AS 
    SELECT *, 'Лошади' as family FROM horses
    UNION SELECT *, 'Ослы' AS family FROM donkeys
    UNION SELECT *, 'Собаки' AS family FROM dogs
    UNION SELECT *, 'Кошки' AS family FROM cats
    UNION SELECT *, 'Хомяки' AS family FROM hamsters;

CREATE TABLE young_animals AS
    SELECT name, birthday, commands, family, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS age_in_monthss
    FROM animals WHERE birthday BETWEEN ADDDATE(CURDATE(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);


SELECT h.name, h.birthday, h.commands, pa.family_name
FROM horses h
    LEFT JOIN young_animals ya ON ya.name = h.name
    LEFT JOIN packed_animals pa ON pa.id = h.family_id
UNION SELECT d.name, d.birthday, d.commands, pa.family_name
FROM donkeys d
    LEFT JOIN young_animals ya ON ya.name = d.name
    LEFT JOIN packed_animals pa ON pa.id = d.family_id
UNION SELECT c.name, c.birthday, c.commands, ha.family_name
FROM cats c
    LEFT JOIN young_animals ya ON ya.name = c.name
    LEFT JOIN pet_animals ha ON ha.id = c.family_id
UNION SELECT d.name, d.birthday, d.commands, ha.family_name
FROM dogs d
    LEFT JOIN young_animals ya ON ya.name = d.name
    LEFT JOIN pet_animals ha ON ha.id = d.family_id
UNION SELECT hm.name, hm.birthday, hm.commands, ha.family_name
FROM hamsters hm
    LEFT JOIN young_animals ya ON ya.name = hm.name
    LEFT JOIN pet_animals ha ON ha.id = hm.family_id;