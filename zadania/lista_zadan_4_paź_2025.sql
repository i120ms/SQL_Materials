Zad. 1. Wyświetl dwie kolumny: w jednej powinny znaleźć się nazwy regionów, a w drugiej kontynent, na którym dany region leży.
Zad. 2. Wyświetl nazwę kraju i nazwę regionu, dla krajów, które leżą w Europie Wschodniej.
Zad. 3. Wyświetl wszystkie kolumny, które powstaną w wyniku złączenia, które pozwoli wypisać wszystkie kraje, w którym mówi się w języku francuskim.
Zad. 4. Wyświetl nazwę kraju i jego populację z roku 1997, dla każdego kraju, który w tym roku miał ponad 100 000 000 mieszkańców. Uszereguj wyniki malejącą według populacji.
Zad. 5. Poprzednie polecenie zmodyfikuj tak, aby wyświetlić także kontynent, na którym leży dane państwo.
Zad. 6. Wypisz całkowitą powierzchnię dla każdego kontynentu (czyli co najmniej 2 kolumny: powierzchnia i nazwa kontynentu). Posortuj rosnąco według powierzchni.

SELECT * FROM regions JOIN continents ON regions.continent_id = continents.continent_id
  
1. SELECT r.name region, c.name kontynent FROM regions r JOIN continents c ON r.continent_id = c.continent_id;
2. SELECT c.name kraj, r.name region FROM countries c JOIN regions r ON c.region_id WHERE r.name = "Eastern Europe";
3. SELECT name, language FROM country_languages JOIN countries USING(country_id) JOIN languages USING(language_id) WHERE language = "French";
4. SELECT name, population, year FROM `country_stats` cs JOIN countries c USING(country_id) WHERE year = 1997 AND population >= 100000000 ORDER BY population DESC;
5. SELECT countries.name, population, year, continents.name kontynent FROM `country_stats` NATURAL JOIN countries JOIN  regions USING(region_id) JOIN continents USING(continent_id) WHERE year = 1997 AND population >= 100000000 ORDER BY population DESC;
6. SELECT cont.name AS kontynent, SUM(c.area) AS powierzchnia FROM countries c JOIN regions r USING(region_id) JOIN continents cont USING(continent_id) GROUP BY cont.name ORDER BY powierzchnia ASC;

