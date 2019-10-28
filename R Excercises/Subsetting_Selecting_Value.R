# 3 operators to extract subsets of R objects
# [], [[]], $


# []

# 6 different ways to write an index for R
#Note : 
#The first element is indexed at 1.(and not 0 as in other programming lang.(c,java,etc))
vect <- 1:9
mat <- matrix(vect,nrow = 3,ncol = 3,byrow = TRUE)
data <- data.frame(
                   "Name" = c("Max","Tina","Shikha","Tom"),
                   "Age" = c(24,23,30,28),
                   stringsAsFactors = FALSE
                  )
lst <- list(vect,mat,data)

# 1: Positive Integers
vect[1:5]
mat[1:2,1:2]          #[i row(s), j col(s)]
mat[1:2,1,drop= FALSE]#instead of vector returns a matrix
data[1,2]             # Value at 1st row and 2nd column
data [c(1,2,3),1]     # extract more than 1 value
class(data[1:2,1:2])  # selected more than 2 cols from a dataframe, R returns a new dataframe
data[1:2,1,drop=FALSE]# returns a data frame
data[1:2,1]           # returns a vector
lst[1]

# 2: Negative Integers
data[-1,c(1:2)]   # 1st row excluded
data[-c(2,3),1:2] # 2nd and 3rd row excluded
data[c(-1,-2),1]
lst[-3]
mat[c(-1,2),1]
# Output:
# Error in mat[c(-1, 2), 1] :  only 0's may be mixed with negative subscripts
# Note :
# R will return an error if pair -ve num with +ve num

# 3: Zero (not very useful)
mat[0,0]            # <0 x 0 matrix> empty matrix object created
vect[0]             # integer(0)
void <-data[0,0]    # data frame with 0 columns and 0 rows - empty object created

# 4: Blank spaces
data[1,]
data[,2]

# 5: Logical Values
mat[2,c(T,F,T)]
vect[c(T,F,F,F,F,T,T,F,T)]

# 6: Names
data[1:3,"Name"]
data[,"Age"]

# ------------------------------------------------------------

# [] - returns smaller list
# [[]] - returns values of list

lst[[2]]

# ------------------------------------------------------------

# $
data$Name
mean(data$Age)
names(lst) <- c("Numbers","Matrix","DF")
sum(lst$Numbers)
lst$Matrix
