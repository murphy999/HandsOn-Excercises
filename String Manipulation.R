#College Dataset
install.packages("ISLR")
library(ISLR)
# ISLR : College Dataset

#String Manipulation
install.packages("stringr")
library("stringr")
# stringr : str_match, str_split

install.packages("tidyr")
library(tidyr)
# tidyr : separate, unite

#*************************************************************************

#DATASETS
head(College)

# get college names
college.names = rownames(College);college.names

#match names of college that have word "Texas" in it
texas.names <- str_match(college.names,"Texas")
summary(texas.names);                           # Gives Count 
rownum <- which(texas.names == "Texas");rownum  # Gives rownos.                               

#Extract the subset of 'Texas' colleges from the original 'College' dataset
College[rownum,]

#Split college names into single words 
splitWords <- str_split(college.names," ");head(splitWords)
tolower(splitWords) 
casefold(splitWords,upper = TRUE) #casefold is a wrapper for tolower and toupper

#*************************************************************************

#tidyr: Easily Tidy Data
mydata = data.frame(
  name = c("Hank", "Mike", "Jane", "Sue"),
  measurements = c("183m", "179m", "172f", "169f"),
  residency = c("London", "Sydney", "Prague", "Dublin")
)
#separate function
separate(mydata,measurements,c('height','sex'),sep = 3)
?separate

#unite function
unite(mydata,name_res,c(name,residency),sep = "_")
?unite
#*************************************************************************


