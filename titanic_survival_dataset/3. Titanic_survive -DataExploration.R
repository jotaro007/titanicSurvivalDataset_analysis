########################################################################
#Titanic Survival :: Part - 3 : Data Exploration on cleaned data
########################################################################
# univariate EDA
# bivariate EDA
# multivariate EDA
########################################################################
### Univariate EDA

library(ggplot2)

# categorical variables
xtabs(~Survived,train_cleaned)
ggplot(train_cleaned)+geom_bar(aes(x=Survived))
ggplot(train_cleaned)+geom_bar(aes(x=Sex))
ggplot(train_cleaned)+geom_bar(aes(x=Pclass))

# numerical variables
ggplot(train_cleaned) + geom_histogram(aes(x=Fare), fill = "white", colour = "black")
ggplot(train_cleaned) + geom_boxplot(aes(x=factor(0), y= Fare))+ coord_flip()
ggplot(train_cleaned)+ geom_histogram(aes(x=Age), fill = "white", colour = "black")
ggplot(train_cleaned) + geom_boxplot(aes(x=factor(0), y = Age))+ coord_flip()

#############################################################################################
## Bivariate EDA
# cat-cat relationships
xtabs(~Survived+Sex, train_cleaned)
ggplot(train_cleaned)+geom_bar(aes(x=Sex, fill=factor(Survived)))

xtabs(~Survived+Embarked, train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x = Embarked, fill=factor(Survived)))

xtabs(~Survived+Pclass, train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x = Pclass, fill=factor(Survived)))

#Num-Cat relationships
ggplot(train_cleaned) + geom_boxplot(aes(x = factor(Survived), y = Age))
ggplot(train_cleaned) + geom_histogram(aes(Age), fill = "white", colour = "black")+ facet_grid(factor(Survived)~.)

ggplot(train_cleaned) + geom_boxplot(aes(x = factor(Survived), y = Fare))
ggplot(train_cleaned) + geom_histogram(aes(Fare), fill = "white", colour = "black")+ facet_grid(factor(Survived)~.)

################################################################################################
## Multivariate EDA


xtabs(~factor(Survived)+Pclass+Sex, train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x = Sex, fill=factor(Survived))) + facet_grid(Pclass ~ .)


xtabs(~factor(Survived)+Embarked+Sex, train_cleaned)
ggplot(train_cleaned) + geom_bar(aes(x = Sex, fill=factor(Survived))) + facet_grid(Embarked ~ .)








































