# Program: Creating some feature engineering (Filling Empty Age, Embarked, Fare and Creating Child)
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Filling empty Age 
summary(train_test_all_data$Age)
FillAge <- rpart(Age ~ Pclass + Mother + FamilySize + Sex + SibSp + Parch + Deck + Fare + Embarked + Title + FamilySize, data=train_test_all_data[!is.na(train_test_all_data$Age),], method="anova")
train_test_all_data$Age[is.na(train_test_all_data$Age)] <- predict(FillAge, train_test_all_data[is.na(train_test_all_data$Age),])

# Creating Child and Adult as a new column (after filling Age we also have to update the child column)
train_test_all_data$Child[train_test_all_data$Age < '14'] <- 'Child'
train_test_all_data$Child[train_test_all_data$Age >= '14'] <- 'Adult'
train_test_all_data$Child <- factor(train_test_all_data$Child) # Changing into Factor

# Felling empty Embarked
summary(train_test_all_data$Embarked)
train_test_all_data$Embarked[c(62,830)] = "S" # Changing NA with S
train_test_all_data$Embarked <- factor(train_test_all_data$Embarked)

# Filling empty Fare
summary(train_test_all_data$Fare)
train_test_all_data$Fare[1044] <- median(train_test_all_data$Fare, na.rm=TRUE)
