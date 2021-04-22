# Program: Predicting based on the KNN including cross-validation
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


install.packages("caret")
library(caret)
library(dplyr)

# Train and labels data
knn_2_train <- knn_1_train
knn_2_train$Survived <- train$Survived
Survived <- as.factor(train$Survived)
knn_2_train$Survived <- NULL


# Test dataset
knn_2_test <- knn_1_test


# Cross-validation Contraol
trControl <- trainControl(method  = "cv",
                          number  = 5)

# Best Model for KNN
fit <- train(knn_2_train,
             Survived,
             method = "knn",
             tuneGrid   = expand.grid(k = 1:50),
             metric     = "Accuracy",
             trControl  = trControl
             )

##create confusion matrix
table <- table(knn_prediction_2, knn_test_label_1)
table
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(table)

# Applying best model on test data
knn_2_test$Survived <- predict(
  object  = fit,
  newdata = knn_2_test
)

# Making prediction file to submit
knn_CV_prediction <- select(knn_2_test,PassengerId, Survived)
write.csv(knn_CV_prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_11.csv", row.names = FALSE)

