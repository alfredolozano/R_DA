
vector1 <- c(1,2,3)
mean(vector1)

class(df)
class(df$carat)

escuela$alumnas

%>% # dplyr pipe operator
%in% # dplyr object in array
  
class(df)  

df %>% class

df %>% class()

df$clarity <- df$clarity %>% as.factor()

summ_1 <- df %>% 
  group_by(clarity) %>%
  summarise(cuantos_hay = length(clarity), precio_promedio = mean(price))

summary(filter(select(df, clarity), clarity == 'SI2'))

