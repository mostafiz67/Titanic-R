
# Program: Predicting all passenger died in the Accident
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


# Guessing everyone died in the test dataset (because most of the people died in the train dataset)
test$Survived <- rep(0, 418)

# Making the prediction submission file
prediction <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_1.csv", row.names = FALSE)