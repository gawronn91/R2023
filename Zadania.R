# Zadanie 2 Pociąg z Lublina do Warszawy przejechał połowę drogi ze średnią prędkością 120 km/h.

#Drugą połowę przejechał ze średnią prędkością 90 km/h.

#Jaka była średnia prędkość pociągu.
V1 <- 120
V2 <- 90

V <- 2*V1*V2/(V1+V2)


print(paste("Średnia prędkość pociągu to:", V, "km/h"))


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


stworzDataFrame <- function(n_rows=1, sep=","){
  
  #Wczytanie liczby wierszy
  n <- readline(prompt = "podaj liczbe wierszy: ")
  
  # Jeśli nie zostanie wybrana liczba wierszy, będzie to liczba docelowa
  if (n!=""){
    n_rows <- n
  }
  
  # Podanie nazw kolumn
  enter_column_names <- readline(prompt = paste("podaj nazwy kolumn oddzielone znakiem", sep, ": "))
  column_names <- strsplit(enter_column_names, sep)[[1]]
  
  # Deklaracja pustej ramki danych
  df <- data.frame(matrix(ncol = length(column_names), nrow = 0))
  
  # Wpisywanie elementów do poszczególnych wierszy przy pomocy funkcji insertRow
  for(i in 1:n_rows){
    elements = insertRow(length(column_names), sep)
    df = rbind(df, elements)
  }
  colnames(df) <- column_names
  
  df
}
insertRow <- function(n, sep){
  while(TRUE){
    row <- readline(prompt = paste("Podaj elementy wiersza oddzielone znakiem", sep, ": "))
    elements <- strsplit(row, sep)[[1]]
    
    if(length(elements)==n){
      return(elements)
    }
    print(paste("Nieprawidłowa ilosć elementów wiersza! Wpisz", n, "elementów"))
  }
}

stworzDataFrame(n_rows=2)



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


