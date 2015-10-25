  # Set the working directory
  setwd("C:\\Users\\Chris\\Google Drive\\Data Science\\JHU Data Scientist Course\\3 Getting and Cleaning Data\\Project\\")

  # Load libraries used
  library(data.table)
  library(dplyr)

  # Create directory for data
  if (!file.exists("data"))
  {
    dir.create("data")
  }
  
  # Download the file from the internet
  fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  filerawlocal <- "./data/data.zip"
  
  # Check if we have file before downloading
  if(!file.exists(filerawlocal))
  {
    download.file(fileURL, filerawlocal)
    # Unzip the file
    unzip (filerawlocal, exdir = "./data")
  }
  
  ###
  ### Part 1 - Merges the training and the test sets to create one data set
  ###
  # Read all raw data into tables
  # Training dataset
  subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
  activity_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
  feature_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
  # Test dataset
  subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
  activity_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
  feature_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)  
  
  # Read Meta-data into tables
  feature_labels <- read.table("./data/UCI HAR Dataset/features.txt")
  activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
  
  # Merge/combine the data sets together by row
  subject <- rbind(subject_train, subject_test)
  activity <- rbind(activity_train, activity_test)
  feature <- rbind(feature_train, feature_test)
  
  # Insert header rows
  colnames(feature) <- feature_labels[,2]
  colnames(subject) <- "Subject"
  colnames(activity) <- "Activity"
  
  # Merged complete labeled dataset
  completedata <- cbind(feature, activity, subject)
  
  ###
  ### Part 2 Extracts only the measurements on the mean and standard deviation for each measurement
  ###
  # Get the list of column names we are interested in
  columns_with_mean_std <- c(grep(".*Mean.*|.*Std.*", names(completedata), ignore.case = TRUE), 562, 563)
  
  # Select only columns interested in
  target_data <- completedata[,columns_with_mean_std]
  
  ###
  ### Part 3 Uses descriptive activity names to name the activities in the data set
  ###
  #
  target_data$Activity <- factor(target_data$Activity, levels = activity_labels[,1], labels = activity_labels[,2])
  
  ###
  ### Part 4 Appropriately labels the data set with descriptive variable names
  ###
  # Substitute expanded names for acronyms
  #
  names(target_data)<-gsub("Acc", "Accelerometer", names(target_data))
  names(target_data)<-gsub("BodyBody", "Body", names(target_data))
  names(target_data)<-gsub("Gyro", "Gyroscope", names(target_data))
  names(target_data)<-gsub("Mag", "Magnitude", names(target_data))
  names(target_data)<-gsub("^t", "Time", names(target_data))
  names(target_data)<-gsub("^f", "Frequency", names(target_data))
  names(target_data)<-gsub("tBody", "TimeBody", names(target_data))
  names(target_data)<-gsub("-mean()", "Mean", names(target_data), ignore.case = TRUE)
  names(target_data)<-gsub("-std()", "STD", names(target_data), ignore.case = TRUE)
  names(target_data)<-gsub("-freq()", "Frequency", names(target_data), ignore.case = TRUE)
  names(target_data)<-gsub("angle", "Angle", names(target_data))
  names(target_data)<-gsub("gravity", "Gravity", names(target_data))
  
  ###
  ### Part 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  ###
  
  tidy_data <- aggregate(. ~Subject + Activity, target_data, mean)
  tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
  write.table(tidy_data, file = "Tidy_Data_Set.txt", row.names = FALSE)
  