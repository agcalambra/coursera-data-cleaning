# CODEBOOK: Getting and Cleaning Data Course Project
This codebook describes the output data from *run_analysis.R* placed within *tidy.txt*.

#### Comprehensive Notes
A more comprehensive description of the data set can be found in the [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), inside *features_info.txt*.

#### Algorithm Overview
1. Load the essential libraries dplyr and reshape2.
2. For each of the training and test data sets, load the corresponding isolated data into R for processing.
  * Subject Data *(subject_(test|train).txt)*
  * Activity Performed *(y_(test|train).txt)*
  * Features Measured *(X_(test|train).txt)*
3. For each group of isolated data, merge their respective training and data set.
4. Load the features measured into R _(features.txt)_.
5. Retrieve and rename(format) features of interest (mean and std).
6. Bind all three sub data sets and label the reconstructed table using the renamed column names.
7. Begin melting and casting the table based on two factors _subjectId_ and _activity_.
8. Load the activity labels in *activity_labels.txt* and mutate the column in the reconstructed table for proper labeling.
9. Print the casted table to _tidy.txt_.

#### Key Columns and Identifiers
The following columns uniquely identify summarized information used to group the data.
  * subjectId - A unique ID of a volunteer in the [Human Activity Recognition Using Smartphones Experiment](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The values range from 1-30, representing the 30 volunteers who participated in the experiment.
  * activity - A specific activity executed by a volunteer and measured during the experiment. The column *activity* can accomodate any of the values below, based on the [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) provided with the project instructions in *activity_labels.txt*.
     * WALKING
     * WALKING_UPSTAIRS
     * WALKING_DOWNSTAIRS
     * SITTING
     * STANDING
     * LAYING

#### Measurements on Features
The following variables have been summarized using *mean()* in R and have been melted using the two variables above.

  * tBodyAccMeanX
  * tBodyAccMeanY
  * tBodyAccMeanZ
  * tBodyAccStdX
  * tBodyAccStdY
  * tBodyAccStdZ
  * tGravityAccMeanX
  * tGravityAccMeanY
  * tGravityAccMeanZ
  * tGravityAccStdX
  * tGravityAccStdY
  * tGravityAccStdZ
  * tBodyAccJerkMeanX
  * tBodyAccJerkMeanY
  * tBodyAccJerkMeanZ
  * tBodyAccJerkStdX
  * tBodyAccJerkStdY
  * tBodyAccJerkStdZ
  * tBodyGyroMeanX
  * tBodyGyroMeanY
  * tBodyGyroMeanZ
  * tBodyGyroStdX
  * tBodyGyroStdY
  * tBodyGyroStdZ
  * tBodyGyroJerkMeanX
  * tBodyGyroJerkMeanY
  * tBodyGyroJerkMeanZ
  * tBodyGyroJerkStdX
  * tBodyGyroJerkStdY
  * tBodyGyroJerkStdZ
  * tBodyAccMagMean
  * tBodyAccMagStd
  * tGravityAccMagMean
  * tGravityAccMagStd
  * tBodyAccJerkMagMean
  * tBodyAccJerkMagStd
  * tBodyGyroMagMean
  * tBodyGyroMagStd
  * tBodyGyroJerkMagMean
  * tBodyGyroJerkMagStd
  * fBodyAccMeanX
  * fBodyAccMeanY
  * fBodyAccMeanZ
  * fBodyAccStdX
  * fBodyAccStdY
  * fBodyAccStdZ
  * fBodyAccMeanFreqX
  * fBodyAccMeanFreqY
  * fBodyAccMeanFreqZ
  * fBodyAccJerkMeanX
  * fBodyAccJerkMeanY
  * fBodyAccJerkMeanZ
  * fBodyAccJerkStdX
  * fBodyAccJerkStdY
  * fBodyAccJerkStdZ
  * fBodyAccJerkMeanFreqX
  * fBodyAccJerkMeanFreqY
  * fBodyAccJerkMeanFreqZ
  * fBodyGyroMeanX
  * fBodyGyroMeanY
  * fBodyGyroMeanZ
  * fBodyGyroStdX
  * fBodyGyroStdY
  * fBodyGyroStdZ
  * fBodyGyroMeanFreqX
  * fBodyGyroMeanFreqY
  * fBodyGyroMeanFreqZ
  * fBodyAccMagMean
  * fBodyAccMagStd
  * fBodyAccMagMeanFreq
  * fBodyBodyAccJerkMagMean
  * fBodyBodyAccJerkMagStd
  * fBodyBodyAccJerkMagMeanFreq
  * fBodyBodyGyroMagMean
  * fBodyBodyGyroMagStd
  * fBodyBodyGyroMagMeanFreq
  * fBodyBodyGyroJerkMagMean
  * fBodyBodyGyroJerkMagStd
  * fBodyBodyGyroJerkMagMeanFreq
