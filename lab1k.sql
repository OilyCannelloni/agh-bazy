
/*
1. Napisz polecenie select, za pomocą którego uzyskasz tytuł
i numer książki
*/

--SELECT title, isbn FROM item, title

/*
2. Napisz polecenie, które wybiera tytuł o numerze 10
*/

--SELECT title
--FROM title
--WHERE title_no = 10

/*
3. Napisz polecenie, które wybiera numer czytelnika i karę
dla tych czytelników, którzy mają kary między $8 a $9 
*/

--SELECT DISTINCT member_no, fine_assessed
--FROM loanhist
--WHERE fine_assessed BETWEEN 8 AND 9

/*
4. Napisz polecenie select, za pomocą którego uzyskasz
numer książki i autora dla wszystkich książek, których
autorem jest Charles Dickens lub Jane Austen
*/

--SELECT isbn, author
--FROM item, title
--WHERE author in ('Charles Dickens', 'Jane Austen')

/*
5. Napisz polecenie, które wybiera numer tytułu i tytuł dla
wszystkich rekordów zawierających string „adventures”
gdzieś w tytule.
*/

--SELECT title_no, title
--FROM title
--WHERE title LIKE '%adventures%'

/*
6. Napisz polecenie, które wybiera numer czytelnika, karę
oraz zapłaconą karę dla wszystkich, którzy jeszcze nie
zapłacili.
*/

--SELECT member_no, fine_assessed, fine_paid
--FROM loanhist
--WHERE fine_assessed is not NULL and fine_assessed != 0 and (fine_paid is NULL or fine_assessed - fine_waived > fine_paid)

/*
7. Napisz polecenie, które wybiera wszystkie unikalne pary
miast i stanów z tablicy adult.
*/
--SELECT DISTINCT city, state
--FROM adult



/*
1. Napisz polecenie, które wybiera wszystkie tytuły z tablicy
title i wyświetla je w porządku alfabetycznym.
*/

--SELECT title
--FROM title
--ORDER BY title


/*
2. Napisz polecenie, które:
- wybiera numer członka biblioteki, isbn książki i wartość
naliczonej kary dla wszystkich wypożyczeń, dla których naliczono karę
- stwórz kolumnę wyliczeniową zawierającą podwojoną wartość
kolumny fine_assessed
- stwórz alias ‘double fine’ dla tej kolumny
*/

--SELECT member_no, isbn, 'double fine' = 2*fine_assessed
--FROM loanhist
--WHERE fine_assessed is not NULL and fine_assessed > 0



/*
3. Napisz polecenie, które
- generuje pojedynczą kolumnę, która zawiera kolumny: imię
członka biblioteki, inicjał drugiego imienia i nazwisko dla
wszystkich członków biblioteki, którzy nazywają się Anderson
 
-nazwij tak powstałą kolumnę „email_name”

-zmodyfikuj polecenie, tak by zwróciło „listę proponowanych
loginów e-mail” utworzonych przez połączenie imienia członka

- zmodyfikuj polecenie, tak by zwróciło „listę proponowanych
loginów e-mail” utworzonych przez połączenie imienia członka
biblioteki, z inicjałem drugiego imienia i pierwszymi dwoma
literami nazwiska (wszystko małymi literami).

- wykorzystaj funkcję SUBSTRING do uzyskania części kolumny
znakowej oraz LOWER do zwrócenia wyniku małymi literami
wykorzystaj operator (+) do połączenia stringów.
*/

--SELECT LOWER(firstname + middleinitial + SUBSTRING(lastname, 1, 2)) AS 'email_name'
--FROM member
--WHERE lastname = 'Anderson'



/*
4. Napisz polecenie, które wybiera title i title_no z tablicy
title.
- Wynikiem powinna być pojedyncza kolumna o formacie jak w
przykładzie poniżej:

The title is: Poems, title number 7

Czyli zapytanie powinno zwracać pojedynczą kolumnę w oparciu
o wyrażenie, które łączy 4 elementy:
stała znakowa ‘The title is:’
wartość kolumny title
stała znakowa ‘title number’
wartość kolumny title_no
*/
SELECT 'The title is: ' + title + ', title number:' + STR(title_no)
FROM title