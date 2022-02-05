########################################################################
#Titanic Survival :: Part - 7 : Build Random Forest Model
########################################################################
########################################################################

set.seed(415)
library("randomForest")
fit <- randomForest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Child + Title + FamilySize,
                    data=train_featured, importance=TRUE, ntree=2000)

# Look at variable importance

varImpPlot(fit)

#Now let's make a prediction and write a submission file
my_prediction = predict(fit, test_featured)
my_solution = data.frame(PassengerId = test_featured$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "Featuredfirstforest.csv", row.names = FALSE)


# Build condition inference tree Random Forest
library("caret")
library("party")
library("caret")
set.seed(415)
tree = cforest(as.factor(Survived) ~ Pclass+ Sex+ Age+ SibSp+ Parch+ Fare+ Embarked+ Child+ Title+ FamilySize,
               data = train_featured, controls = cforest_unbiased(ntree=2000, mtry=3))


# Now let's make a prediction and write a submission file
my_prediction = predict(fit, test_featured, OOB= TRUE, type = "response")

my_solution <- data.frame(PassengerId = test_featured$PassengerId, Survived = my_prediction)

write.csv(my_solution, file = "Featuredciforest.csv", row.names = FALSE)









