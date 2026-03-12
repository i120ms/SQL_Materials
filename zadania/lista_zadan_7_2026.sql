# noinspection SpellCheckingInspectionForFile
-- 1 & 2 --
create database technikum character set utf8mb4 collate utf8mb4_polish_ci;
use technikum;

-- 3 --
create table klasa (
    numer int primary key auto_increment,
    imie varchar(30) not null,
    nazwisko varchar(30) not null,
    dzien_urodzenia date
);

-- 4 --
insert into klasa (imie, nazwisko, dzien_urodzenia) values
    ('Jan', 'Kowalski', '2008-03-12'),
    ('Anna', 'Nowak', '2007-11-02'),
    ('Piotr', 'Wiśniewski', '2008-07-19'),
    ('Katarzyna', 'Wójcik', '2007-01-25'),
    ('Michał', 'Kamiński', '2008-09-10'),
    ('Agnieszka', 'Lewandowska', '2007-05-30');
select * from klasa;

-- 5 --
alter table klasa alter dzien_urodzenia set default '2008-05-17';
select * from klasa;

-- 6 --
alter table klasa add srednia float default 0.0;
select * from klasa;

-- 7 --
alter table klasa auto_increment = 10;
select * from klasa;

-- 8 --
insert into klasa (imie, nazwisko, srednia) values
('Jakub', 'Mazur', 4.2),
('Oliwia', 'Krawczyk', 4.7),
('Bartosz', 'Piotrowski', 3.9),
('Julia', 'Grabowska', 5.0),
('Kacper', 'Pawłowski', 3.5),
('Zuzanna', 'Michalska', 4.4);
select * from klasa;

-- 9 --
create table druga_klasa like klasa;

-- 10 --
insert into druga_klasa select * from klasa;
select * from druga_klasa;

-- 11 --
alter table klasa drop column srednia;
select * from klasa;

-- 12 --
delete from klasa;
truncate table druga_klasa;

-- 13 --
insert into klasa (imie, nazwisko, dzien_urodzenia) values
    ('Tomasz', 'Zieliński', '2008-02-14'),
    ('Magdalena', 'Szymańska', '2007-12-08'),
    ('Paweł', 'Woźniak', '2008-04-21');
select * from klasa;

insert into druga_klasa (imie, nazwisko, dzien_urodzenia) values
    ('Karolina', 'Dąbrowska', '2007-08-16'),
    ('Mateusz', 'Kozłowski', '2008-06-03'),
    ('Natalia', 'Jankowska', '2007-10-27');
select * from druga_klasa;

-- 14 --
drop table druga_klasa;

-- 15 --
drop database technikum;

### 2 ###
-- 1 --
create database bd character set utf8mb4 collate utf8mb4_polish_ci;
use bd;
CREATE TABLE pizze(
    nazwa VARCHAR(255) PRIMARY KEY NOT NULL,

    `sos pomidorowy` INTEGER NOT NULL DEFAULT 1,
    `sos czosnkowy` INTEGER NOT NULL DEFAULT 0,

    `ser mozzarella` INTEGER NOT NULL DEFAULT 1,
    szynka INTEGER NOT NULL DEFAULT 0,
    pieczarki INTEGER NOT NULL DEFAULT 0,
    salami INTEGER NOT NULL DEFAULT 0,
    kukurydza INTEGER NOT NULL DEFAULT 0,
    bekon INTEGER NOT NULL DEFAULT 0,
    jalapeno INTEGER NOT NULL DEFAULT 0,
    oliwki INTEGER NOT NULL DEFAULT 0,
    cebula INTEGER NOT NULL DEFAULT 0,
    papryka INTEGER NOT NULL DEFAULT 0,

    CHECK (`sos pomidorowy` BETWEEN 0 AND 1),
    CHECK (`sos czosnkowy` BETWEEN 0 AND 1),
    CHECK (`ser mozzarella` BETWEEN 0 AND 3),
    CHECK (szynka BETWEEN 0 AND 3),
    CHECK (pieczarki BETWEEN 0 AND 3),
    CHECK (salami BETWEEN 0 AND 3),
    CHECK (kukurydza BETWEEN 0 AND 3),
    CHECK (bekon BETWEEN 0 AND 3),
    CHECK (jalapeno BETWEEN 0 AND 3),
    CHECK (oliwki BETWEEN 0 AND 3),
    CHECK (cebula BETWEEN 0 AND 3),
    CHECK (papryka BETWEEN 0 AND 3),

    CHECK (`sos pomidorowy` + `sos czosnkowy` = 1),

    CHECK (
        `ser mozzarella` + szynka + pieczarki + salami + kukurydza +
        bekon + jalapeno + oliwki + cebula + papryka <= 10
    ),

    UNIQUE (
        `sos pomidorowy`,
        `sos czosnkowy`,
        `ser mozzarella`,
        szynka,
        pieczarki,
        salami,
        kukurydza,
        bekon,
        jalapeno,
        oliwki,
        cebula,
        papryka
    )
);

-- 2 --
INSERT INTO pizze (nazwa, `sos pomidorowy`, `sos czosnkowy`, `ser mozzarella`, szynka, pieczarki, salami, kukurydza, bekon, jalapeno, oliwki, cebula, papryka) VALUES
('Margherita', 1,0,1,0,0,0,0,0,0,0,0,0),
('Funghi', 1,0,1,0,2,0,0,0,0,0,0,0),
('Prosciutto', 1,0,1,2,0,0,0,0,0,0,0,0),
('Salami', 1,0,1,0,0,2,0,0,0,0,0,0),
('Hawajska', 1,0,1,1,0,0,2,0,0,0,0,0),
('Bekonowa', 0,1,1,0,0,0,0,2,0,0,1,0),
('Wegetariańska', 1,0,1,0,2,0,1,0,0,1,1,2),
('Pikantna', 1,0,1,0,0,2,0,1,2,0,1,1),
('Farmerska', 0,1,1,2,2,0,0,1,0,1,1,0),
('Mexicana', 1,0,1,0,0,1,2,0,2,0,1,1);
select * from pizze;
