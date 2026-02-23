Zad. 1. Wyświetl nazwę i national_day każdego europejskiego kraju. W przypadku wartości NULL, wpisz dzisiejszą datę.
Zad. 2. Wyświetl wszystkie kraje, których national_day wypadł przed rokiem 1970.
Zad. 3. Wyświetl nazwę kraju, national_day i nową kolumnę age, wartości będą zależeć od national_day w następujący sposób:
  
(−∞, 1600) - bardzo stary
[1600, 1800) - stary
[1800, 1900) - mniej stary
[1900, 1950) - trochę młody
[1950, 2000) - młody
[2000,∞) - bardzo młody 
∅ - BRAK DANYCH
  
Zad. 4. Wyświetl kraje, które mają powierzchnię powyżej światowej średniej.
Zad. 5. Dla każdego kontynentu wyświetl kraje, które mają powierzchnię powyżej średniej dla danego kontynentu.
Zad. 6. Wyświetl wszystkie kraje, w których nie ma oficjalnego języka.
Zad. 7. Wyświetl liczbę krajów, które przez cały okres pomiarów, miały populację powyżej 10 milionów.
Zad. 8. Wyświetl liczbę krajów, które choć w jednym roku, miały populację powyżej 10 milionów.
Zad. 9. Wyświetl kraje, które w roku 2003 miały populację poniżej średniej (użyj joina)
Zad. 10. Wyświetl kraje, które w roku 2003 miały populację poniżej średniej (użyj exists, nie używaj joina)
Zad. 11. Wyświetl liczbę regionów, które mają 10 lub więcej krajów.
Zad. 12.* Policz medianę powierzchni krajów.

  1. SELECT c.name,
IF(c.national_day IS NULL, CURRENT_DATE, c.national_day) AS national_day
FROM countries c
JOIN regions r ON c.region_id = r.region_id
JOIN continents ct ON r.continent_id = ct.continent_id
WHERE ct.name = 'Europe';
  2. SELECT name, national_day FROM countries WHERE YEAR(national_day) < 1970;
  3. SELECT
name AS country_name,
national_day,
CASE
WHEN national_day IS NULL THEN 'BRAK DANYCH'
WHEN YEAR(national_day) < 1600 THEN 'bardzo stary'
WHEN YEAR(national_day) >= 1600 AND YEAR(national_day) &lt; 1800 THEN 'stary'
WHEN YEAR(national_day) >= 1800 AND YEAR(national_day) &lt; 1900 THEN 'mniej stary'
WHEN YEAR(national_day) >= 1900 AND YEAR(national_day) &lt; 1950 THEN 'trochę młody'
WHEN YEAR(national_day) >= 1950 AND YEAR(national_day) &lt; 2000 THEN 'młody'
WHEN YEAR(national_day) >= 2000 THEN 'bardzo młody'
END AS age
FROM countries;
  4. SELECT name, area FROM countries WHERE area > (SELECT AVG(area) FROM countries);
  5. SELECT name, area, (SELECT AVG(area) FROM countries) AS srednia FROM countries WHERE area > (SELECT AVG(area) FROM countries);
  6. SELECT DISTINCT name, official FROM country_languages NATURAL JOIN countries WHERE country_id != ALL(SELECT country_id FROM country_languages WHERE official =1);
  7. SELECT DISTINCT name, official FROM country_languages NATURAL JOIN countries WHERE country_id != ANY(SELECT country_id FROM country_languages WHERE official =1);
  8. SELECT COUNT(DISTINCT country_id) AS liczba_krajow
FROM country_stats
WHERE population > 10000000;
  9. SELECT c.name, cs.population
FROM countries c
JOIN country_stats cs ON c.country_id = cs.country_id
JOIN (
SELECT AVG(population) AS avg_population
FROM country_stats
WHERE year = 2003
) AS avg2003
WHERE cs.year = 2003
AND cs.population < avg2003.avg_population;
  10. SELECT c.name
FROM countries c
WHERE EXISTS (
SELECT
FROM country_stats cs
WHERE cs.country_id = c.country_id
AND cs.year = 2003
AND cs.population < (
SELECT AVG(population)
FROM country_stats
WHERE year = 2003
)
)
  11. SELECT COUNT(*) AS liczba_regionow
FROM (
SELECT region_id
FROM countries
GROUP BY region_id
HAVING COUNT(country_id) >= 10
) AS A;
  12*. SELECT AVG(1.0 * val)
FROM (
SELECT val FROM dbo.EvenRows
ORDER BY val
OFFSET (@c - 1) / 2 ROWS
FETCH NEXT 1 + (1 - @c % 2) ROWS ONLY
) AS x;

SELECT AVG(area) AS mediana_powierzchni

FROM (
SELECT area
FROM countries
ORDER BY area
LIMIT 2 - (SELECT COUNT(*) FROM countries) % 2
OFFSET (SELECT (COUNT(*) - 1) / 2 FROM countries)
) AS t;
