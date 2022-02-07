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



























