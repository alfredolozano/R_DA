#Ejemplo 1
reyes <- scan("https://robjhyndman.com/tsdldata/misc/kings.dat")

reyes <- scan("https://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)

str(reyes)
reyes %>% class
reyes <- ts(reyes)
reyes %>% class

plot(reyes)
#Reto 1
leche_d <- read_csv('leche_dia.csv')
leche_m <- read_csv('leche_mes.csv')

leche_d$date_time <- leche_d$date_time %>% as.Date(format = "%Y-%m-%d")
leche_m$month <- leche_m$month %>% as.Date(format = "%Y-%m-%d")

#Ejemplo 2
ventas <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")

str(ventas)
ventas <- ts(ventas, frequency=12, start=c(1987,1)) 
ventas

plot(ventas)

logventas <- log(ventas)
plot(logventas)

decventas <- decompose(logventas)
plot(decventas)

decompose(ventas) %>% plot
# Reto 02
leche_m$Year <- leche_m$month %>% format(format="%Y")

leche_m %>% ggplot(aes(x = month, y = milk_prod_per_cow_kg))+
  geom_line(aes(colour = Year))

leche_m$milk_prod_per_cow_kg %>%
  ts(frequency = 12, start(1962,1)) %>% 
  decompose() %>% plot()

# Ejemplo 3
library('ggplot2')
library('forecast')
library('tseries')
setwd("~/Desktop/Bedu - Introducci??n R/A2-Programacion-con-R/Sesion-06/Ejemplo-03")
dia <- read.csv("dia.csv")

str(dia)

dia$cnt %>% 
  ts(frequency = 365, start = c(2011,1,1)) %>%
  tsclean() %>% 
  plot()

dia$cnt %>% 
  ts(frequency = 30, start = c(2011,1)) %>%
  tsclean() %>% 
  decompose %>% 
  plot()

dia$cnt %>% 
  ts(frequency = 30, start = c(2011,1)) %>%
  log() %>% 
  tsclean() %>% 
  decompose() %>% 
  plot()

dia$dteday <- as.Date(dia$dteday)

ggplot(dia, aes(dteday, cnt)) + 
  geom_line() + scale_x_date('Mes')  + 
  ylab("Bicis usadas diariamente") + xlab("")

recuento <- ts(dia[, c('cnt')])
dia$outliers <- tsclean(recuento)
ggplot() + geom_line(data = dia, aes(x = dteday, y = outliers)) + ylab('Recuento de bicis sin outliers')

dia$recuento_ma_sem = ma(dia$outliers, order=7) 
dia$recuento_ma_mes = ma(dia$outliers, order=30)

ggplot() +
  geom_line(data = dia, aes(x = dteday, y = outliers, colour = "Cuenta")) +
  geom_line(data = dia, aes(x = dteday, y = recuento_ma_sem,   colour = "MA semanal"))  +
  geom_line(data = dia, aes(x = dteday, y = recuento_ma_mes, colour = "MA mensual"))  +
  ylab('Recuento Bicis')

cuenta_ma <- ts(na.omit(dia$recuento_ma_sem), frequency=30)
desc <- decompose(cuenta_ma)
desestac <- seasadj(desc)
plot(desestac)

adf.test(cuenta_ma, alternative = "stationary")

Acf(cuenta_ma, main='')
Pacf(cuenta_ma, main='')

cuenta_dif = diff(desestac, differences = 1)
plot(cuenta_dif)
adf.test(cuenta_dif, alternative = "stationary")

Acf(cuenta_dif, main='ACF de serie diferenciada')
Pacf(cuenta_dif, main='PACF de serie diferenciada')

# cuales son p,d y q del modelo que mejor ajusta
auto.arima(desestac, seasonal=FALSE)

fit2 <- arima(desestac, order=c(2,1,0))
fit2
tsdisplay(residuals(fit2), lag.max=15, main='Estacionalidad en los residuos')


fcast <- forecast(fit2, h=30)
plot(fcast)
