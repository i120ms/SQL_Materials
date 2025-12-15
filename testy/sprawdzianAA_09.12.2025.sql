2. Napisz zapytanie, które zmodyfikuje tabelę naleśniki, zwiększając wartość kolumny ocena o 1 tam, gdzie w kolumnie składniki występuje "nutella" lub "dzem".
  UPDATE nalesniki SET ocena=ocena+1 WHERE skladniki LIKE "%nutella%" OR skladniki LIKE "%dzem%";

3. Tabela klasy ma następujące kolumny: id_klasy, numer, wychowawca. Tabela uczniowie ma następujące kolumny: id, imie, nazwisko, id_klasy. Które polecenie wypisze imiona i nazwiska uczniów klasy 4AT?
  C. SELECT imie, nazwisko FROM uczniowie JOIN klasy USING(id_klasy) WHERE numer = "4AT";

5. Tabela owoce ma 3 kolumny: ID, nazwa, ilość. ID ma własność auto_increment. Które polecenie (zawsze) zwiększy sumaryczną ilość owoców w tabeli o 4? (na potrzeby zadania załóż, że żadna kolumna nie ma własności UNIQUE)
  D. INSERT INTO owoce VALUES (10, "sliwka", 4), (11, "borówka", 0), (12, "banan", 0); 
