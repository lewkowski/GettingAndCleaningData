# Code Book - Getting and Cleaning Data - Project
This Code Book describes the data and R script code applied to the supplied existing data set to produce the required `Tidy Data` set as outline in the project tast (see README.md).

## Input Data Set
A full description of the input data set is available at this site: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The input data set was downloaded from:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Input files used
Only the following input files from the downloaded zipped data set were read into tables:
`./UCI HAR Dataset/train/subject_train.txt` contains the participant or subject id of the user generating the data from Training data (stored in subject_train)
`./data/UCI HAR Dataset/train/y_train.txt` contains the activity undertaken by the subject while the data was being recorded from Training data (stored in activity_train)
`./data/UCI HAR Dataset/train/X_train.txt` the observations made while the subject was undertaking the activity from Training data (stored in feature_train)
`./data/UCI HAR Dataset/test/subject_test.txt` as per subject_train but taken from test data (stored in subject_test)
`./data/UCI HAR Dataset/test/y_test.txt` as per y_train but taken from test data (stored in activity_test)
`./data/UCI HAR Dataset/test/X_test.txt` as per X_train but taken from test data (stored in feature_test)
`./data/UCI HAR Dataset/features.txt` contains the meta data describing the feature variable names (stored in feature_labels)
`./data/UCI HAR Dataset/activity_labels.txt` contains the english description for the activity (stored in activity_labels)

# Transformations applied
A summary of the transformation applied to the data follows. Further details are captured in the R script comments of the file `run_analysis.R`.

- All input files used were read into their respective variables (see above section Input Files Used)
- The 'Test' and 'Train' file sets were combined by row with rbind()
- Column names were then applied to the combined table
- Feature, Activity and Subject tables were then combined by row with cbind()
- Then only columns pertaining to variables storing 'Mean' or 'STD' were selected using grep() over the columnn names
- The english description for the acivities were then added using factor()
- Then the column name acronyms were expanded to be in a more 'human' readable form using gsub() and names()
- The data was then grouped by Subject and Activity and the mean() was taken for each Subject/Activity pair
- Finaly this Tidy Data was output to a file `Tidy_data_set.txt` using the write.table() function

## Output data set
The output data set `Tidy_data_set.txt` is a space-delimited file. It contains a header detailing the names of the columns. The rows contain the mean() of the original data grouped by Subject/Activity pair