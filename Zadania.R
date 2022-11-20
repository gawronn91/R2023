# Zadanie 2
V1 <- 120
S1 <- 1
V2 <- 90
S2 <- 1

t1 <- s1/V1
t1 <- s2/V2

V <- (S1 + S2)/(t1 + t2) 

V <- c(V1, V2)
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! to przerobić
print(paste("Średnia prędkość pociągu to:", mean(V), "km/h"))




#Zadanie 3: Utwórz funkcję obliczającą współczynnik korelacji r Pearsona dla 
#2 wektorów o tej samej długości.Wczytaj dane plik dane.csv i oblicz 
#współczynnik dla wagi i wzrostu. W komentarzu napisz co oznacza wynik.

pearsonFunction <- function(a, b){
  pearsonFactor <- cor(a, b, method = "pearson")
  print(paste("Współczynnik korelacji Pearsona dla podanych wektorów to:", pearsonFactor))
}

a <- c(2, 5, 8, 2, 7)
b <- c(2, 5, 6, 1, 9)

pearsonFunction(a, b)

dane <- read.csv('dane.csv', sep = ";")
#może byc też read.csv2('dane.csv')

pearsonFunction(dane['waga'], dane['wzrost'])

#Współczynnik korelacji jest bliski 1, co oznacza, ze waga oraz wzrost są ze sobą pozytywnie skorelowane
#Można założyć, że dla dostarczonych danych waga rośnie wraz ze wzrostem


#4. Napisz funkcję zwracającą ramke danych z danych podanych przez użytkownika
#stworzDataFrame <- function(ile=1)
#W pierwszym wierszu użytkownik podaje nazwy kolumn. w kolejnych wierszach zawartość wierszy ramki danych 
#( tyle wierszy ile podaliśmy w argumencie ile. ile=1 oznacza, że gdy użytkownik nie poda żadnej wartości 
#jako parametr, domyślna wartością będzie 1)

#Najpierw pobieramy liczbę kolumn, a potem podajemy wartosci wierszami!!!!



class(xx)
stworzDataFrame <- function(n=1){
 
}





#5 Napisz funkcję , która pobiera sciezkeKatalogu, nazweKolumny, jakaFunkcje, DlaIluPlikow i liczy: 
#mean, median,min,max w zależności od podanej nazwy funkcji w argumencie, z katologu który podaliśmy i z tylu plików ilu podaliśmy dla wybranej nazwy kolumny. 
# UWAGA: w podanych plikach R pobierając komórki nazwane liczbami R wstawi przed nazwy X. Funkcję przetestuj dla katalogu smogKrakow.zip.  Wykonując obliczenia pomiń brakujące wartości.

# liczZplikow <- function(sciezka,nazwaKolumny,jakaFunkcja="mean",DlaIluPlikow=1){ 
#   
#   #...
#   
# }
# 
# Lista plików w katalogu: 
#   
#   list.files(sciezka)
# 
# Omijanie na : na.omit(myDataFrame[[nazwaKolumny]])
# Do złączania stringów: 
#   
#   paste("string1","string2",sep="TU WSTAW SEPARATOR")
# Gdy mamy, rózne oznaczenia NA w plikach możemy wykorzystać ( w tym wypadku pusty znak i NA: na.strings=c("","NA")


dttest <- readcsv("./smogKrakow2/0012017.csv")
mean(dttest$x3_pressure,na.rm=TRUE)

# Pamietac o tym, ze wybieramy, z ilu plików zczytujemy
#funkcjonuja komendy break, next w pętlach for, while


