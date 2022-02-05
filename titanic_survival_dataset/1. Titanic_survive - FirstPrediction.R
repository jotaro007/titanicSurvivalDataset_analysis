########################################################################
#Titanic Survival :: Part - 1 : Creating first prediction model
########################################################################
# Titanic Dataset
# Import the training and test dataset
train = read.csv("train.csv", stringsAsFactors = F, na.strings = c("", "NA", " "))
test = read.csv("test.csv", stringsAsFactors = F, na.strings = c("", "NA", " "))
str(train)
str(test)
summary(train)
summary(test)

##############################################################################
#Lazy Predictor
##############################################################################

#Initialize a survived column to 0
test$Survived = 0
my_solution = data.frame(PassengerId = test$PassengerId, Survived = test$Survived)

# check the row number - It should match with test row number - 418
nrow(my_solution)

#write the solution for submission

write.csv(my_solution, file = "Lazy_Predictor.csv", row.names = FALSE)

#####################################################################
# First predictor with Gender
#####################################################################
# set survived to 1 if Sex is "female"
test$Survived[test$Sex == "female"] = 1
my_solution = data.frame(PassengerID = test$PassengerId, Survived = test$Survived)


# Check the row number
nrow(my_solution)

#write the solution for submission 
write.csv(my_solution, file = "Gender_Model.csv", row.names = FALSE)



























