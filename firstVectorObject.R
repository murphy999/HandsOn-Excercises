# created object - Vector
myFirstObject <- 5:10;myFirstObject
#Print nos in console
# ";" => start of new row

#Plot 6 integers against their index
plot(myFirstObject)

#Object Assignment :  '<-' , '=' 
b <- c(5:8)

#function assign
assign("y",c(4.5,9,3))

#see which objects are already created
ls()

#removed an object
rm("b")

sum(y) #sum
sqrt(y) #square root

#print a particular value 
y[1] #index position

newObj <- c(myFirstObject,y,7);newObj

# which() returns the index position(s) of a given value/condition from object specified
which(newObj == 7)

#[] returns the value at the specified index position
newObj[5]
