taitanic_data <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/train.csv")

# Cleaning the dataset
full_data_clean <- select(taitanic_data, -c(Parch, Cabin, Name, PassengerId, Ticket))
full_data_clean <- na.omit(full_data_clean)

full_data_clean$pclass <- as.factor(full_data_clean$Pclass)
full_data_clean$survived <- as.factor(full_data_clean$Survived)

partition <- createDataPartition(full_data_clean$survived, p = 0.8, list=FALSE)
train_data <- full_data_clean[partition,]
test_data <- full_data_clean[-partition,]
test_data_survived <- test_data$Survived
test_data$Survived <-NULL

prop.table(table(train_data$Survived))
prop.table(table(test_data$Survived))


decision_tree_1 <- rpart(Survived~., data = train_data, method = 'class')
fancyRpartPlot(decision_tree_1, tweak=1)

prediction_1 <- predict(decision_tree_1, test_data, type='class')
table_mat <- table(test_data_survived, prediction_1)
table_mat

accuracy_Test <- sum(diag(table_mat)) / sum(table_mat)
print(paste('Accuracy for test', accuracy_Test))

install.packages("titanic")
library('titanic')


train <- titanic_train
test <- titanic_test

# Cleaning the dataset
full_data_clean <- select(train, -c(Parch, Cabin, Name))
full_data_clean <- na.omit(full_data_clean)

full_data_test_clean <- select(test, -c(Parch, Cabin, Name))
full_data_test_clean <- na.omit(full_data_test_clean)

full_data_clean$Pclass <- as.factor(full_data_clean$Pclass)
full_data_clean$Survived <- as.factor(full_data_clean$Survived)
full_data_test_clean$Pclass <- as.factor(full_data_test_clean$Pclass)

partition <- createDataPartition(full_data_clean$survived, p = 0.7, list=FALSE)
train_data <- full_data_clean[partition,]
test_data <- full_data_clean[-partition,]
test_data_survived <- test_data$Survived
prop.table(table(train_data$Survived))
prop.table(table(test_data$Survived))
test_data$Survived <-NULL

decision_tree_2 <- rpart(Survived~., data = full_data_clean, method = 'class',
                         control = rpart.control(minsplit = 50, maxdepth = 5))
fancyRpartPlot(decision_tree_2, tweak=1)




prediction_2 <- predict(decision_tree_2, test, type='class')
table_mat <- table(test_data_survived, prediction_2)
table_mat
