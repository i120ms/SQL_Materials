1
UPDATE produkty
SET id_p = 'EGP'
WHERE nazwa_p = 'Wegiel Eko Groszek PROMETEUSZ' 
  AND id_p = 'EG';

2
UPDATE produkty
SET jedn_cena = jedn_cena * 1.10;

3
UPDATE klienci
SET imie = UPPER(imie)
WHERE imie = 'Abel';

4
UPDATE klienci
SET imie = LOWER(imie)
WHERE imie = 'Abigail';

5
SELECT REPLACE(imie, 'Ab', 'aaaa') FROM klienci;

6
SELECT 
    imie,
    SUBSTRING(imie, 2) AS od_drugiego_znaku,
    SUBSTRING(imie FROM 2) AS od_drugiego_znaku_from,
    SUBSTRING(imie, 2, 3) AS trzy_znaki_od_drugiego,
    SUBSTRING(imie FROM 2 FOR 3) AS trzy_znaki_od_drugiego_for
FROM klienci;

7
UPDATE klienci
SET imie = CONCAT_WS(' ', imie, 'Luna')
WHERE nazwisko = 'Tyrkiew';

-- 8
UPDATE produkty SET nazwa_p = CONCAT(nazwa_p, '+') WHERE CHAR_LENGTH(nazwa_p) = (SELECT MIN(CHAR_LENGTH(nazwa_p)) FROM produkty);

-- 9
SELECT nazwa_p,
  LEFT(nazwa_p, 3)  AS pierwsze_3,
  RIGHT(nazwa_p, 3) AS ostatnie_3
FROM produkty;

-- 10
UPDATE klienci
SET imie = CONCAT(UPPER(LEFT(imie, 1)), LOWER(SUBSTRING(imie, 2)));

-- 11
UPDATE klienci
SET miejscowosc = 'Wrocław', ulica = 'Mikołaja Reja', nr_domu = 3
WHERE id_k = (
  SELECT id_k FROM transakcje
  GROUP BY id_k ORDER BY COUNT(*) DESC LIMIT 1
);

-- 12
INSERT INTO klienci (id_k, imie, nazwisko, id_us, nip, id_w, kod, miejscowosc, ulica, nr_domu) VALUES
('Kl001','Jan','Kowalski',101,'123-456-78-90',1,'50-100','Wrocław','ul. Świdnicka','10'),
('Kl002','Anna','Nowak',102,'987-654-32-10',2,'85-001','Bydgoszcz','ul. Gdańska','15'),
('Kl003','Piotr','Wiśniewski',103,'555-444-33-22',3,'20-001','Lublin','ul. Krakowskie Przedmieście','20');

-- 13
INSERT INTO transakcje (id_t, id_k, id_p, ilosc, data_t) VALUES
('F/TR/2000001','Kl001','EGE',2,CURDATE()),
('F/TR/2000002','Kl001','EGE',1,CURDATE()),
('F/TR/2000003','Kl002','EGE',5,'2026-05-10'),
('F/TR/2000004','Kl002','EGE',3,'2026-06-15'),
('F/TR/2000005','Kl003','EGE',4,'2026-10-23'),
('F/TR/2000006','Kl003','EGE',1,'2026-10-23');

-- 14
INSERT INTO klienci (id_k, imie, nazwisko, id_us, nip, id_w, kod, miejscowosc, ulica, nr_domu)
SELECT 'AbEl4406', 'Abdiusz', nazwisko, id_us, nip, id_w, kod, miejscowosc, ulica, nr_domu
FROM klienci WHERE id_k = 'AbEl4405';

-- 15
DELETE FROM transakcje WHERE data_t BETWEEN '2014-03-01' AND '2014-03-31';

-- 16
DELETE FROM klienci WHERE imie = 'Adaukt' AND nazwisko LIKE 'M%';

-- 17
DELETE FROM klienci
WHERE NOT EXISTS (SELECT 1 FROM transakcje t WHERE t.id_k = klienci.id_k);

-- 18
INSERT INTO produkty (id_p, nazwa_p, jedn, jedn_cena)
SELECT 'NEW', 'Nowy Produkt', 'tona', MAX(jedn_cena) + 100 FROM produkty;

-- 19
ALTER TABLE klienci
  DROP FOREIGN KEY klienci_ibfk_1,
  ADD CONSTRAINT klienci_ibfk_1 FOREIGN KEY (id_us)
      REFERENCES uskarbowe (id_us) ON UPDATE CASCADE;

UPDATE uskarbowe SET id_us = id_us + 1 ORDER BY id_us DESC;

-- 20
DELETE FROM klienci;