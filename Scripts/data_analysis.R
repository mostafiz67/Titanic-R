# Program: Basic Analysis and Visualizing of the train dataset
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


# We need the Amelia package to analyze and visualize our dataset
install.packages("Amelia")
library(Amelia) # Loading the package

# Checking our train dataframe contains any NULL values or not
is.na(train) # Yes dataset contain missing value
sum(is.na(train)) # Total 177 cell has NS value
colSums(is.na(train))

# Converting the missing values into NA
train[train==""] <- NA

# Checking the missing value from the train datafrme
missmap(train, main="Training Dataset Missings Values", col=c("black", "white"), legend=FALSE)
    # Almost cabine information is missing! Age info all missing. 
sum(is.na(train$Cabin)) # Total 687 cebin info is missing
prop.table(table(is.na(train$Cabin))) * 100 # 77.01% cabin info is missing

sum(is.na(train$Age)) # Total 177 Age info is missing
prop.table(table(is.na(train$Age))) * 100 # 19.86% Age info is missing


# Viewing the 'Survived' number from the training dataset.
table(train$Survived)

# VIewing the proportion of the survived person from the train dataframe
prop.table(table(train$Survived)) * 100 # Most of the people died!

# Viewing the survived proportion using barplots
barplot(table(train$Survived), xlab="Survived People", ylab="NUmber of People", main="Train Dataset Survival")



