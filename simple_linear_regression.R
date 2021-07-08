# Simple Linear Regression 
# Importing dataset
dataset = read.csv("Salary_Data.csv")

# Spliting Data into traning set and test set
library(caTools)
split = sample.split(dataset$Salary , SplitRatio = 2/3)
training_set = subset(dataset , split == TRUE)
testing_set = subset(dataset , split == FALSE)

# Fitting Simple Linear Regression to the training set ..
# lm(formula = dependent var ~ independent var )
regressor = lm(formula = Salary ~ YearsExperience , 
               data = training_set)

# predict the test set results
y_pred = predict(regressor , newdata = testing_set)

#Visualizing the training set results 
library(ggplot2)
ggplot() + 
  geom_point(aes( x = training_set$YearsExperience , y = training_set$Salary) ,
             color = 'red') +
  geom_line(aes( x = training_set$YearsExperience , y = predict(regressor , newdata = training_set)) , 
            color='blue') + 
  ggtitle("Salary VS Experience (Training set)") + 
  xlab("Years Of Experience") + 
  ylab("Salary")
  