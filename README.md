# Итоговая контрольная работа по блоку специализация

 1. Используя команду cat в терминале операционной системы Linux, создать
два файла Домашние животные (заполнив файл собаками, кошками,
хомяками) и Вьючные животными заполнив файл Лошадьми, верблюдами и
ослы), а затем объединить их. Просмотреть содержимое созданного файла.
Переименовать файл, дав ему новое имя (Друзья человека).
```bash
user@user-vbox-1:~$ echo "dog, cat, hamster" | cat > pets
user@user-vbox-1:~$ echo "horse, camel, donkey" | cat > pack_animals
user@user-vbox-1:~$ cat pets >> pack_animals 
user@user-vbox-1:~$ cat pack_animals 
horse, camel, donkey
dog, cat, hamster
user@user-vbox-1:~$ mv pack_animals human_friends
```
 2. Создать директорию, переместить файл туда.
 ```bash
user@user-vbox-1:~$ mkdir animals
user@user-vbox-1:~$ mv human_friends animals/
 ```
 3. Подключить дополнительный репозиторий MySQL. Установить любой пакет из этого репозитория.
 4. Установить и удалить deb-пакет с помощью dpkg.
 5. Выложить историю команд в терминале ubuntu
```bash
user@user-vbox-1:~$ wget https://repo.mysql.com//mysql-apt-config_0.8.29-1_all.deb
--2024-02-21 02:05:46--  https://repo.mysql.com//mysql-apt-config_0.8.29-1_all.deb
Распознаётся repo.mysql.com (repo.mysql.com)… 23.210.173.94, 2a02:26f0:9500:b83::1d68, 2a02:26f0:9500:b8a::1d68
Подключение к repo.mysql.com (repo.mysql.com)|23.210.173.94|:443... соединение установлено.
HTTP-запрос отправлен. Ожидание ответа… 200 OK
Длина: 18172 (18K) [application/x-debian-package]
Сохранение в: ‘mysql-apt-config_0.8.29-1_all.deb’
mysql-apt-config_0.8.29- 100%[===============================>]  17,75K  --.-KB/s    за 0s
2024-02-21 02:05:46 (189 MB/s) - ‘mysql-apt-config_0.8.29-1_all.deb’ сохранён [18172/18172]
user@user-vbox-1:~$ sudo dpkg -i mysql-apt-config_0.8.29-1_all.deb
[sudo] пароль для user: 
Выбор ранее не выбранного пакета mysql-apt-config.
(Чтение базы данных … на данный момент установлено 295319 файлов и каталогов.)
Подготовка к распаковке mysql-apt-config_0.8.29-1_all.deb …
Распаковывается mysql-apt-config (0.8.29-1) …
Настраивается пакет mysql-apt-config (0.8.29-1) …
user@user-vbox-1:~$ sudo apt update
...
Получено 11,4 MB за 4с (2938 kB/s)
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово
Может быть обновлён 61 пакет. Запустите «apt list --upgradable» для показа.
user@user-vbox-1:~$ sudo apt install mysql-server
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Будут установлены следующие дополнительные пакеты:
  libmecab2 mecab-ipadic mecab-ipadic-utf8 mecab-utils mysql-client mysql-common
  mysql-community-client mysql-community-client-core mysql-community-client-plugins
  mysql-community-server mysql-community-server-core
Следующие НОВЫЕ пакеты будут установлены:
  libmecab2 mecab-ipadic mecab-ipadic-utf8 mecab-utils mysql-client mysql-common
  mysql-community-client mysql-community-client-core mysql-community-client-plugins
  mysql-community-server mysql-community-server-core mysql-server
Обновлено 0 пакетов, установлено 12 новых пакетов, для удаления отмечено 0 пакетов, и 61 пакетов не обновлено.
Необходимо скачать 37,8 MB архивов.
После данной операции объём занятого дискового пространства возрастёт на 273 MB.
Хотите продолжить? [Д/н] y
...
Настраивается пакет mysql-community-client (8.0.36-1ubuntu22.04) …
Настраивается пакет mysql-client (8.0.36-1ubuntu22.04) …
Настраивается пакет mysql-community-server (8.0.36-1ubuntu22.04) …
update-alternatives: используется /etc/mysql/mysql.cnf для предоставления /etc/mysql/my.cnf (my.cnf) в автоматическом режиме
Created symlink /etc/systemd/system/multi-user.target.wants/mysql.service → /lib/systemd/system/mysql.service.
Настраивается пакет mysql-server (8.0.36-1ubuntu22.04) …
Обрабатываются триггеры для man-db (2.10.2-1) …
Обрабатываются триггеры для libc-bin (2.35-0ubuntu3.6) …
user@user-vbox-1:~$ sudo dpkg --purge mysql-apt-config 
(Чтение базы данных … на данный момент установлено 295679 файлов и каталогов.)
Удаляется mysql-apt-config (0.8.29-1) …
Вычищаются файлы настройки пакета mysql-apt-config (0.8.29-1) …
```
 6. Нарисовать диаграмму, в которой есть класс родительский класс, домашние
животные и вьючные животные, в составы которых в случае домашних
животных войдут классы: собаки, кошки, хомяки, а в класс вьючные животные
войдут: Лошади, верблюды и ослы).

![pet_registry.drawio](https://github.com/dwuser78/Final_control_work_on_the_specialization_block/blob/main/pet_registry.png?raw=true)

7. В подключенном MySQL репозитории создать базу данных “Друзья
человека”
```sql
CREATE DATABASE `human_friends`;
```
8. Создать таблицы с иерархией из диаграммы в БД
```sql
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
```
9. Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения
```sql
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
```
10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
```sql
SET SQL_SAFE_UPDATES = 0;
DELETE FROM camels;
SET SQL_SAFE_UPDATES = 1;

SELECT name, birthday, commands FROM horses
UNION SELECT  name, birthday, commands FROM donkeys;
```
11. Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице. 
```sql
CREATE TEMPORARY TABLE animals AS 
    SELECT *, 'Лошади' as family FROM horses
    UNION SELECT *, 'Ослы' AS family FROM donkeys
    UNION SELECT *, 'Собаки' AS family FROM dogs
    UNION SELECT *, 'Кошки' AS family FROM cats
    UNION SELECT *, 'Хомяки' AS family FROM hamsters;

CREATE TABLE young_animals AS
    SELECT name, birthday, commands, family, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS age_in_months
    FROM animals WHERE birthday BETWEEN ADDDATE(CURDATE(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
```
12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
```sql
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
```
13. Создать класс с Инкапсуляцией методов и наследованием по диаграмме.
14. Написать программу, имитирующую работу реестра домашних животных.
В программе должен быть реализован следующий функционал:
  14.1. Завести новое животное
  14.2. определять животное в правильный класс
  14.3. увидеть список команд, которое выполняет животное
  14.4. обучить животное новым командам
  14.5. Реализовать навигацию по меню

16. Создайте класс Счетчик, у которого есть метод add(), увеличивающий̆
значение внутренний int переменной на 1 при нажатие “Завести новое
животное” Сделайте так, чтобы с объектом такого типа можно было работать в
блоке try-with-resources. Нужно бросить исключение, если работа с объектом
типа счетчик была не в ресурсном try и/или ресурс остался открыт. Значение
считать в ресурсе try, если при заведения животного заполнены все поля.
```java
import java.util.HashMap;  
import java.util.Map;  
  
public class Animal {  
    String name;  
    String type;  
    Map<String, String> commands = new HashMap<>();  
  
    public Animal(String name, String type) {  
        this.name = name;  
        this.type = type;  
    }  
  
    public void addCommand(String command, String action) {  
        commands.put(command, action);  
    }  
  
    public void listCommands() {  
        for (String command : commands.keySet()) {  
            System.out.println(command + " : " + commands.get(command));  
        }  
    }  
  
    public void determineType() {  
        System.out.println(name + " is a " + type);  
    }  
}

public class PetAnimal extends Animal{  
    public PetAnimal(String name, String type) {  
        super(name, type);  
    }  
}

public class PackAnimal extends Animal{  
    public PackAnimal(String name, String type) {  
        super(name, type);  
    }  
}

public class Dog extends PetAnimal{  
    public Dog(String name) {  
        super(name, "Dog");  
    }  
}

public class Cat extends PetAnimal{  
    public Cat(String name) {  
        super(name, "Cat");  
    }  
}

public class Hamster extends PetAnimal{  
    public Hamster(String name) {  
        super(name, "Hamster");  
    }  
}

public class Horse extends PackAnimal{  
    public Horse(String name) {  
        super(name, "Horse");  
    }  
}

public class Camel extends PackAnimal{  
    public Camel(String name) {  
        super(name, "Camel");  
    }  
}

public class Donkey extends PackAnimal{  
    public Donkey(String name) {  
        super(name, "Donkey");  
    }  
}

class Counter implements AutoCloseable {  
    private int count = 0;  
    private boolean closed = false;  
  
    public Counter() {  
        System.out.println("Counter created");  
    }  
  
    public void add() {  
        if (!closed) {  
            count++;  
        } else {  
            throw new IllegalStateException("Counter is closed");  
        }  
    }  
  
    @Override  
  public void close() {  
        System.out.println("Counter closed");  
        closed = true;  
    }  
}

public class Main {  
    public static void main(String[] args) {  
        try (Counter counter = new Counter()) {  
            Dog dog = new Dog("Rex");  
            dog.addCommand("sit", "Sits down");  
            dog.addCommand("fetch", "Brings the ball back");  
  
            dog.determineType();  
            dog.listCommands();  
  
            counter.add();  
        } catch (Exception e) {  
            System.out.println("Exception: " + e.getMessage());  
        }  
    }  
}
```