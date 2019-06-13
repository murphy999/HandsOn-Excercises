# Matrices are vectors with a dimension attribute
matr <- matrix(data = 1:9,nrow = 3, ncol = 3,byrow = TRUE);matr
#by row parameter decides to display elements row wise or column wise.
dim(matr)
attributes(matr)

mvect <- 11:20
dim(mvect) <- c(2,5)
mvect
# Note - 
# Error in dim(mvect) <- c(3, 3) : dims [product 9] do not match the length of object [10]
# Make sure to choose nos. that their product result in the length of data 

# Matrices can be created by column-binding or row-binding with the cbind() and rbind() functions.
x<-1:4
y<-5:8
dim(cbind(x,y))
dim(rbind(x,y))
