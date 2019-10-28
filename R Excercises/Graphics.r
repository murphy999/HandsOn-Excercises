library(ggplot2)
#install.packages("reshape2")
library(reshape2)
# -----------------------------------------------------------------------

# Understand data in reshape 2 package
head(tips)
str(tips)
View(tips)
# -----------------------------------------------------------------------

# Changing Data Type
tips$size <- as.factor(tips$size)
# -----------------------------------------------------------------------

# Computation
totalBill_Day <- aggregate(tips["total_bill"],tips["day"],FUN = mean);totalBill_Day
tips_Day <- aggregate(tips["tip"],tips["day"],FUN = mean);tips_Day

totalBill_Time <- aggregate(tips["total_bill"],tips["time"],FUN = mean);totalBill_Time
tips_Time <- aggregate(tips["tip"],tips["time"],FUN = mean);tips_Time

totalBill_Size <- aggregate(tips["total_bill"],tips["size"],FUN = mean);totalBill_Size
tips_Size <- aggregate(tips["tip"],tips["size"],FUN = mean);tips_Size

totalBill_Sex <- aggregate(tips["total_bill"],tips["sex"],FUN = mean);totalBill_Sex
tips_Sex <- aggregate(tips["tip"],tips["sex"],FUN = mean);tips_Sex

totalBill_Smoker <- aggregate(tips["total_bill"],tips["smoker"],FUN = mean);totalBill_Smoker
tips_Smoker <- aggregate(tips["tip"],tips["smoker"],FUN = mean);tips_Smoker

# -----------------------------------------------------------------------

qplot(data = tips,x=day,y=tip,main="Tip Distribution by Day",geom = "boxplot")
  # The tips earned on weekend is more than the weekdays (Thurs & Fri)
ggplot(data = totalBill_Day,aes(x = totalBill_Day$total_bill, y = tips_Day$tip)) +  
  theme(legend.position = "top")+
  xlab("Average Bill Paid")+
  ylab("Average Tip Received")+
  geom_point(aes(color = day))+ 
  geom_text(aes(label = round(tips_Dayr$tip,digits = 2)),color = 'grey')
  # The above graph shows as total bill increases tip also increases => More Customers come on 
  # weekend than the weekdays / Customers spend more on weekends as on weekdays
# ------------------------------------------------------------------------

ggplot(data = tips,aes(x=time,y=tip)) + 
  geom_boxplot() + ggtitle("Tip Distribution by Time")
  # Tip earned during dinner time is more than the lunch time => More customers give more tip for
  # dinner as to lunch.
ggplot(data = totalBill_Time,aes(x = totalBill_Time$total_bill, y = tips_Time$tip)) +  
  theme(legend.position = "top")+
  xlab("Average Bill Paid")+
  ylab("Average Tip Received")+
  geom_point(aes(color=time))+ 
  geom_text(aes(label = round(tips_Time$tip,digits = 2)),color = 'grey')
  # The total bill for dinner is more than the lunc =>
  # Customers often come for dinner as compared to lunch
# ------------------------------------------------------------------------

qplot(data = tips,x=size,y=tip,main="Tip Distribution by Family Size",geom="boxplot")
  # The tip domain is more for the size of 3-4. 
ggplot(data = totalBill_Size,aes(x = totalBill_Size$total_bill, y = tips_Size$tip)) +  
  theme(legend.position = "top")+
  xlab("Average Bill Paid")+
  ylab("Average Tip Received")+
  geom_point(aes(color=size))+ 
  geom_text(aes(label = round(tips_Size$tip,digits = 2)),color = 'grey')
  # As family size icreases, bill increases => tip increases
# ------------------------------------------------------------------------

qplot(data = tips,x=sex,y=tip,main="Tip Distribution by Sex",geom = "boxplot")
ggplot(data = totalBill_Sex,aes(x = totalBill_Sex$total_bill, y = tips_Sex$tip)) +  
  theme(legend.position = "top")+
  xlab("Average Bill Paid")+
  ylab("Average Tip Received")+
  geom_point(aes(color=sex))+ 
  geom_text(aes(label = round(tips_Sex$tip,digits = 2)),color = 'grey')
# Males give more tips than the Females => Males pay the bill more often than Females.
# ------------------------------------------------------------------------

qplot(data = tips,x=smoker,y=tip,main="Tip Distribution by Smoker",geom = "boxplot")
ggplot(data = totalBill_Smoker,aes(x = totalBill_Smoker$total_bill, y = tips_Smoker$tip)) + 
  theme(legend.position = "top")+
  xlab("Average Bill Paid")+
  ylab("Average Tip Received")+
  geom_point(aes(color=smoker)) + 
  geom_text(aes(label = round(tips_Smoker$tip,digits = 2)),color = 'grey')
  
 # Not much of a difference.
# ------------------------------------------------------------------------

# Overall Review - Scatter Plot
qplot(total_bill, tip, data=tips, shape=time, color=size,
      facets=sex~day, size=I(3),
      xlab="Lunch/Dinner", ylab="Tips")





