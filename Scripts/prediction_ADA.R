# Program: Predicting based on the Decision Tree
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


# install.packages('rattle')
# install.packages('rpart.plot')
# install.packages('RColorBrewer')
# install.packages('dplyr')

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(dplyr)

train <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/train.csv")
test <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/test.csv")

train <- select(train, -c(Cabin, Name,Ticket))

# Building Decision tree based on the 3 features
decesion_tree_ADA_1 <- rpart(Survived ~ Age + Sex + Pclass,  data=train, method="class")
fancyRpartPlot(decesion_tree_ADA_1, tweak=1.4) # Plotting the tree

# Predicting based on the DT Using predict function
prediction_DT_ADA_1 <- predict(decesion_tree_ADA_1, test, type = "class") 
DT1_prediction_ADA_1 <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_ADA_1)
write.csv(DT1_prediction_ADA_1, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_ADA_1.csv", row.names = FALSE)

# Accuracy is: 0.75358




# Building Decision tree based on the 3 features
decesion_tree_ADA_2 <- rpart(Survived ~ Age + Sex + Pclass, 
                             data=train, method="class",
                             control = rpart.control(minsplit = 200, maxdepth = 3))
fancyRpartPlot(decesion_tree_ADA_2, tweak=1.4) # Plotting the tree

# Predicting based on the DT Using predict function
prediction_DT_ADA_2 <- predict(decesion_tree_ADA_2, test, type = "class") 
DT1_prediction_ADA_2 <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_ADA_2)
write.csv(DT1_prediction_ADA_2, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_ADA_2.csv", row.names = FALSE)

# Accuracy is: 0.76555
