---
title: "A Simple CodeBook"
author: "Fiona Yan"
date: "7/27/2021"
output: html_document
---

## How was the raw data processed?

All raw data about training and test were read into R and be pre-processed separately. Subject data (subject_xx), actual value data (X_xx) and activity data(y_xx) were merged together by row number (where xx refers to either train or test). Then the merged training and merged test data was set together. Here the first step, "Merges the training and the test sets to create one data set", was completed.

In the next step, feature data (features.txt) was read into R, which was used to update the variable names and also was used to determine the variables which were "measurements on the mean and standard deviation for each measurement". Personally, I think they were those containing mean() or std(). As a result, those variables as long as subject ID (SUBJID), activity number (ACTIVITY_LABEL) were selected.

After that, activity label data (activity_labels.txt) was read into R and merged with the selected data in the last step by activity number. In this way, descriptive activity names were used to name the activities in the data set.

Following that, the variable names of the measurements were modified a little bit to be in pattern like "domain_measurement_type_axis(if any)", in order to "appropriately labels the data set with descriptive variable names".

-   domain: t (time) or f (frequency)
-   measurement: BodyAcc (body acceleration signals), GravityAcc (gravity acceleration signals), BodyAccJerk (body linear acceleration Jerk signals), BodyGyro (angular velocity signals), BodyGyroJerk (angular velocity Jerk signals), BodyAccMag (magnitude of body acceleration signals), GravityAccMag (magnitude of gravity acceleration signals), BodyAccJerkMag (magnitude of body linear acceleration Jerk signals), BodyGyroMag (magnitude of angular velocity signals), BodyGyroJerkMag (magnitude of angular velocity Jerk signals), BodyBodyAccJerkMag, BodyBodyGyroMag, BodyBodyGyroJerkMag
-   type: mean (mean for each measurement) or std (standard deviation for each measurement)
-   axis (if any): X (x-axis), Y (y-axis), Z (z-axis)

Finally, the data set with updated variable names was transpose to longer shape in order to derive the average of "each variable for each activity and each subject" using group_by and summarize functions, and then was transposed back to wider shape.

The final tidy data was stored in a text file using write.table function. The final data has one row for each observation and one column for each variable.

## What's included in the final tidy data?

There are 180 observations of 68 variables in the final tidy data set.
(Please use raw mode if below table is not in a proper shape.)
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| **Variable Order** | **Variable Name**          | **Descriptive Explanation**                                                                                     |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 1                  | SUBJID                     | integer: Subject ID (from 1 to 30)                                                                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 2                  | ACTIVITY                   | character: Activity Name ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 3                  | f_BodyAcc_mean_X           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 4                  | f_BodyAcc_mean_Y           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 5                  | f_BodyAcc_mean_Z           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 6                  | f_BodyAcc_std_X            | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 7                  | f_BodyAcc_std_Y            | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 8                  | f_BodyAcc_std_Z            | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 9                  | f_BodyAccJerk_mean_X       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 10                 | f_BodyAccJerk_mean_Y       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 11                 | f_BodyAccJerk_mean_Z       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 12                 | f_BodyAccJerk_std_X        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 13                 | f_BodyAccJerk_std_Y        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 14                 | f_BodyAccJerk_std_Z        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 15                 | f_BodyAccMag_mean          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 16                 | f_BodyAccMag_std           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 17                 | f_BodyBodyAccJerkMag_mean  | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 18                 | f_BodyBodyAccJerkMag_std   | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 19                 | f_BodyBodyGyroJerkMag_mean | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 20                 | f_BodyBodyGyroJerkMag_std  | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 21                 | f_BodyBodyGyroMag_mean     | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 22                 | f_BodyBodyGyroMag_std      | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 23                 | f_BodyGyro_mean_X          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 24                 | f_BodyGyro_mean_Y          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 25                 | f_BodyGyro_mean_Z          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 26                 | f_BodyGyro_std_X           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 27                 | f_BodyGyro_std_Y           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 28                 | f_BodyGyro_std_Z           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 29                 | t_BodyAcc_mean_X           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 30                 | t_BodyAcc_mean_Y           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 31                 | t_BodyAcc_mean_Z           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 32                 | t_BodyAcc_std_X            | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 33                 | t_BodyAcc_std_Y            | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 34                 | t_BodyAcc_std_Z            | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 35                 | t_BodyAccJerk_mean_X       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 36                 | t_BodyAccJerk_mean_Y       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 37                 | t_BodyAccJerk_mean_Z       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 38                 | t_BodyAccJerk_std_X        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 39                 | t_BodyAccJerk_std_Y        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 40                 | t_BodyAccJerk_std_Z        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 41                 | t_BodyAccJerkMag_mean      | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 42                 | t_BodyAccJerkMag_std       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 43                 | t_BodyAccMag_mean          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 44                 | t_BodyAccMag_std           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 45                 | t_BodyGyro_mean_X          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 46                 | t_BodyGyro_mean_Y          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 47                 | t_BodyGyro_mean_Z          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 48                 | t_BodyGyro_std_X           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 49                 | t_BodyGyro_std_Y           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 50                 | t_BodyGyro_std_Z           | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 51                 | t_BodyGyroJerk_mean_X      | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 52                 | t_BodyGyroJerk_mean_Y      | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 53                 | t_BodyGyroJerk_mean_Z      | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 54                 | t_BodyGyroJerk_std_X       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 55                 | t_BodyGyroJerk_std_Y       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 56                 | t_BodyGyroJerk_std_Z       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 57                 | t_BodyGyroJerkMag_mean     | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 58                 | t_BodyGyroJerkMag_std      | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 59                 | t_BodyGyroMag_mean         | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 60                 | t_BodyGyroMag_std          | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 61                 | t_GravityAcc_mean_X        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 62                 | t_GravityAcc_mean_Y        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 63                 | t_GravityAcc_mean_Z        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 64                 | t_GravityAcc_std_X         | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 65                 | t_GravityAcc_std_Y         | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 66                 | t_GravityAcc_std_Z         | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 67                 | t_GravityAccMag_mean       | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
| 68                 | t_GravityAccMag_std        | numeric: refer to "domain_measurement_type_axis(if any)" pattern explanation above                              |
+--------------------+----------------------------+-----------------------------------------------------------------------------------------------------------------+
