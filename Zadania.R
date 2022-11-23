#################################### Zadanie 1 ##################################################################
# Zadanie wykonane, bo przesałane za pomocą githuba

#################################### Zadanie 2 ##################################################################
V1 <- 120
V2 <- 90

V <- 2*V1*V2/(V1+V2)


print(paste("Średnia prędkość pociągu to:", V, "km/h"))


#################################### Zadanie 3 ##################################################################

#Funkcja pomocnicza - do porównania wyników
pearsonFunction <- function(a, b){
  pearsonFactor <- cor(a, b, method = "pearson")
  print(paste("Współczynnik korelacji Pearsona dla podanych wektorów to:", pearsonFactor))
}

#Funkcja właściwa
pearsonFunction2 <- function(a, b){
  if (length(a)!=length(b)){
    return("Wektory mają różne rozmiary")
  }
  
  licz_r <- 0
  mian_x_r <- 0
  mian_y_r <- 0
  for(i in 1:length(a)){
    
    x_dif <- a[i]-mean(a)
    y_dif <- b[i]-mean(b)
    
    licz_r_temp <- x_dif*y_dif
    licz_r <- licz_r + licz_r_temp
    
    mian_x_r_temp <- x_dif^2
    mian_y_r_temp <- y_dif^2
    
    mian_x_r <- mian_x_r_temp + mian_x_r
    mian_y_r <- mian_y_r_temp + mian_y_r
    
  }
  
  return(licz_r/sqrt(mian_x_r * mian_y_r))
}

#Deklaracja wektorów
a <- c(2, 5, 8, 2, 7)
b <- c(2, 4, 8, 2, 1)

# Wywołanie funkcji
pearsonFunction(a, b)
pearsonFunction2(a, b)

print(paste("Współczynnik korelacji Pearsona dla podanych wektorów to:", pearsonFunction2(a, b)))


# Pobranie danych
dane <- read.csv('dane.csv', sep = ";")


# Wynik
print(paste("Współczynnik korelacji Pearsona dla podanych wektorów to:", pearsonFunction2(dane[['waga']], dane[['wzrost']])))

#Współczynnik korelacji jest bliski 1, co oznacza, ze waga oraz wzrost są ze sobą pozytywnie skorelowane
#Można założyć, że dla dostarczonych danych waga rośnie wraz ze wzrostem


#################################### Zadanie 4 ##################################################################

# Funkcja pomocnicza
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

#Funkcja właściwa
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

#Wywołanie funkcji
stworzDataFrame(n_rows=2)


#################################### Zadanie 5 ##################################################################

# Funkcja pomocnicza
f_type <- function(funkcja="mean", df, nazwaKolumny){
  if (funkcja=="mean"){
    return(mean(df[[nazwaKolumny]], na.rm = TRUE))
  }else if (funkcja=="max"){
    return(max(df[[nazwaKolumny]], na.rm = TRUE))
  }else if (funkcja=="median"){
    return(median(df[[nazwaKolumny]], na.rm = TRUE))
  }else if (funkcja=="min"){
    return(min(df[[nazwaKolumny]], na.rm = TRUE))
  }else{
    return("Niepoprawna nazwa funkcji")
  }
}

#Funkcja właściwa
liczZplikow <- function(sciezka="smogKrakow2/",nazwaKolumny="263_temperature",jakaFunkcja="mean",DlaIluPlikow=1){ 
  
  #Określenie listy plików oraz sprawdzenie poprawności ścieżki
  files_list <- list.files(path = sciezka, pattern="*.csv")
  if (length(files_list)==0){
    return("Nieprawidłowa ścieżka pliku")
  }
  
  # Funkcja for przeglądająca pliki i łącząca je w 1 dataframe
  for(i in 1:length(files_list)){
    file_name <-paste(sciezka, files_list[i], sep="")
    df_temp <- read.csv(file_name, sep=",")
    colnames(df_temp) <- sub("^X", "", colnames(df_temp))
    if(i==1){
      df <- data.frame(matrix(ncol = length(colnames(df_temp)), nrow = 0))
      colnames(df) <- colnames(df_temp)
    }
    
    df <- rbind(df, df_temp)
    
    # Funkcja for przerywana, gdy dataframe składa się z wymaganej liczby plików
    if (i==DlaIluPlikow){
      break;
    }
  }
  # Sprawdzenie poprawności nazwy kolumny
  if (!(nazwaKolumny %in% colnames(df))){
    return("Nieprawidłowa nazwa kolumny")
  }
  
  # Funkcja odpowiedzialna za drukowanie wyników w zależności od tego, co chcemy wyliczyć
  return(f_type(jakaFunkcja, df, nazwaKolumny))
}



#Wywołanie funkcji
liczZplikow(sciezka="smogKrakow2/",jakaFunkcja="mean", nazwaKolumny = "263_temperature", DlaIluPlikow=4)
liczZplikow(jakaFunkcja="max", DlaIluPlikow=10)
liczZplikow()

