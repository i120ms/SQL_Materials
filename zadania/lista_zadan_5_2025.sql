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
7.
8.
9.
10.
11.
12.
13*.
