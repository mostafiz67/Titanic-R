# Program: Loading the 'Titanic' dataset
# Author: Md Mostafizur Rahman
# Student Id: 202003318
# Email: x2020fpt@stfx.ca
# Kaggle ID: x2020fpt


# Setting the working directory for dataset, scripts, etc.
setwd("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic")

# Loading the train dataset and viewing the datafram
train <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/train.csv")
View(train) # Viewing the train dataframe in RStudio as a table
str(train) # Viewing the dataframe structure

# Loading the test dataset and viewing the datafram
test <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/test.csv")
View(test) # Viewing the train dataframe in RStudio as a table
str(test) # Viewing the dataframe structure