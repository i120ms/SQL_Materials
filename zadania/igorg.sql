-- Baza danych: igor gorski - winyle
-- SQL - Lista zadań 5.3

SET NAMES utf8mb4 COLLATE utf8mb4_polish_ci;

DROP DATABASE IF EXISTS igorg;

CREATE DATABASE igorg
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_polish_ci;

USE igorg;

-- 1: wykonawcy
CREATE TABLE wykonawcy (
    id_wykonawcy INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nazwa        VARCHAR(100) NOT NULL,
    kraj         VARCHAR(60)  NOT NULL DEFAULT 'Wielka Brytania',
    PRIMARY KEY (id_wykonawcy),
    UNIQUE KEY uq_wykonawcy_nazwa (nazwa)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_polish_ci;

-- 2: gatunki
CREATE TABLE gatunki (
    id_gatunku INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nazwa      VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id_gatunku),
    UNIQUE KEY uq_gatunki_nazwa (nazwa)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_polish_ci;

-- 3: albumy (winyle)
CREATE TABLE albumy (
    id_albumu    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tytul        VARCHAR(150) NOT NULL,
    rok_wydania  SMALLINT     NOT NULL,
    typ          VARCHAR(10)  NOT NULL DEFAULT 'LP',
    id_wykonawcy INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_albumu),
    CONSTRAINT chk_albumy_rok CHECK (rok_wydania BETWEEN 1948 AND 2100),
    CONSTRAINT fk_albumy_wykonawcy
        FOREIGN KEY (id_wykonawcy) REFERENCES wykonawcy (id_wykonawcy)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_polish_ci;

-- 4: albumy_gatunki (relacja wiele-do-wielu)
CREATE TABLE albumy_gatunki (
    id_albumu  INT UNSIGNED NOT NULL,
    id_gatunku INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_albumu, id_gatunku),
    CONSTRAINT fk_ag_albumy
        FOREIGN KEY (id_albumu) REFERENCES albumy (id_albumu)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_ag_gatunki
        FOREIGN KEY (id_gatunku) REFERENCES gatunki (id_gatunku)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_polish_ci;

-- Dane: wykonawcy (7 rekordów)
INSERT INTO wykonawcy (id_wykonawcy, nazwa, kraj) VALUES
    (1, 'Sade',            DEFAULT),
    (2, 'Nirvana',         'USA'),
    (3, 'Alice in Chains', 'USA'),
    (4, 'Metallica',       'USA'),
    (5, 'Radiohead',       DEFAULT),
    (6, 'Wunderhorse',     DEFAULT),
    (7, 'KEO',             DEFAULT);

-- Dane: gatunki (6 rekordów)
INSERT INTO gatunki (id_gatunku, nazwa) VALUES
    (1, 'Soul'),
    (2, 'Grunge'),
    (3, 'Rock alternatywny'),
    (4, 'Thrash metal'),
    (5, 'Indie rock'),
    (6, 'Smooth jazz');

-- Dane: albumy (7 rekordów)
INSERT INTO albumy (id_albumu, tytul, rok_wydania, typ, id_wykonawcy) VALUES
    (1, 'Best of Sade',               1994, DEFAULT, 1),
    (2, 'In Utero',                   1993, DEFAULT, 2),
    (3, 'Jar of Flies',               1994, 'EP',    3),
    (4, '...And Justice for All',     1988, DEFAULT, 4),
    (5, 'In Rainbows',                2007, DEFAULT, 5),
    (6, 'Midas',                      2025, DEFAULT, 6),
    (7, 'Put A Smile On For Me',          2026, DEFAULT, 7);

-- Dane: albumy_gatunki (11 rekordów)
INSERT INTO albumy_gatunki (id_albumu, id_gatunku) VALUES
    (1, 1), (1, 6),
    (2, 2), (2, 3),
    (3, 2), (3, 3),
    (4, 4),
    (5, 3),
    (6, 5), (6, 3),
    (7, 2);

-- pełna kolekcja winyli (album + wykonawca + gatunki)
CREATE VIEW widok_kolekcja AS
SELECT
    a.id_albumu,
    w.nazwa                                          AS wykonawca,
    a.tytul,
    a.rok_wydania,
    a.typ,
    w.kraj,
    GROUP_CONCAT(g.nazwa ORDER BY g.nazwa SEPARATOR ', ') AS gatunki
FROM albumy a
JOIN wykonawcy w            ON w.id_wykonawcy = a.id_wykonawcy
LEFT JOIN albumy_gatunki ag ON ag.id_albumu   = a.id_albumu
LEFT JOIN gatunki g         ON g.id_gatunku   = ag.id_gatunku
GROUP BY a.id_albumu, w.nazwa, a.tytul, a.rok_wydania, a.typ, w.kraj;

-- Test widoku:
-- SELECT * FROM widok_kolekcja ORDER BY rok_wydania;
