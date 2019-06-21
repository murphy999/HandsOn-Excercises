install.packages("data.table")
library(data.table)

dtCollege = data.table(College,keep.rownames = T);
class(dtCollege)
head(dtCollege)
summary(dtCollege)

#*************************************************************************

#Basic row manipulations
mysubset <- dtCollege[40:60] # [] - returns an object of the same class as original.
mysubset
mean(mysubset$Enroll) # $ - is used to extract elements of a list or DF by literal name
round(mean(mysubset$Enroll),1) # 1 => number of decimal places 

#*************************************************************************

#Advanced row selection
dtCollege[!Outstate %between% c(8000,14000)] # Exclude

#*************************************************************************

#Basic column operations

#What are the top 10 Universities in terms of top 10% High School students (Top10perc)?
head(dtCollege[order(-Top10perc),rn],10) # prints only college names column

#What are the top 10 Universities in terms of student enrollment vs. accepted applications (highest student enrollment ratio)? 
#Add a new column to the data.table.
earatio <- dtCollege$Enroll/dtCollege$Accept
dtCollege$acceptanceRatio <- earatio
head(dtCollege[order(-acceptanceRatio),.(rn,acceptanceRatio,Enroll,Accept)],10)

#What are the top 10 Universities in terms of 
#favorable S.F.Ratio with a Room.Board cost lower 4000 USD?
tempTable <- dtCollege[Room.Board<4000]
tempTable
head(tempTable[order(S.F.Ratio),.(rn,S.F.Ratio,Room.Board)],10)

#*************************************************************************

#'College' dataset - Permanently changing the column order

#Create a new data.table 'college.gradnr' which consists of: 
#'rn', 'F.Undergrad', 'P.Undergrad', 'Accept', 'Enroll', 'Apps'.

college.gradnr <- subset(dtCollege,select = c(rn,F.Undergrad,P.Undergrad,Accept,Enroll,Apps))
#Note the first comma means keep all the rows, and the names refers to the columns
head(college.gradnr)
college.gradnr <- college.gradnr[,c(1,6,4,5,2,3)]

#*************************************************************************

#'College' dataset - Adding and removing new columns

dtCollege$HighInterest <- ifelse(dtCollege$Apps>1000,1,NA) #adding a column to table with values
head(dtCollege)

dtCollege[,c("HighInterest"):=NULL] # remove a column from table

#Add a new column 'undergradratio' which is the undergraduate ratio (F.Undergrad/P.Undergrad). 
#Get the first ten observations starting with the highest ratio. 
#The whole exercise should be coded in one line - Use chaining!
head(dtCollege[,c("undergradratio") := F.Undergrad/P.Undergrad][order(-undergradratio)],10)

#*************************************************************************

#College dataset - Counting observations

# How many Universities have instructional expenditures of over 20000 USD per year?
nrow(dtCollege[Expend >20000])
#or
dtCollege[Expend>20000,.N]

# How many Universities have a combined 'Books' and 'Room.Board' costs of over 7000 USD per year?
nrow(dtCollege[(Books+Room.Board) >7000])
#or
dtCollege[Books+Room.Board > 7000,.N]

#How many Universities are public and how many are private ?
dtCollege[,by=Private,.N]

#*************************************************************************

#College dataset - Working with keys and subsetting

#Set two keys to your 'College' data.table: 'F.Undergrad' and 'P.Undergrad'. 
#Check if the order has changed ?
head(dtCollege)
setkey(dtCollege,F.Undergrad,P.Undergrad)
?setkey

#Get a subset of the 'College' data with 'F.Undergrad' lower 1000 and 'P.Undergrad' lower 100 students.
dtCollege[F.Undergrad < 1000 & P.Undergrad < 100]

#Is there a college with exactly 393 full-time and 4 part-time undergraduate students?
dtCollege[.(393, 4),rn]  #works since we have used setkey()
dtCollege[F.Undergrad==393 & P.Undergrad==4,rn] # the usual approach

#*************************************************************************

#College dataset - Selecting existing columns and reshaping

#Get a data.table with all columns except 'Apps', 'Accept', 'Enroll'. 
#Use at least two different ways for this.
dtCollege[,-(3:5)] #dtCollege[,-c(3,4,5)]
dtCollege[, !c("Apps", "Accept", "Enroll")]

#Get a data.table with the three columns 'Apps', 'Accept', 'Enroll'. 
#Use at least two different code efficient methods.
dtCollege[,3:5]
dtCollege[, Apps:Enroll, with = F] # with = F => do not modify (copy of) the original data
?with

#*************************************************************************

#College dataset - Getting counts for GROUPED data

#How many Colleges with less than 800 applications received, 
#have a Top 10 student percentage above 40?
dtCollege[Apps<800,.N ,by=(Top10perc>40)]


#How many Colleges with less than 900 applications received and an 'Out of state tuition' below 10000, 
#have a top 10 student percentage above 30?
dtCollege[Apps<900 & Outstate<10000,.N,by=(Top10perc>30)]

#How many Colleges with less than 1000 applications received, have a 'Top10perc' above 20 OR a 'Top25perc' above 30?
dtCollege[Apps<1000,.N,by=(Top10perc>20 | Top25perc>30)]

