Zad. 1. Wyświetl w jednej kolumnie imię i nazwisko każdego z uczniów.
Zad. 2. Wyświetl imię i nazwisko ucznia, a także projekt, który robi (nie wyświetlaj uczniów bez projektu).
Zad. 3. Wyświetl wszystkie projekty.
Zad. 4. Wyświetl liczbę projektów i liczbę wszystkich uczniów (może być wdwóch komendach).
Zad. 5. Wyświetl wszystkich uczniów i projekty które robią. Wyświetl także uczniów bez projektu.
Zad. 6. Wyświetl projekty, których nikt nie robi.
Zad. 7. Wyświetl wychowawców tych uczniów, którzy nie mają projektu.
Zad. 8. Wyświetl w jednej tabeli wszystkich uczniów i wszystkie projekty
Zad. 9. Wyświetl liczbę projektów i liczbę wszystkich uczniów (musi być jako jedna komenda).
Zad. 10. Wyświetl klasę, wychowawcę i liczbę uczniów.
Zad. 11. Wyświetl klasę, wychowawcę i liczbę uczniów robiących projekt.
Zad. 12. Wyświetl wychowawcę, który ma najmniej uczniów bez projektu.
Zad. 13.* Wyświetl klasę, wychowawcę, liczbę uczniów robiących projekt i liczbę uczniów nie robiących projektu.

1. SELECT CONCAT(imie, ' ', nazwisko) `imie i nazwisko` FROM uczniowie;
2. SELECT CONCAT(imie, ' ', nazwisko) `imie i nazwisko`, nazwa FROM uczniowie JOIN projekty USING (id_ucznia);
3. SELECT * FROM `projekty` 
4. SELECT COUNT(*) FROM projekty 
   SELECT COUNT(*) FROM uczniowie;
5. SELECT imie, nazwisko, nazwa FROM uczniowie LEFT JOIN projekty USING(id_ucznia);
6. 
7. SELECT wychowawca, COUNT(*), GROUP_CONCAT(nazwisko) FROM projekty RIGHT JOIN uczniowie USING(id_ucznia) JOIN klasy USING(id_klasy) WHERE projekty.nazwa IS NULL GROUP BY wychowawca;
8. SELECT imie, nazwisko, nazwa FROM `uczniowie` LEFT JOIN projekty USING(id_ucznia) UNION SELECT imie, nazwisko, nazwa FROM `uczniowie` RIGHT JOIN projekty USING(id_ucznia);
9.
10. SELECT klasy.nazwa klasa, wychowawca, COUNT(*) liczba_uczniow_z_projektem FROM klasy JOIN uczniowie USING(id_klasy) JOIN projekty USING(id_ucznia) GROUP BY wychowawca ORDER BY klasa;
11.
12.
13*.
