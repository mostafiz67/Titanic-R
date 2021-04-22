# Program: Predicting based on the Feature created from feature_engineering_2.R
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


decesion_tree_5 <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + FamilySize + Title,
                         data=train, method="class")
fancyRpartPlot(decesion_tree_5)

# Predicting based on the DT Using predict function
prediction_DT_5 <- predict(decesion_tree_5, test, type = "class") 
DT5_prediction <- data.frame(PassengerId = test$PassengerId, Survived = prediction_DT_5)
write.csv(DT5_prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_8.csv", row.names = FALSE)

