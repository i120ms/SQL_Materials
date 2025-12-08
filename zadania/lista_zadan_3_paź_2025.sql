Baza: world

Zad. 1. Wyświetl wszystkie tabele w bazie world.
Zad. 2. Wyświetl informacje o kolumnach tabeli city.
Zad. 3. Utwórz nowy kraj: Neverland.
Zad. 4. Utwórz 2 nowe miasta we Francji.
Zad. 5. Wymyśl 3 nowe języki i wprowadź je w Argentynie, jako języki nieoficjalne.
Zad. 6. Stany Zjednoczone skopiowały się. Skopiuj je w bazie (zmień tylko PRIMARY KEY).
Zad. 7. Skopiuj języki z Argentyny do Urugwaju. Gdy język się powtarza, ustaw procent ludzi w nim mówiących na 98.
Zad. 8. Usuń Skopiowane Stany Zjednoczone.
Zad. 9. Usuń wszystkie nieoficjalne języki z Argentyny i Urugwaju.
Zad. 10. Spróbuj dodać nowe miasto o takim samym ID jak Wrocław. Polecenie napisz tak, aby w przypadku niepowodzenia liczba mieszkańców podwoiła się.
Zad. 11. Usuń 5 miast o największej populacji.
Zad. 12. Usuń wszystkie języki.
Zad. 13. Zaimportuj bazę ponownie.
Zad. 14.* Dodaj miasto do kraju o najmniejszej populacji.
Zad. 15.* Usuń 5 najmniej zaludnionych miast ze zbioru 3 państw o największej powierzchni.

1. SHOW TABLES; 
2. DESCRIBE city;
3. INSERT INTO country (name) VALUES ('Neverland'); 
4. INSERT INTO city (Name, CountryCode) VALUES ('Wrocław', 'FRA'), ('Rotterdam', 'FRA');
5. INSERT INTO countrylanguage (CountryCode, Language, Percentage, IsOfficial) VALUES ('ARG', 'elozelo1', 2.0, 'F'), ('ARG', 'elozelo2', 2.2, 'F'), ('ARG', 'elozelo3', 2.5, 'F'); 
6. INSERT INTO country (Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2) SELECT 'US2', Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2 FROM country WHERE Code = 'USA';
7. INSERT INTO countrylanguage (CountryCode, Language, IsOfficial, Percentage) SELECT 'URY', Language, IsOfficial, Percentage FROM countrylanguage WHERE CountryCode = 'ARG' ON DUPLICATE KEY UPDATE Percentage = 98;
8. DELETE FROM country WHERE Code = 'US2';
9. DELETE FROM countrylanguage WHERE CountryCode IN ('ARG', 'URY') AND IsOfficial = 'F';
10.
11. DELETE * FROM city ORDER BY Population DESC LIMIT 5;
12. DELETE * FROM countrylanguage
13. SOURCE world.sql;
14. INSERT INTO city (Name, CountryCode, District, Population) SELECT 'NewTinyCity', Code, 'Unknown', 1000 FROM country ORDER BY Population ASC LIMIT 1;
15.
