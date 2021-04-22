# Program: Predicting all male passenger died in the Accident
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


# Checking the number of Male and Female in the Titanic
summary (train$Sex) # 314 (F) and 577 (M)

# Checking the persentage of Male and Female survived
prop.table(table(train$Sex, train$Survived), 1) * 100 # Means, male died more than 5 times than the female!

# So, we can say female survived more and more than the male!
test$Survived[test$Sex == 'female'] <- 1

# Making the prediction submission file
prediction <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_2.csv", row.names = FALSE)