## Exploratory Data Analysis of mtcars dataset
suppressMessages(library(dplyr))
mtcars
summary(mtcars)
# Name of all Columns
names(mtcars)

# Exploratory Data Analysis

summary(mtcars$mpg)
hist(mtcars$mpg)
sum(is.na(mtcars$mpg))


summary(mtcars$cyl)
table(mtcars$cyl)
hist(mtcars$cyl %>% as.numeric(),xlab='No. of Cylinder')

summary(mtcars$disp)
sum(is.na(mtcars$disp))
hist(mtcars$disp)

summary(mtcars$hp)

