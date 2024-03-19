# Problem:
# Need to generate categories

# Solution:
# Runtime ~0.003 seconds

INSERT INTO `categories` (`priority`,`name_be`,`name_cz`,`name_en`,`name_lv`,`name_pl`,`description_be`,`description_cz`,`description_en`,`description_lv`,`description_pl`)
VALUES
    (0,'Матэматыка','Matematika','Mathematics','Matemātika','Matematyka','Простая матэматыка','Matematika jednoduchá','Mathematics simple','Vienkārša matemātika','Matematyka prosta'),
    (1,'Фізіка','Fyzika','Physics','Fizika','Fizyka','Простая фізіка','Fyzika jednoduchá','Physics simple','Vienkārša fizika','Fizyka prosta'),
    (2,'Хімія','Chemie','Chemistry','Ķīmija','Chemia','Хімія простая','Chemie jednoduchá','Chemistry simple','Ķīmija vienkārša','Chemia prosta'),
    (3,'Гісторыя','Dějiny','History','Vēsture','Historia','Гісторыя простая','Historie jednoduchá','History simple','Vēsture vienkārša','Historia prosta'),
    (4,'Праграмаванне','Programování','Programming','Programmēšana','Programowanie','Праграмаванне простае','Programování jednoduché','Programming simple','Programmēšana vienkārša','Programowanie proste'),
    (5,'Алгарытмы','Algoritmy','Algorithms','Algoritmi','Algorytmy','Алгарытмы простыя','Algoritmy jednoduché','Algorithms simple','Algoritmi vienkārši','Algorytmy proste'),
    (6,'Структуры дадзеных','Datové struktury','Data structures','Datu struktūras','Struktury danych','Структуры дадзеных простыя','Datové struktury jednoduché','Data structures simple','Datu struktūras ir vienkāršas','Struktury danych proste'),
    (7,'Статыстыка','Statistika','Statistics','Statistika','Statystyka','Статыстыка простая','Statistika jednoduchá','Statistics simple','Statistika vienkārša','Statystyka prosta'),
    (8,'Біялогія','Biologie','Biology','Bioloģija','Biologia','Біялогія простая','Biologie jednoduchá','Biology simple','Bioloģija vienkārša','Biologia prosta'),
    (9,'Літаратура','Literatura','Literature','Literatūra','Literatura','Літаратура простая','Literatura jednoduchá','Literature simple','Literatūra vienkārša','Literatura prosta');