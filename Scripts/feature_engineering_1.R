# Program: Creating some feature engineering (reating Child, Mother, Fare Category, and Title, etc.) 
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt



# We will marge train and test dataset
train$Fare_range <- NULL # Deleting this column for binding
test$Survived <- NA # Making NA all existing predictions
train_test_all_data <- rbind(train, test)

# Changing name (factor) from (character)
train_test_all_data$Name <- as.character(train_test_all_data$Name)

# Creating Child and Adult as a new column
train_test_all_data$Child[train_test_all_data$Age < '14'] <- 'Child'
train_test_all_data$Child[train_test_all_data$Age >= '14'] <- 'Adult'
train_test_all_data$Child <- factor(train_test_all_data$Child) # Changing into Factor


# Creating Mother column (Not Mother == 0) and (Mother == 1)
train_test_all_data$Mother <- '0'
train_test_all_data$Mother[train_test_all_data$Sex == 'female' & train_test_all_data$Parch > 0 & train_test_all_data$Age > 18] <- '1'
table(train_test_all_data$Mother, train_test_all_data$Survived)
train_test_all_data$Mother <- factor(train_test_all_data$Mother)


# Checking Deck column
train_test_all_data$Cabin <- as.character(train_test_all_data$Cabin)
strsplit(train_test_all_data$Cabin[2], NULL)[[1]]
train_test_all_data$Deck<-factor(sapply(train_test_all_data$Cabin, function(x) strsplit(x, NULL)[[1]][1]))
train_test_all_data$Cabin <- factor(train_test_all_data$Cabin)


# Checking Fare category
train_test_all_data$Fare_category[train_test_all_data$Fare<50]<-"low"
train_test_all_data$Fare_category[train_test_all_data$Fare>=50 & train_test_all_data$Fare<=100]<-"medium_1"
train_test_all_data$Fare_category[train_test_all_data$Fare>=100 & train_test_all_data$Fare<=150]<-"medium_2"
train_test_all_data$Fare_category[train_test_all_data$Fare>=150 & train_test_all_data$Fare<=500]<-"high"
train_test_all_data$Fare_category[train_test_all_data$Fare>=500]<-"very_high"

aggregate(Survived~Fare_category, data=train_test_all_data,mean) 

# Finding the family size
train_test_all_data$FamilySize <- train_test_all_data$SibSp + train_test_all_data$Parch + 1


# Engineered variable: Title
train_test_all_data$Title <- sapply(train_test_all_data$Name, FUN=function(x) {strsplit(x, split='[,.]')[[1]][2]})
train_test_all_data$Title <- sub(' ', '', train_test_all_data$Title)

# Inspect new feature as a Title
table(train_test_all_data$Title)

# train_test_all_dataset small title groups
train_test_all_data$Title[train_test_all_data$Title %in% c('Mme', 'Mlle')] <- 'Mlle'
train_test_all_data$Title[train_test_all_data$Title %in% c('Capt', 'Don', 'Major', 'Sir')] <- 'Sir'
train_test_all_data$Title[train_test_all_data$Title %in% c('Dona', 'Lady', 'the Countess', 'Jonkheer')] <- 'Lady'

# Convert to a factor
train_test_all_data$Title <- factor(train_test_all_data$Title)
