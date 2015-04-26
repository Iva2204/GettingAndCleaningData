# GettingAndCleaningData

This repository is a project assignment of a Coursera course "Getting and Cleaning Data" which is part of the Data Science specialization.

The purpose of this project is to demonstrate the collection, work with, and cleaning of this data set. Tidy data have been prepared so can be used for later analysis.

#Data Set

The used data set "Human Activity Recognition Using Smartphones" can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Execution and files

The Data Set has been unzziped and stored in UCI HAR Dataset/ directory.

The CodeBook.md describes the variables, the data, and the work that has been performed to clean up the data.

The run_analysis.R is the script that has been used for this work. It can be loaded in R/Rstudio and executed without any parameters.
For running the script you must have the **dplyr** package installed.

The result of the execution is a tidyData.txt file that stores a data table in which the average of each variable for each activity and each subject is calculated. For more details consult the code book.
