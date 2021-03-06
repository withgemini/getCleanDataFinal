getCleanDataFinal
=================

This is the final project for the Coursera Course "Getting and Cleaning Data"

In order to be able to run run_analysis.R, this file should be in the same directory as unzipped files, downloaded from

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R file performed the following steps per assignment instructions:

1. The X_train.txt and X_test.txt were loaded into R as trainData and testData respectively
2. features.txt was loaded into R and then used as the header for both resulting datasets
3. The y_train.txt and subject_train.txt were loaded into R, given headers, and then merged with trainData
4. The y_test.txt and subject_test.txt were loaded into R, given headers, and then merged with testData
5. activity_labels.txt was loaded into R, merged with both trainData and testData (seperately) in order to identify the activity names based on the IDs from y_train.txt and y_test.txt in the merged files
6. The trainData and testData were merged into allData dataset
7. The columns with mean and standard deviation for each variable were identified and a subset of allData was created as subsetMeanStr dataset

To create tidyData.txt the allData dataset from previous transformations was used and the following steps were performed:

1. The columns with only means for each variable were identified and a subset of allData was created
2. Using melt function from reshape2 package the tidyMelt was created
3. Using dcast function, the data were organized in a more cohesive manner with the average of each variable for each activity and each subject
4. write.table function was used to create tidyData.txt

