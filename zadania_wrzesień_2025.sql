Zad. 1. Wyświetl nazwę, kontynent i władcę dla każdej z monarchii.
Zad. 2. Wyświetl wszystkie kraje europejskie, które nie mają roku niepodległości.
Zad. 3. Wyświetl liczbę regionów w Azji.
Zad. 4. Wyświetl posortowane (malejąco), według populacji, kraje skandynawskie.
Zad. 5. Wyświetl liczbę regionów osobno dla każdego kontynentu. Posortuj
(rosnąco) alfabetycznie, według kontynentów.
Zad. 6. Wyświetl nazwę i zaokrągloną do jednego miejsca po przecinku, śred-
nią oczekiwaną długość życia tych regionów, których średnia oczeki-
wana długość życia przekracza 65 lat. Posortuj wynik malejąco według
średniej oczekiwanej długości życia.
Zad. 7. Wyświetl wszystkie dystrykty, w których leżą miasta zaczynające się
na literę ’w’ i kończące na ’o’ lub ’e’.
Zad. 8. Wyświetl wszystkie kontynenty, dla których liczba krajów zaczynają-
cych się na literę ’P’ wynosi 3 lub więcej.
Zad. 9. Wyświetl ID i nazwę miast, których ID należy do zbioru A:
A = {n ∈ N : n > 3 ∧ n ≤ 12} ∪ {14, 15, 16}
Zad. 10. Wyświetl nazwy regionów jako ”region_bez_krola”, średnią populacji
jako ”avg_pop” krajów tych regionów, dla których średnia populacji
jest większa niż 10 milionów. W zadaniu nie bierz pod uwagę kra-
jów, które mają monarchę. Wynik powinien być posortowany malejąco,
według średniej populacji.


1. SELECT Name, Continent, HeadOfState FROM `country` WHERE GovernmentForm LIKE "%Monarchy%"
2. SELECT * FROM `country` WHERE IndepYear IS NULL; 
3. SELECT COUNT(DISTINCT Region) FROM `country` WHERE Continent LIKE "asia"; 
4. SELECT * FROM `country` WHERE Region = "Nordic Countries" ORDER BY `country`.`Population` DESC; 
5. SELECT Continent, COUNT(DISTINCT Region) AS `Liczba Region` FROM `country` GROUP BY Continent ORDER BY trim(`Continent`) ASC; 
6. SELECT Region , ROUND(AVG(LifeExpectancy), 1) AS srednia FROM `country` GROUP BY Region HAVING srednia>65 ORDER BY srednia DESC; 
7. SELECT Name, District FROM `city` WHERE Name LIKE "W%" AND (Name LIKE "%o" OR Name LIKE "%e"); 
8. !
9. !
10. ! SELECT Region AS region_bez_króla, AVG(Population) AS avg_pop FROM `country`; 
