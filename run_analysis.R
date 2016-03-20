30# This function runs analysis on analyze_uci_har_data
# and assumes that the provided data set is already
# in the same working directory.

analyze_uci_har_data <- function(){
  
  # Load dplyr for use in project
  library(dplyr)
  library(reshape2)
  
  # Load test activity data: features, activity labels, then subjects
  testSubjects <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
  testActivityLabels <- tbl_df(read.table("UCI HAR Dataset/test/y_test.txt"))
  testFeatureObs <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
  
  # Load training activity data: features, activity labels, then subjects
  trainingSubjects <- tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))
  trainingActivityLabels <- tbl_df(read.table("UCI HAR Dataset/train/y_train.txt"))
  trainingFeatureObs <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))
  
  # Bind test and training subjects
  finalSubjects <- rbind(testSubjects, trainingSubjects)
  
  # Bind test and training activities
  finalActivities <- rbind(testActivityLabels, trainingActivityLabels)
  
  # Bind feature observations
  finalFeatureObs <- rbind(testFeatureObs, trainingFeatureObs)
  
  # Merge training and test data to create the first data set.
  mergedTable <- cbind(finalSubjects, finalActivities, finalFeatureObs)
  write.table(mergedTable, "merged.txt", row.names = FALSE, quote = FALSE)
  
  # Regular expressions to extract features for mean and std
  meanStdRegex = ".*mean().*|.*std().*"
  
  # Load contents of features.txt
  # These features describe what was being measured for each
  # > column for all rows of data
  features <- tbl_df(read.table("UCI HAR Dataset/features.txt"))
  
  # Extract only columns of interest
  finalFeatures <- features %>% filter(grepl(meanStdRegex, features$V2)) %>% select(V2)
  finalFeatures <- finalFeatures[[1]]
  
  # Properly rename columns
  renamedFeatures <- gsub("mean", "Mean", finalFeatures)
  renamedFeatures <- gsub("std", "Std", renamedFeatures)
  renamedFeatures <- gsub('[-()]', '', renamedFeatures) 
  
  # Filter target indeces
  tMeanStdFeatures <- grep(meanStdRegex, features$V2)
  
  # Filter cols using target indeces
  finalFeatureObs <- finalFeatureObs[, tMeanStdFeatures]
  
  # Bind subject, activity and feature columns together
  finalTable <- cbind(finalSubjects, finalActivities, finalFeatureObs)
  
  # Rename the columns using the extracted names earlier
  colnames(finalTable) <- c("subjectId", "activity", renamedFeatures)
  
  # Melt aggregated table based on two variables: subjectId and activity
  finalTableMelt <- melt(finalTable, id = c("subjectId", "activity"))
  
  # Finally, cast table and apply mean() to grouped observations
  finalCast <- dcast(finalTableMelt, subjectId + activity ~ variable, mean)
  
  # Load contents of activity_labels.txt
  # These activity labels will serve as a more descriptive
  # > display of what activity was being used while wearing
  # > the smartphone
  act_labels <- tbl_df(read.table("UCI HAR Dataset/activity_labels.txt"))
  
  # Mutate the table to indicate more descriptive variables
  finalCast <- finalCast %>% mutate(activity=act_labels$V2[activity])
  
  # Output data to tidy.txt, as per instructions
  write.table(finalCast, "tidy.txt", row.names = FALSE, quote = FALSE)
  
}