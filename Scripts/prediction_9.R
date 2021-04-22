# Program: Predicting based on the Random Forest
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt

install.packages('randomForest')
library(randomForest)

# Split back into test and train sets
train <- train_test_all_data[1:891,]
test <- train_test_all_data[892:1309,]


rf_1 <- train_test_all_data[1:891, c("Pclass", "Title")]
rf_label_1 <- as.factor(train$Survived)


rf_prediction_1 <- randomForest(x = rf_1, y = rf_label_1, importance = TRUE, ntree = 2000)
rf_prediction_1
varImpPlot(rf_prediction_1)

# Predicting based on the RF Using predict function and deleting NULL columns
test_rf <- test
colSums(is.na(test_rf))
test_rf$Cabin <- NULL
test_rf$Deck <- NULL
test_rf$Survived <- NULL
prediction_RF_1 <- predict(rf_prediction_1, test_rf) 
RF1_prediction <- data.frame(PassengerId = test$PassengerId, Survived = prediction_RF_1)
write.csv(RF1_prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_9.csv", row.names = FALSE)


