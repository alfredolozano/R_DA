
read(csv) 

bici_df <- read_csv('ecobici-viajes-enero2018.csv')

bici_df$hora_r <- bici_df$Hora_Retiro %>% 
  substr(1,2) %>% 
  as.integer()

bici_df %>% summary()

bici_df$Edad_Usuario %>% mean()

bici_df[bici_df$Genero_Usuario == 'M',]$Edad_Usuario %>% hist()

filtrados <- bici_df %>% filter(Genero_Usuario == 'M') 

filtrados$Edad_Usuario %>%
  hist()

bici_df %>% ggplot() +
  geom_histogram(aes(x = Edad_Usuario , color = Genero_Usuario),
                 binwidth = 10) +
  facet_wrap(~Genero_Usuario) 
  
bici_df %>% ggplot() +
  geom_histogram(aes(x = hora_r , color = Genero_Usuario),
                 binwidth = 1) +
  facet_wrap(~Genero_Usuario) 

bici_df %>% ggplot() +
  geom_point(aes(x = hora_r,y = Edad_Usuario, color = Genero_Usuario)) 

+
  facet_wrap(~Genero_Usuario) 