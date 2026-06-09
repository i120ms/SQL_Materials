DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
USE music;

DROP TABLE IF EXISTS music_1nf;

CREATE TABLE music_1nf (
artysta VARCHAR(100),
album VARCHAR(100),
utwor VARCHAR(100),
rok INT,
czas TIME
);

INSERT INTO music_1nf (artysta, album, utwor, rok, czas) VALUES
('Dominic Fike', 'What Could Possibly Go Wrong', 'Vampire', 2020, '00:02:58'),
('Dominic Fike', 'Sunburn', 'Mona Lisa', 2023, '00:03:31'),
('Arctic Monkeys', 'AM', 'Do I Wanna Know?', 2013, '00:04:32'),
('Arctic Monkeys', 'AM', 'R U Mine?', 2012, '00:03:21'),
('Quarters of Change', 'Into The Rift', 'Rift', 2022, '00:03:12'),
('Quarters of Change', 'Portraits', 'Heaven Bound', 2024, '00:03:45');

DROP TABLE IF EXISTS utwory_2nf;
DROP TABLE IF EXISTS albumy_2nf;

CREATE TABLE albumy_2nf (
artysta VARCHAR(100),
album VARCHAR(100),
rok INT,
PRIMARY KEY (artysta, album)
);

CREATE TABLE utwory_2nf (
artysta VARCHAR(100),
album VARCHAR(100),
utwor VARCHAR(100),
czas TIME,
PRIMARY KEY (artysta, utwor),
FOREIGN KEY (artysta, album) REFERENCES albumy_2nf(artysta, album)
);

INSERT INTO albumy_2nf (artysta, album, rok) VALUES
('Dominic Fike', 'What Could Possibly Go Wrong', 2020),
('Dominic Fike', 'Sunburn', 2023),
('Arctic Monkeys', 'AM', 2013),
('Quarters of Change', 'Into The Rift', 2022),
('Quarters of Change', 'Portraits', 2024);

INSERT INTO utwory_2nf (artysta, album, utwor, czas) VALUES
('Dominic Fike', 'What Could Possibly Go Wrong', 'Chicken Tenders', '00:02:58'),
('Dominic Fike', 'Sunburn', 'Mona Lisa', '00:03:31'),
('Arctic Monkeys', 'AM', 'Do I Wanna Know?', '00:04:32'),
('Arctic Monkeys', 'AM', 'R U Mine?', '00:03:21'),
('Quarters of Change', 'Into The Rift', 'Rift', '00:03:12'),
('Quarters of Change', 'Portraits', 'Heaven Bound', '00:03:45');

DROP TABLE IF EXISTS utwory_3nf;
DROP TABLE IF EXISTS albumy_3nf;
DROP TABLE IF EXISTS artysci_3nf;

CREATE TABLE artysci_3nf (
artysta VARCHAR(100) PRIMARY KEY
);

CREATE TABLE albumy_3nf (
artysta VARCHAR(100),
album VARCHAR(100),
rok INT,
PRIMARY KEY (artysta, album),
FOREIGN KEY (artysta) REFERENCES artysci_3nf(artysta)
);

CREATE TABLE utwory_3nf (
artysta VARCHAR(100),
album VARCHAR(100),
utwor VARCHAR(100),
czas TIME,
PRIMARY KEY (artysta, utwor),
FOREIGN KEY (artysta, album) REFERENCES albumy_3nf(artysta, album)
);

INSERT INTO artysci_3nf (artysta) VALUES
('Dominic Fike'),
('Arctic Monkeys'),
('Quarters of Change');

INSERT INTO albumy_3nf (artysta, album, rok)
SELECT artysta, album, rok
FROM albumy_2nf;

INSERT INTO utwory_3nf (artysta, album, utwor, czas)
SELECT artysta, album, utwor, czas
FROM utwory_2nf;

-- CZĘŚĆ II

-- [Zadanie 1]
-- mysql -u root

-- [Zadanie 2]
CREATE USER 'marcin'@'localhost' IDENTIFIED BY 'Start123';

-- [Zadanie 3]
GRANT SELECT ON *.* TO 'marcin'@'localhost';
FLUSH PRIVILEGES;

-- [Zadanie 4]
-- mysql -u marcin -p

-- [Zadanie 5]
USE world;
SELECT * FROM world.country;

-- [Zadanie 6]
DELETE FROM world.country WHERE Name = 'Germany';

-- [Zadanie 7]
-- mysql -u root

-- [Zadanie 8]
CREATE USER 'sad'@'localhost' IDENTIFIED BY 'Sasiad456!';
GRANT SELECT, UPDATE, DELETE, INSERT ON world.* TO 'sad'@'localhost';
FLUSH PRIVILEGES;

-- (logujesz się jako 'sad')

-- [Zadanie 9]
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM world.country WHERE Code = 'DEU';
SET FOREIGN_KEY_CHECKS = 1;

-- [Zadanie 10]
UPDATE world.country SET Capital = 3000 WHERE Code = 'POL';

-- [Zadanie 11]
INSERT INTO world.city (Name, CountryCode, District, Population)
VALUES ('New Vegas', 'USA', 'Nevada', 100000);

-- [Zadanie 12]
SELECT User, Host, authentication_string FROM mysql.user;

-- [Zadanie 13]
REVOKE UPDATE, DELETE, INSERT ON world.* FROM 'sad'@'localhost';

-- [Zadanie 14]
REVOKE SELECT ON mysql.* FROM 'sad'@'localhost';

-- [Zadanie 15]
GRANT UPDATE (Name) ON world.city TO 'sad'@'localhost';
FLUSH PRIVILEGES;

-- (logujesz się jako 'sad')

-- [Zadanie 16 i 17]
UPDATE world.city SET Name = 'Cebula' WHERE Name = 'Warszawa';

-- (logujesz się jako root)

-- [Zadanie 18 i 19]
DROP USER 'sad'@'localhost';

-- [Zadanie 20]
CREATE USER 'super_admin'@'localhost' IDENTIFIED BY 'Admin2026!';
GRANT ALL PRIVILEGES ON *.* TO 'super_admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- [Zadanie 21]
DROP USER 'marcin'@'localhost';
DROP USER 'super_admin'@'localhost';
DROP USER 'sad'@'localhost';
FLUSH PRIVILEGES;
