# Readme

This readme describes the data cleaning procedure for data collected in experiments.

## Background

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Data Cleaing procedures

1. Training & test data are merged into one data set.
2. Only measurements on mean & standard deviation for each measurement are extracted.
3. Activities in the dataset are named with descriptive activity names, according to "activity_labels.txt".
4. Variables in the dataset are named with descriptive variable names, according to "features.txt". Special characters like brackets () and hyphens - were also clean up.
5. A second, independent tidy data set with the average of each variable for each activity and each subject was then created and exported as "tidydataset.txt".
    + Each variable forms a column. Total 81 columns including Subject ID, activity, and 79 selected measures.
    + Each observation forms a row. Total 30 subjects, and 6 activities per subject. Hence a total of 180 rows.
    + Each type of observational unit forms a table. All observations are 3-axial linear acceleration and 3-axial angular velocity captured at a constant rate of 50Hz.

## More information about the variables

Please refer to the [codebook](https://github.com/r-rex-x/coursera-getting-and-cleaning-data-week-4-project/blob/master/Codebook.rmd).
