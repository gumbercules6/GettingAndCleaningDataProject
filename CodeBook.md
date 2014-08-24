#Codebook#

##Run_analysis.r##

Running the run_analysis.R script loads, merges and cleans all of the data from the test and train sets, and then creates a final tidy output.

##Script description##

1. Loading Data
The first part of the code loads all of the training and testing data sets, including the subject and activity labels.

2. Combining all data
The then combines all of the rows of data and the two columns for activity and subject into a table called xdata.

3. Column Names
Next the code loads the features table, removes non-tidy characters, and applies this table as the column names of the xdata set.

4. Merging
The activity column in xdata uses a code to represent each activity, so to convert this into the actual activity the xdata table is merged with the activity labels table. 
This creates the xdatamerged table.

5. Subsetting columns for mean and std
Only the mean and std columns are necessary, so the code looks for any variable containing either word in its heading, and then creates a subset called xdatameanstd. 
Subject and activity labels are also included in the subset.

6. Calculating the means
All of the data is then aggregated by calculating the average for each variable, by subject, by activity. 
The result is a table with 180 observations of the 88 variables remaining after parsing for only variables containing mean and std measurements..

7. Exporting the tidy data set
The final step of the script creates an output file called tidyxdata.txt.  

##Variables##

The variables in the tidyxdata output file are a mean of the original variables provided. they also include only the variables for mean and std.
Below is a list of all of the measurements from the smartphones:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Each of the available sensor readings where given the following measurements:

mean(): Mean value
std(): Standard deviation
 