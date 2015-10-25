# README - Getting and Cleaning Data - Project
This GitHub repository stores the project submission for Chris Lewkowski.

## Project Task
To collect, prepare and clean an existing data set. Then this cleaned data set is to be grouped and the mean applied to the groups. This final data set is considered 'Tidy Data' to be used in a future analysis. Details from the original project instructions are below:

## Original Project Instructions
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files within this repository
- 'README.md' This file, explaining what is within the repository and the project task.
- 'run_analysis.R' File containing the R script code that can be run to reproduce the 'tidy_data_set.txt'.
- 'Codebook.md' File explaining the R script code used to transform the supplied data set into the required 'Tidy Data' ouput. This include description of the data.
- 'Tidy_data_set.txt' Output data set produced from running the 'run_analysis.R' script. 

## R version used
The version of R used is 3.2.2 on Windows 8 (64-bit). The following additional libraries were used:
'''
library(data.table)
library(dplyr)
'''