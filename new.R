library(tidyverse)

df <- read_csv("P2-Mispriced-Diamonds.csv")
df %>% str()

df %>% summary()

library(ggplot2)
## El precio de los if
df %>% #filter(clarity=='IF') %>%
  ggplot() +
  geom_point(aes(x=carat,y=price,color=price))
  

df %>% filter(clarity=='IF') %>% summary()
