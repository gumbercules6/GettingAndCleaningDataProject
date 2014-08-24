#GettingAndCleaningDataProject#
=============================
This repo contains all of the files required for the Getting And Cleaning Data Course Project.
The project involved loading and cleaning data taken from several smartphones. The data included various measurements 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

The data for this project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The repo contains the following files:
-Run-Analysis.R: r-script that loads, cleans, merges, and calculates the mean

-CodeBook.md: describes the process variables in the tidy data extract

##Run_analysis.r (taken from codebook)##

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