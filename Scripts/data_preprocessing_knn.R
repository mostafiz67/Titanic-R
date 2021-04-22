# Program: Predicting based on the Feature 
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


train_test_all_data_knn <- train_test_all_data

# Checking NULL values and removing columns
colSums(is.na(train_test_all_data_knn))
train_test_all_data_knn$Cabin <- NULL
train_test_all_data_knn$Deck <- NULL
train_test_all_data_knn$Name <- NULL
train_test_all_data_knn$Ticket <- NULL

# Creating Child and Adult as a new column
train_test_all_data_knn$Sex <- as.character(train_test_all_data_knn$Sex)
train_test_all_data_knn$Sex[which(train_test_all_data_knn$Sex == "male")] = "1"
train_test_all_data_knn$Sex[which(train_test_all_data_knn$Sex == "female")] = "0"
train_test_all_data_knn$Sex <- factor(train_test_all_data_knn$Sex) # Changing into Factor

train_test_all_data_knn$Embarked <- as.character(train_test_all_data_knn$Embarked)
train_test_all_data_knn$Embarked[which(train_test_all_data_knn$Embarked == "S")] = "1"
train_test_all_data_knn$Embarked[which(train_test_all_data_knn$Embarked == "C")] = "2"
train_test_all_data_knn$Embarked[which(train_test_all_data_knn$Embarked == "Q")] = "3"
train_test_all_data_knn$Embarked <- factor(train_test_all_data_knn$Embarked) # Changing into Factor

# Creating Child and Adult as a new column
train_test_all_data_knn$Child <- as.character(train_test_all_data_knn$Child)
train_test_all_data_knn$Child[which(train_test_all_data_knn$Child == "Child")] = "1"
train_test_all_data_knn$Child[which(train_test_all_data_knn$Child == "Adult")] = "0"
train_test_all_data_knn$Child <- factor(train_test_all_data_knn$Child) # Changing into Factor

train_test_all_data_knn$Fare_category <- as.character(train_test_all_data_knn$Fare_category)
train_test_all_data_knn$Fare_category[which(train_test_all_data_knn$Fare_category == "low")] = "1"
train_test_all_data_knn$Fare_category[which(train_test_all_data_knn$Fare_category == "medium_1")] = "2"
train_test_all_data_knn$Fare_category[which(train_test_all_data_knn$Fare_category == "medium_2")] = "3"
train_test_all_data_knn$Fare_category[which(train_test_all_data_knn$Fare_category == "high")] = "4"
train_test_all_data_knn$Fare_category[which(train_test_all_data_knn$Fare_category == "very_high")] = "5"
train_test_all_data_knn$Fare_category <- factor(train_test_all_data_knn$Fare_category) # Changing into Factor


train_test_all_data_knn$Title <- as.character(train_test_all_data_knn$Title)
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Mr")] = "1"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Mrs")] = "2"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Miss")] = "3"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Master")] = "4"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Sir")] = "5"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Rev")] = "6"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Dr")] = "7"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Mlle")] = "8"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Ms")] = "9"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Lady")] = "10"
train_test_all_data_knn$Title[which(train_test_all_data_knn$Title == "Col")] = "11"
train_test_all_data_knn$Title <- factor(train_test_all_data_knn$Title) # Changing into Factor