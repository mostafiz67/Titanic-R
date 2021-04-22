# Program: Predicting all female passenger died in the Accident based on the PClass and Fare
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


# Checking Fare columns contains any NA value or not
sum(is.na(train$Fare))

# Dividing the previous Fare based on a range taken (randomly)
train$Fare_range <- '50+'
train$Fare_range[train$Fare < 50 & train$Fare >= 30] <- '30-50'
train$Fare_range[train$Fare < 30 & train$Fare >= 10] <- '10-30'
train$Fare_range[train$Fare < 10] <- '<10'

# Calculating the number of survived male and female
prop.table(table(train$Sex, train$Survived),1) * 100

# Now we have to use 'Aggregated' function for multiple subset (Fare_range, Sex, Pclass)
aggregate(Survived ~ Fare_range + Pclass + Sex, data=train, FUN=sum) # Using Sum function getting the total survived 
aggregate(Survived ~ Fare_range + Pclass + Sex, data=train, FUN=length) # length total number of passenger
aggregate(Survived ~ Fare_range + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x) * 100}) # getting parentage

# So, we get information that 'Third Class' female died than the '1st and 2nd class'
test$Survived <- 0
test$Survived[test$Sex == 'female'] <- 1
test$Survived[test$Sex == 'female' & test$Pclass == 3 & test$Fare >= 30] <- 0


# Making the prediction submission file
prediction <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_3.csv", row.names = FALSE)
