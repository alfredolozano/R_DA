# Sesion 04

# Ejemplo 1
mtcars %>% nrow() # numero de rows
mtcars %>% ncol() # numero de columns

sum(mtcars %>% is.na()) # numero de na's
mtcars %>% View()

#Reto 1 funcion str()
mtcars %>% str
# adicional
mtcars %>% summary

# Ejemplo 2
mtcars$cyl %>% hist()
mtcars$hp %>% hist

plot(x = mtcars$cyl, y = mtcars$hp)

# reto 2
ecobici$num_estaciones_cerca <- 
  as.numeric(!is.na(ecobici$nearbyStations)) + 
  as.numeric(!is.na(ecobici$nearbyStations2)) + 
  as.numeric(!is.na(ecobici$nearbyStations3)) + 
  as.numeric(!is.na(ecobici$nearbyStations4)) + 
  as.numeric(!is.na(ecobici$nearbyStations5)) + 
  as.numeric(!is.na(ecobici$nearbyStations6))
  
ecobici %>% group_by(Colonia) %>% 
  summarise(numero_estaciones = length(unique(ID)),
            suma_estaciones_cerca = sum(num_estaciones_cerca),
    estaciones_cerca_promedio = mean(num_estaciones_cerca)) %>% 
  View()

ecobici %>% ggplot() +
  geom_point(aes(x=longitud,y=latitud,color=Colonia))

ecobici %>% ggplot() +
  geom_point(aes(x=longitud,y=latitud,color=`Codigo Postal`))

# Ejemplo3
# version filtrada
mtcars$cyl <- mtcars$cyl %>% as.factor()
mtcars$is_8cyl <- NA
mtcars[mtcars$cyl == '8',]$is_8cyl <- 'si'
mtcars[mtcars$cyl != '8',]$is_8cyl <- 'no'
mtcars$is_8cyl <- mtcars$is_8cyl %>% as.factor()

# version vectorizada
mtcars$is_8cyl <- NA
mtcars$is_8cyl <- if_else(mtcars$cyl == '8','si','no')
mtcars %>% View()

# Reto 03
ecobici$Tipo <- ecobici$Tipo %>% as.factor 
ecobici$Tipo %>% summary()

ecobici %>% 
  group_by(Tipo) %>% 
  summarise(numero_estaciones = length(unique(ID)))

ecobici %>% 
  ggplot() + geom_bar(aes(x=Tipo,fill=Tipo))
  