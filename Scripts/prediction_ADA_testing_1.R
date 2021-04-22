library(rpart)
library(caret)

data(iris)

decision_tree1 <- rpart(Species~., iris, method="class", parms=list(split='gini'))
fancyRpartPlot(decision_tree1)


predict_1 <- predict(decision_tree1, iris, type="class")
confusionMatrix(predict_1, iris$Species)


decision_tree2 <- rpart(Species~., iris, method="class", parms=list(split='gini'),
                        control = rpart.control(maxdepth = 3, minsplit = 50))
fancyRpartPlot(decision_tree2)


predict_2 <- predict(decision_tree2, iris, type="class")
confusionMatrix(predict_2, iris$Species)





train <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/train.csv")
test <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/test.csv")

# Building Decision tree based on the 3 features
decesion_tree_ADA_1 <- rpart(Survived ~ Pclass + Sex + Age, parms=list(split='gini'),
                             data=train, method="class")
fancyRpartPlot(decesion_tree_ADA_1, tweak=1.4) # Plotting the tree

# Predicting based on the DT Using predict function
prediction_DT_ADA_1 <- predict(decesion_tree_ADA_1, train, type = "class") 
confusionMatrix(as.factor(train$Survived), prediction_DT_ADA_1)


DT1_prediction_ADA_1 <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_ADA_1)
write.csv(DT1_prediction_ADA_1, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_ADA_1.csv", row.names = FALSE)



train <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/train.csv")
test <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/test.csv")

# Building Decision tree based on the 3 features
decesion_tree_ADA_2 <- rpart(Survived ~  Pclass + Sex + Age, 
                             data=train, method="class", parms=list(split='gini'),
                             control = rpart.control(minsplit = 50, maxdepth = 5))
fancyRpartPlot(decesion_tree_ADA_2, tweak=1.8) # Plotting the tree

# Predicting based on the DT Using predict function
prediction_DT_ADA_2 <- predict(decesion_tree_ADA_2, train, type = "class") 
confusionMatrix(as.factor(train$Survived), prediction_DT_ADA_2)

DT1_prediction_ADA_2 <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_ADA_2)
write.csv(DT1_prediction_ADA_2, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_ADA_2.csv", row.names = FALSE)
