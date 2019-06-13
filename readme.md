# Zadanie 3 - porównanie metod całkowania

Program pwostał jako zadanie zaliczeniowe z przedmiotu "Programowanie w języku Fortran". Jest to prgram prezentujący metody całkowania (metodę kwadratów, trapezów) wraz z zastosowaniem mechanizmu coarrays do współbieżnego obliczenia wyników całkowania dla podprzedziałów przedziału całkowania (było ich 8).

## Składowe projektu

Projekt składa się z 2 folderów oraz pliku uruchomieniowego.
```
.
├── src                         #(folder zawierający pliki źródłowe)
    ├── functions.F90           #(interfejs funkcji oraz przykładowe funkcje)
    ├── rectangle.F90           #(implementacja metody kwadratów)             
    ├── trapezoid.F90           #(implementacja metody trapezów)
    ├── main.F90                #(kod programu testującego)
├── res                         #(folder zawierjący wyniki działania)
    ├── results                 #(wyniki testowego wykonania)
```

## Sposób użycia
```
./main                          #(bezpośrednie uruchomienie programu testującego)
make test                       #(uruchmienie za pomocą make)
```

Uruchomienie programu spowoduje wypisanie w konsoli wyników obliczenia całek na przedziale od -1 do 1 dla zdefiniowanych funkcji (x^2 + 2x + 1, cos(x) oraz e^x) wraz z porównaniem z przewidywanym wynikiem. Wyświetlone komunikaty zostaną również zapisane w pliku /res/results.
## Wyniki działania
Otrzymane wyniki dla metody kwadratów (podział przedziału na 8 części):

```
2.65625000000000    dla y(x) = x^2 + 2 * x + 1     
1.68733263340509    dla y(x) = cos(x)               
2.34429268716435    dla y(x) = e^x     
```
Otrzymane wyniki dla metody trapezów (podział przedziału na 8 części):

```
2.68750000000000    dla y(x) = x^2 + 2 * x + 1     
1.67416750270445    dla y(x) = cos(x)               
2.36263133358521    dla y(x) = e^x     
```

Wyniki analityczne otrzymane za pomocą narzędzia Wolfram Alpha.

![alt text](https://github.com/Marwin34/fortran_homework_3/tree/master/res/poly.png "Analityczny wynik dla y(x) = x^2 + 2 * x + 1 wynoszący 8/3.")


![alt text](https://github.com/Marwin34/fortran_homework_3/tree/master/res/cosine.png "Analityczny wynik dla y(x) = cos(x) wynoszący 2 * sin(1).")
 
![alt text](https://github.com/Marwin34/fortran_homework_3/tree/master/res/exponential.png "Analityczny wynik dla y(x) = cos(x) wynszący e - 1/e.")

## Wnioski
Otrzymane wyniki nie odbiegają znacznie od tych wyznaczonych analitycznie, z tego wynika, że dla testowanych funkcji prezentowane metody całkowania dają dobre przybliżenie wyniku.
Dokładność wyników zależy również od gęstosci podziału przedziału całkowania (np podział na 8 fragmentów).