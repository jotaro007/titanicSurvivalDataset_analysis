# titanicSurvivalDataset_analysis
Here I am working on titanic survival dataset from kaggle and I used various types of data mining algorithm to optimize the desired solution

####################################################################################################
####################################################################################################
####################################   1. First Prediction      ####################################
####################################################################################################
####################################################################################################

Here I import the csv file of both train and test dataset. Initialized the survival column as 0. Which exported as "Lazy_Predictor.csv".
Later I was trying to predict passenger survival based on Gender where female survived and male couldn't. So I initialized female as 1.
Which exported as "Gender_Model.csv".



####################################################################################################
####################################################################################################
####################################   2. Data Preparation      ####################################
####################################################################################################
####################################################################################################

In order to prepare the data first we combine the test and train dataset and name it as "Full". Using 'Sapply' to get the percentage of missing value
of the attributes, and 'Amelia' package to find the graphical representation of 'Missing Map'. Drop the variable which has the missing value more than
20%. And also imputing 'Age' variable with mean value, imputing 'Embarked' with 'S', substituting 'Fare' with average value. Splitting clean dataset 
into train_cleaned = Full[1:891,] and test_cleaned = Full[892:1039,]. 


####################################################################################################
####################################################################################################
###############################  3. Data Exploration on cleaned data   #############################
####################################################################################################
####################################################################################################

Here I am using the library package "ggplot2". By using this library I am getting visual representattion of categorical and numerical variables.
Here I am also using Univariate, Bivariate and Multivariate analysis.

####################################################################################################
####################################################################################################
#####################################  4. Feature Engineering   ####################################
####################################################################################################
####################################################################################################

In the feature engineering section I am focusing on creating three new variables. They are 'Child', 'Title' and 'Family Size'.
If the age of a person is smaller than 18 years old then I initialized the row as 1, which considers as child and when the age is greater equal to 18 years old then 
it considers as adult person. 
For the title I extract the different types of title and then combine them into three title group. 
to find out family size I am using sibsp column to find siblings or spouse, and parch column to get parents and children.
Later I created two datasets from 'Full' dataset name as 'train_featured' and 'test_featured'.

####################################################################################################
####################################################################################################
#####################################  5. Logistic Regression   ####################################
####################################################################################################
####################################################################################################

To perform logistic regression, I need to use 'caTools' library to split dataset. I use 'train_featured' then split it into 'train.data' and 'test.data'. 
To create logistic model I use 'glm' function where I first excluded feature engineering variables later included feature engineering variables. Then use 
ANOVA test to find out the difference betweek two models (model with feature engineering and model without feature engineering). Later predict 'test.data' 
on the logit model. 
I also use 'caret' library to build confusion matrix and 'ROCR' library to see ROC-AUC curve.

####################################################################################################
####################################################################################################
#####################################  6. Decision Tree   ##########################################
####################################################################################################
####################################################################################################

For decision tree I use 'rattle', 'rpart.plot', 'RColorBrewer' and 'rpart' library. Recreate the gender model and use 'rpart.plot' library to visualise the 
decision tree. Then I built a deeper tree without feautre engineering and with feature engineering. 
Then I use minsplit = 2, cp = 0 and perform another decision tree algorithm by using 'rpart' library. Also using pruning technique to remove the parts of the tree that do not provide power to classify instances.


####################################################################################################
####################################################################################################
######################################  6. Radom Forest   ##########################################
####################################################################################################
####################################################################################################

Here I use 'randomForest' library to build model by using 'test_featured' later find prediction by using 'test_featured'. Also using 'party' library to build conditional inference trees. 




















