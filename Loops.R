#Note

# Repeat Loop - No condition for exit. Need to put explicitly
# "Next" Keyword similar to "continue" keyword in C/Java : to skip an iteration
# For Loop - Syntax : for(value in Seq) {stmt}
#
#


#double for loop
#Write a double for loop which prints 30 numbers (1:10, 2:11, 3:12). Those are three clusters of ten numbers each. The first loop determines the number of clusters (3) via its length; the second loop the numbers to be printed (1 to 10 at the beginning). 
#Each cluster starts one number higher than the previous one.
for (i in 1:length(1:3)) {
  for (j in 1:10) {
    print(j+i-1)
  }
}

#repeat loop
#Write a repeat loop containing three random numbers. 
#The loop repeats itself exactly ten times before it stops.

#random generation for the normal distribution
random <- rnorm(3) # no.of observations = 3
count <- 0
repeat{
  print(random)
  count <- count + 1
  if(count == 10)
    break
}

#while loop
k <- 0
exclude <- c(3,9,13,19,23,29)
while (k < 35) {
  k <- k+1
  if(k %in% exclude ) next
  print(k)
}
#Value matching
#%in% is a more intuitive interface as a binary operator, 
#which returns a logical vector indicating if there is a match or not for its left operand.



