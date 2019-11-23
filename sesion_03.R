# Vamos a crear una un funcion para validar si nuestra variable es superior a 40

x <- 23

if(x > 40){
  print('la variable x es mayor a 40')
} else{
  print('la variable x es menor a 40')
}

funcion_ejemplo <- function(x = 0){
  # print(paste('y = ',y))
  if(x > 40){
    print('la variable x es mayor a 40')
    return(TRUE)
  } else{
    print('la variable x es menor a 40')
    return(F)
  }
}

for(i in 10:50){
  funcion_ejemplo(i)
}

# Ejemplo while
x <- 50
while(funcion_ejemplo(x)){
  x <- x - 5
  print(x)
}

# Ejemplo repeat
x <- 50
repeat{
  if(!funcion_ejemplo(x)) break
  x <- x - 5
  print(x)
}

library(readxl)
ecobici <- read_excel("ecobici.xls")
View(ecobici)

# Solución reto 1
library(tidyverse)

# primera version
estacion1 <- 0
for(elemento in ecobici$nearbyStations){
  if(!(elemento %>% is.na())) estacion1 <- estacion1 + 1
}

estacion1 <- sum(!is.na(ecobici$nearbyStations))
print(estacion1)

estacion2 <- sum(!is.na(ecobici$nearbyStations2))
print(estacion2)

estacion3 <- sum(!is.na(ecobici$nearbyStations3))
print(estacion3)

estacion4 <- sum(!is.na(ecobici$nearbyStations4))
print(estacion4)

estacion5 <- sum(!is.na(ecobici$nearbyStations5))
print(estacion5)

estacion6 <- sum(!is.na(ecobici$nearbyStations6))
print(estacion6)

#ejemplo 2
View(mtcars)
colnames(mtcars)

rownames(mtcars)[1:5]

for(i in 1:5){
  # print(i)
  print(rownames(mtcars)[i])
}

# adicional, cómo reemplazar los rownames por indices enteros
# y pasar las rownames a una columna adicional 
mtcars$modelo <- row.names(mtcars)
row.names(mtcars) <- seq(1:nrow(mtcars))
View(mtcars)

# pista
for(i in 1:nrow(ecobici)){
  # print(i) 
  print(paste('colonia :',ecobici$Colonia[i]))
  print(paste('latitud :',ecobici$latitud[i]))
}

# solucion
colonias <- c()
for(i in 1:nrow(ecobici)){
  # print(i) 
  if(ecobici$latitud[i] > 19.423396){
    # print(paste('la colonia: ', ecobici$Colonia[i], 'está más al norte de Chapultepec'))
    colonias <- c(colonias, ecobici$Colonia[i])
  }
}
colonias %>% unique()

#Ejemplo 3
lista_precios <- c()
precio <- 20
while(precio <= 2500){
  lista_precios <- c(lista_precios, precio)
  precio <- precio + 5
}
length(lista_precios)

#Reto 3

#pista
colonias <- ecobici$Colonia %>% unique()
ecobici[ecobici$Colonia == 'Polanco',]

ecobici %>% filter(Colonia == 'Polanco')

#Solucion muy simplificada
ecobici %>% select(Colonia,`Codigo Postal`) %>% unique()

#solución iterativa
for (colonia in ecobici$Colonia %>% unique()) {
  num_codigos <- ecobici[ecobici$Colonia == colonia,]$`Codigo Postal` %>% 
    unique() %>% # cuales son los unicos
    length() # cuantos valores unicos hay
  print(paste('la colonia',colonia,'tiene',num_codigos,'códigos postales'))
}
