#Student Details Data Frame created
student.df = data.frame(
  name = c("Sue","Eva","Henry","John"),
  sex = c("F","F","M","M"),
  years = c(21,31,29,19)
);
student.df #print DF

#retrieve names of columns 
names(student.df)

dim(student.df)   #dimensions of df

# Added a new column based on condition
student.df$maleTeen <- ifelse(student.df$sex=='M' & student.df$years<20,"T","F")

#**************************************************************************

# Working with the 'mtcars' dataset
hist(mtcars$mpg)

scatter.smooth(mtcars$wt,mtcars$hp,xlab = "Weight",ylab = "HorsePower",pch=3,col="red")

#Are there more automatic (0) or manual (1) transmission-type cars in the dataset? 
#Hint: 'mtcars' has 32 observations
sum(mtcars$am == 1);sum(mtcars$am == 0)

#Check the class of each variable in 'mtcars'.
sapply(mtcars, class)

#Change 'am', 'cyl' and 'vs' to integer and store the new dataset as 'newmtc'
newmtc <-mtcars
newmtc$cyl <-as.integer(newmtc$cyl)
newmtc$vs <-as.integer(newmtc$vs)
newmtc$am <-as.integer(newmtc$am)
sapply(newmtc, class)

#Round the 'newmtc' data frame to one digit.
head(newmtc)
head(round(newmtc,1)) # round to one decimal place

#**************************************************************************

# Working with the 'iris' dataset
install.packages("dplyr")
library(dplyr)

#Get all rows of Species 'versicolor' in a new data frame. 
#Call this data frame: 'iris.vers'

iris.vers <- subset(iris,iris$Species=="versicolor")
head(iris.vers)

#Get a vector called 'sepal.dif' with the 
#difference between 'Sepal.Length' and 'Sepal.Width' of 'versicolor' plants.
iris.vers$sepal.dif <- iris.vers$Sepal.Length - iris.vers$Sepal.Width

#Use 'dplyr' to filter for all data of Species 'virginica' with a 'Sepal.Width' of greater than 3.5.
filter(iris,iris$Sepal.Width > 3.5 & iris$Species == 'virginica')

#How would you use R Base to get a data frame of  all data of Species 'virginica' with a 'Sepal.Width' of greater than 3.5, 
#but without the last column Species in the data frame?

subset(iris,iris$Sepal.Width > 3.5 & iris$Species == 'virginica',1:4)

#Get the row IDs of the rows matching the two filtering criteria provided above.
row.names(subset(iris,iris$Sepal.Width > 3.5 & iris$Species == 'virginica',1:4))

#a. Repeat each value of 'Sepal.Length' two times and 
#repeat the whole sequence two times as well.
rep(iris$Sepal.Length, times = 2, each=2)

#Get a new object which contains only the odd values of 'Sepal.Length'.
odd_values <- iris[c(T,F),1];odd_values

#**************************************************************************

#Big Data Example with 'diamonds' (package: 'ggplot2')

install.packages("ggplot2")
library(ggplot2)
attach(diamonds)

#How many observations of diamonds have a cut of 'ideal' and have less than 0.21 carat?
sum(carat<0.21 & cut == "Ideal")

#How many observations of diamonds have a combined 'x' + 'y' + 'z' dimension greater than 40?
sum(x+y+z>40)

#How many observations of diamonds have either a price above 10.000 USD or a depth of at least 70?
sum(price> 10000 | depth>=70)

#Get a data frame with the full info on observations '453', '792' and '10489'.And column color & y
diamonds[c(453,792,10489),c(3,9)]

newdiam <- diamonds[c(1:1000),]
#Order 'newdiam' according to price, starting with the lowest. 
#Hint: 'dplyr', 'arrange' is a useful function for that.
arrange(diamonds,price)

#Order 'newdiam' according to price, starting with the highest.
arrange(diamonds,desc(price))














