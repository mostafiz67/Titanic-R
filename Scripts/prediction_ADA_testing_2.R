library(dplyr)
library(caret)
full_data <- read.csv("/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/full_dataset.csv")

# Cleaning the dataset
full_data_clean <- full_data %>% 
  select(-c(home.dest, cabin, name, x, ticket)) %>%
  mutate(pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')),
         survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) %>%
  na.omit()

partition <- createDataPartition(full_data_clean$survived, p = 0.8, list=FALSE)
train_data <- full_data_clean[partition,]
test_data <- full_data_clean[-partition,]

prop.table(table(train_data$survived))
prop.table(table(test_data$survived))


decision_tree_1 <- rpart(survived~., data = train_data, method = 'class')
rpart.plot(decision_tree_1, extra = 101)



write.csv(path, file = "/home/mostafiz/Dropbox/MSc/Course_Work/Machine_Learning/Assignment_1/Titanic/Dataset/full_dataset.csv", row.names = FALSE)
