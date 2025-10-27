Zad. 1. Przypisz Polskę, Słowację, Czechy, Słowenię i Węgry do nowego regionu: Central Europe.
Zad. 2. Na Wyspach Heard i McDonalda zamieszkało dwoje ludzi. Uwzględnij to w bazie danych (zmień populację i oczekiwaną długość życia).
Zad. 3. Wszystkie kraje, gdzie królową jest Elżbieta II (Elisabeth II) i które nie są niepodległe (IndepYear IS NULL) ogłosiły niepodległość w roku 2025. Zaznacz to w bazie danych.
Zad. 4. W Stanach Zjednoczonych procent populacji mówiącej po angielsku spadł do 80 %. Zaktualizuj bazę danych.
Zad. 5. W Angoli języki: Mbundu i Ovimbundu uzyskały tytuły języków oficjalnych. Uwzględnij to bazie w danych.
Zad. 6. Chiny, Hong Kong i Macao utworzyły nowy region: Hundred Acre Wood. Uwzględnij to w bazie danych. Dodatkowo zmień rządzącego całym regionem na: Winnie-the-Pooh.
Zad. 7. Uwzględnij w bazie następujące zmiany dotyczące Federacji Rosyjskiej:
i) nazwa: Mordor,
ii) populacja: 90 % obecnej,
iii) oczekiwana długość życia: o 10 mniejsza,
iv) władca: Sauron.
Zad. 8. Zwiększ ID każdego z miast o 100.
Zad. 9. Dla całego świata: podwój wartość GNP. Zachowaj poprzednią wartość GNP w GNPOld.

1. UPDATE country SET Region = 'Central Europe' WHERE Name IN ('Poland', 'Slovakia', 'Czech Republic', 'Slovenia', 'Gungary'); 
2. UPDATE country SET Population = 2, LifeExpectancy = 75 WHERE Name = 'Heard Island and McDonald Islands'; 
3. UPDATE country SET IndepYear = 2025 WHERE HeadOfState = 'Elisabeth II' AND IndepYear IS NULL; 
4. UPDATE countrylanguage SET Percentage = 80 WHERE Name = 'United States';
5. UPDATE countrylanguage SET IsOfficial = 'T' WHERE CountryCode = (SELECT CODE FROM country WHERE Name = 'Angola') AND Language IN ('Mbundu', 'Ovimbundu'); 
6. UPDATE country SET Region = 'Nowy', HeadOfState = '123' WHERE Name IN ('China', 'Hong Kong'); 
7. 
8.UPDATE city SET ID = ID + 100 ORDER BY ID DESC;
9.UPDATE country SET GNPOld = GNP, GNP = GNP *2; 
