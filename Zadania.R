# Zadanie 2
V1 <- 120
V2 <- 90
V <- c(V1, V2)
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

pearsonFunction(dane['waga'], dane['wzrost'])

#Współczynnik korelacji jest bliski 1, co oznacza, ze waga oraz wzrost są ze sobą pozytywnie skorelowane
#Można założyć, że dla dostarczonych danych waga rośnie wraz ze wzrostem


#4. Napisz funkcję zwracającą ramke danych z danych podanych przez użytkownika
#stworzDataFrame <- function(ile=1)
#W pierwszym wierszu użytkownik podaje nazwy kolumn. w kolejnych wierszach zawartość wierszy ramki danych 
#( tyle wierszy ile podaliśmy w argumencie ile. ile=1 oznacza, że gdy użytkownik nie poda żadnej wartości 
#jako parametr, domyślna wartością będzie 1)
