print("hw")

install.packages("rtools")
install.packages("httr")
install.packages("jsonlite")

library(httr)
library(jsonlite)

endpoint<-"https://api.openweathermap.org/data/2.5/weather?q=Warszawa&appid=1765994b51ed366c506d5dc0d0b07b77&units=metric"

gotWeather<- GET(endpoint)

weatherText<- content(gotWeather, "text")

dataFromJSON <- fromJSON(endpoint)
dfFromJSON <- as.data.frame(dataFromJSON)

#To robi dokładnie to samo
dataFromJSON2 <- fromJSON(endpoint)
dfFromJSON2 <- as.data.frame(dataFromJSON2)
View(dfFromJSON)

x <- 100
class(x)

is.numeric(x)
is.vector(x) # czyli x jest tez wektorem 1-elementowym

x[1]

x2 <- seq(1:10)
x3 <- seq(11,20)
vm <- c(2, 4, 0, -1, 5)

x2 * vm
x2 *  x3


x3 <- seq(20,11, by = -1)
?vector

class(vm)

logiczny <- as.logical(vm)
znakowy <- c("1", "2", "3")

c(znakowy, vm)

class(c(logiczny,vm))

lista <- list(c("1", "2", "3"), c(1, 2, 3), c(TRUE, FALSE))
lista[[2]][2]

wektorZlisty <- lista[[2]]
wektorZlisty[1:2]

vm[vm > 0]


#wektor liczbowy z listy - index2

lista[[2]][lista[[2]]>1]


?matrix

M <- matrix()
wektor <- 1:10
M <- as.matrix(wektor)

matrix(wektor, ncol=5)

wektor2 <- 11:20

rbind(wektor, wektor2)
cbind(wektor, wektor2)


m <- matrix(c(1, 2, 3, 4), ncol=2)
m
t(m)

m2 <- matrix(c(1, 2, 3, 4, 5, 6), ncol=2)
m2
t(m2)


m2 %*% m #mnożenie macierzowe


x <- 10
y <- 3
x/y
x%%y
x%/%y


plec <- c("k", "m", "k", "m")
plecFactor <- as.factor(plec)
unclass(plecFactor)
as.numeric(plecFactor)



plecFactor2<- factor(plec, levels= c("m", "k"))
unclass(plecFactor2)




id<-c(1,2,3)
imie<- c("jan", "kamil", "arek")
plec<- c("m", "k", "m")

df <- data.frame(numer=id, imie, plec)
df

class(df)
summary(df)

df[2,2]
df[2,'imie']
df[2,]


