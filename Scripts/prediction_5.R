# Program: Predicting based on the Feature 
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Split into test and train sets
train <- train_test_all_data[1:891,]
test <- train_test_all_data[892:1309,]

# Building Decision tree based on the 10 features
decesion_tree_4 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + FamilySize + Title + Mother,
             data=train, method="class")
fancyRpartPlot(decesion_tree_4)

# Predicting based on the DT Using predict function
prediction_DT_4 <- predict(decesion_tree_4, test, type = "class") 
DT4_prediction <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_4)
write.csv(DT4_prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_7.csv", row.names = FALSE)


