########################################################################
#Titanic Survival :: Part - 6 : Decision Tree
########################################################################
########################################################################

library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(rpart)

# Recreate the gender model
dtree1 = rpart(Survived ~ Sex, data = train_featured, method = "class")
rpart.plot(dtree1)
fancyRpartPlot(dtree1)
my_prediction = predict(dtree1, test_featured, type = "class")

my_solution = data.frame(PassengerId = test_featured$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "dtree1.csv", row.names = FALSE)
###############################################################################
# Build a deeper tree without feature Engineering

dtree2 = rpart(Survived ~ Pclass+Sex+Age+ SibSp+ Parch+ Fare+ Embarked,
               data = train_featured,
               method = "class")
rpart.plot(dtree2)
fancyRpartPlot(dtree2)

my_prediction = predict(dtree2, test_featured, type = "class")
my_solution = data.frame(PassengerId = test_featured$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "dtree2.csv", row.names = FALSE)

#########################################################################################
# Build a deeper tree - with feature engineering
dtree3 = rpart(Survived ~ Pclass+Sex+ Age+ SibSp+ Parch+ Fare+ Embarked+ Child+ Title+ FamilySize,
               data = train_featured,
               method = "class")
rpart.plot(dtree3)
fancyRpartPlot(dtree3)

my_prediction = predict(dtree3, test_featured, type = "class")
my_solution = data.frame(PassengerId = test_featured$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "dtree3.csv", row.names = FALSE)

#############################################################################################

# Go all over and reach max depth of the tree by making cp = 0 and minsplit = 2
dtree4 = rpart(Survived ~ Pclass+ Sex+ Age+ SibSp+ Parch+ Fare+ Embarked+ Child+ Title+ FamilySize,
               data = train_featured,
               method = "class",
               control = rpart.control(minsplit = 2, cp= 0))
fancyRpartPlot(dtree4)
my_prediction = predict(dtree4, test_featured, type = "class")
my_solution = data.frame(PassengerId = test_featured$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "dtree4.csv", row.names = FALSE)

#Accuracy = 69% -> worst than gender model -> Welcome to overfitting
######################################################################################
# Let's handle overfitting problem

printcp(dtree4)
# Minimum error occurs when the tree size is = 3

# Find the value of CP for which cross validation error is minimum
min(dtree4$cptable[,"xerror"])
which.min(dtree4$cptable[, "xerror"])
cpmin = dtree4$cptable[8, "CP"]
cpmin


#Prune the tree by setting the CP parameter as = cpmin
dtree5 = prune(dtree4, cp = cpmin)
rpart.plot(dtree5)
fancyRpartPlot(dtree5)

my_prediction = predict(dtree5, test_featured, type = "class")
my_solution = data.frame(PassengerId = test_featured$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "dtree5.csv", row.names = FALSE)

#Alternative way of pruning tree
dtree5 = prp(dtree4, snip = TRUE)$obj
fancyRpartPlot(dtree5)


my_prediction = predict(dtree5, test_featured, type = "class")
my_solution = data.frame(PassengerId = test_featured$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "dtree6.csv", row.names = FALSE)

##################################################################################################

