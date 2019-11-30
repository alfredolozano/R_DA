# sesion 05

library(ggplot2)
library(tidyverse)

# Ejemplo1
ggplot(data = mpg,aes(x=manufacturer,y=class)) +
  geom_count()

vis <- ggplot(mpg, aes(manufacturer))
vis + geom_bar(aes(fill=class), width = 0.5) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) 

# Reto 1 
library(readxl)
ecobici <- read_excel("ecobici.xls")

ggplot(data = ecobici, mapping = aes(Colonia)) +
  geom_bar(aes(fill=Tipo), width = 0.5) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) 

# Ejemplo2
mpg %>% ggplot(aes(x = cty)) +
  geom_density(aes(fill = as.factor(mpg$cyl)))  

# Reto
ecobici %>% ggplot(aes(x = longitud)) +
  geom_density(aes(fill = Colonia)) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) 
