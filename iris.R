library(tidyverse)

summary(iris) #Checking data summary, there are no missing values in data

str(iris) #Iris data have 4 key flower features as numeric type corresponding to 3 Species: setosa,versicolor,virginica

boxplot(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length,iris$Petal.Width,names = c('SepLen','SepWid', 'PetLen','PetWid'))

ggplot(data = iris, aes(x=Sepal.Width, y=seq(nrow(iris)), color=Species)) + geom_point() 

iris %>% group_by(Species) %>% 
  summarize(mean(Sepal.Length),mean(Sepal.Width),
            mean(Petal.Length),mean(Petal.Width))

#plot(iris$Sepal.Length,iris$Sepal.Width)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point() + labs(title="Scatterplot", x="Sepal Length", y="Sepal Width")

ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) + geom_point() + labs(title="Scatterplot", x="Petal Length", y="Petal Width") 

library(GGally)
ggpairs(data=iris,columns=1:5,
        title="Iris Flower Features", 
        mapping = ggplot2::aes(color = Species))

ggpairs(data=iris,
        columns=1:5, 
        upper = list(continuous = "density"),
        lower = list(combo = "facetdensity"),
        mapping = ggplot2::aes(color = Species))

library(scatterplot3d)
colors <- c("#BB0000", "#00FFFF", "#7FFF00")
colors <- colors[as.numeric(iris$Species)]
scatterplot3d(iris[,2:4], pch=20, color=colors,grid=TRUE, angle =10,xlab="Sepal Length", ylab="Sepal Width", zlab="Petal Length")

library(gridExtra)
Id <- seq(nrow(iris))
p1<-ggplot(iris, aes(x=Id, y=Sepal.Width, color=Species)) + geom_point() + geom_smooth()
p2<-ggplot(iris, aes(x=Id, y=Sepal.Length, color=Species)) + geom_point() + geom_smooth()
grid.arrange(p1, p2, nrow=2)

p3<-ggplot(iris, aes(x=Id, y=Petal.Width, color=Species)) + geom_point() + geom_smooth()
p4<-ggplot(iris, aes(x=Id, y=Petal.Length, color=Species)) + geom_point() + geom_smooth()
grid.arrange(p3, p4, nrow=2)

