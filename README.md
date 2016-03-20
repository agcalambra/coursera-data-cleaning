# Getting and Cleaning Data Course Project 
A programming assignment on retrieving and cleaning data using R in partial fulfillment of Coursera's data cleaning course.

#### Overview
This project performs the desired analysis using the main script, _run_analysis.R_. Materials used for this project was retrieved from this [repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

#### Assumptions and Installation
1. This project assumes that the Human Activity Recognition Using Smartphones Dataset experiment data set [contained in this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is already unzipped in the _same directory_ this script resides in, under its original "UCI HAR Dataset" root folder.
2. Load *run_analysis.R* using *source()*.
3. The output files *merged.txt* and *tidy.txt* will show up in the same directory as *run_analysis.R*.

#### Algorithm Overview
1. Load the essential libraries dplyr and reshape2.
2. For each of the training and test data sets, load the corresponding isolated data into R for processing.
  * Subject Data *(subject_(test|train).txt)*
  * Activity Performed *(y_(test|train).txt)*
  * Features Measured *(X_(test|train).txt)*
3. For each group of isolated data, merge their respective training and data set. Print out the first data set as instructed into *merged.txt*.
4. Load the features measured into R _(features.txt)_.
5. Retrieve and rename(format) features of interest (mean and std).
6. Bind all three sub data sets and label the reconstructed table using the renamed column names.
7. Begin melting and casting the table based on two factors _subjectId_ and _activity_.
8. Load the activity labels in *activity_labels.txt* and mutate the column in the reconstructed table for proper labeling.
9. Print the casted table to *_tidy.txt_* as instructed.
