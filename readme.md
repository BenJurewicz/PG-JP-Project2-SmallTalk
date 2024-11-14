# SmallTalk

## 1. Trojkat rownoboczny
-   zmienna bok - dlugosc boku
-   pierwszy wieszcholek w 0@0
-   dodac metody jak w kwadracie:
    - [x] **dodawanie pol figur**
        dodaje dwie figury zwraca nowa figure o danym polu
    - [x] **pole**
        oblicza pole figury

## 2. Wielokat
https://www.desmos.com/calculator/gkk0epewct

**Rozszerzyc o**
- [x] **metoda skaluj przyjmująca liczbe (skaluj: liczba)**
    -   przeskaluj bok zgodnie z podana skala
    -   trzeba pewnie zaktualizowac wieszcholki
- [x] **metoda druku**
    - wypisuje wieszczcholki i pole wielokata - instruckja pkt. 3 (idk ocb w tym cytacie)

- [x] **metoda obroc przyjmuje kat**
    -   sprawdza czy 0 < kat < 90
    -   obraca odbiorce o kat w prawo (chyba chodzi o punkty)

## Dodatkowe informacje

### Wyborane podpunkty z puntkow w instrukcji
 1. Figura - trojkat rownoboczny (bok)
 2. Nieparzysta - komunikat "skaluj:liczba"

### Optional fix for double float errors
Compile the gst compiler with the flag --no-pie
https://stackoverflow.com/questions/17125678/floating-point-raises-divide-by-zero-error-in-gnu-smalltalk-gst
