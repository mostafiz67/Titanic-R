# Program: Predicting based on the Decision Tree
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Building Decision tree based on the 3 features
decesion_tree_1 <- rpart(Survived ~ Pclass + Sex + Age, data=train, method="class")
fancyRpartPlot(decesion_tree_1) # Plotting the tree

# Predicting based on the DT Using predict function
prediction_DT_1 <- predict(decesion_tree_1, test, type = "class") 
DT1_prediction <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_1)
write.csv(DT1_prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_4.csv", row.names = FALSE)




# Building Decision tree based on the 5 features
decesion_tree_2 <- rpart(Survived ~ Pclass + Sex + Age + Fare + Embarked, data=train, method="class")
fancyRpartPlot(decesion_tree_2) # Plotting the tree

# Predicting based on the DT Using predict function
prediction_DT_2 <- predict(decesion_tree_2, test, type = "class") 
DT2_prediction <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_2)
write.csv(DT2_prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_5.csv", row.names = FALSE)




# Building Decision tree based on the 7 features
decesion_tree_3 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=train, method="class")
fancyRpartPlot(decesion_tree_3) # Plotting the tree

# Predicting based on the DT Using predict function
prediction_DT_3 <- predict(decesion_tree_3, test, type = "class") 
DT3_prediction <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_3)
write.csv(DT3_prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_6.csv", row.names = FALSE)
