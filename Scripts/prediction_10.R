# Program: Predicting based on the KNN 
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt

install.packages('class')
library(class)

# Split back into test and train sets
train <- train_test_all_data_knn[1:891,]
test <- train_test_all_data_knn[892:1309,]

# Splitting train and lest labels.
knn_1_train <- train_test_all_data_knn[1:891, -2]
knn_train_label_1 <- train_test_all_data_knn[1:891, 2]
knn_1_test <- train_test_all_data_knn[892:1309, -2]
knn_test_label_1 <- train_test_all_data_knn[892:1309, 2]


# KNN method
knn_prediction_1 <- knn(knn_1_train, knn_1_test, cl = knn_train_label_1, k = 35)


# create confusion matrix (if you have known test label)
# table <- table(knn_prediction_1,knn_test_label_1)
# table
# accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
# accuracy(table)

# Predicting based on the knn Using predict function
knn_prediction <- data.frame(PassengerId = knn_1_test$PassengerId, Survived = knn_prediction_1)
write.csv(knn_prediction, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Prediction_Output/prediction_10.csv", row.names = FALSE)


