library(dplyr)
library(tidyr)

## Step 1: Merges the training and the test sets to create one data set.

## read in test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

## combine into one overall test data
names(subject_test) <- "SUBJID"
names(y_test) <- "ACTIVITY_LABEL"
test <- cbind(subject_test, x_test, y_test)

## read in training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## combine into one overall training data
names(subject_train) <- "SUBJID"
names(y_train) <- "ACTIVITY_LABEL"
train <- cbind(subject_train, x_train, y_train)

## merge training and test data together
combine <- rbind(train, test)

## Step 2: Extracts only the measurements on the mean and standard deviation for 
##         each measurement. 

## read in features.txt which list all features (according to variables V1-V561)
feature <- read.table("UCI HAR Dataset/features.txt")

## update the variable names of overall data
names(combine) <- c("SUBJID", feature$V2, "ACTIVITY_LABEL")

## select mean & STD for each measurements
## Personally I think it's those ended with mean() and std() respectively
mean_var_list <- grep("mean()", feature$V2, value = T, fixed = T)
std_var_list <- grep("std()", feature$V2, value = T, fixed = T)

combine_meanstd <- select(combine, SUBJID, ACTIVITY_LABEL, 
                          all_of(mean_var_list), all_of(std_var_list))

## Step 3: Uses descriptive activity names to name the activities in the data set

## read in activity_labels.txt which contains descriptive activity names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("ACTIVITY_LABEL", "ACTIVITY")

## merge descriptive activity names with overall mean & STD data
combine_meanstd_2 <- left_join(combine_meanstd, activity_labels, 
                               by="ACTIVITY_LABEL") %>%
  select(SUBJID, ACTIVITY_LABEL, ACTIVITY, 3:68)

## Step 4: Appropriately labels the data set with descriptive variable names.

## The descriptive variable name would be in pattern like:
## "domain_measurement_type_axis(if any)"
## A more descriptive explanation would be available in Codebook 
names_v <- gsub("\\()", "", gsub("-", "_", names(combine_meanstd_2) [4:69]))
names_new <- c("SUBJID", "ACTIVITY_LABEL", "ACTIVITY", paste0(substr(names_v,1,1),"_",substr(names_v,2,50)))

names(combine_meanstd_2) <- names_new  

## Step 5: From the data set in step 4, creates a second, independent tidy data 
## set with the average of each variable for each activity and each subject.

## transpose step 4 data into longer shape
combine_meanstd_longer <- pivot_longer(combine_meanstd_2, 
                                       4:69, 
                                       names_to = "variable")

## calculate the average per subject per activity per variable
combine_meanstd_longer_avg <- combine_meanstd_longer %>%
  group_by(SUBJID, ACTIVITY_LABEL, ACTIVITY, variable) %>%
  summarize(AVG = mean(value, na.rm = T))

## transpose data back to wider shape
combine_meanstd_avg_wider <- pivot_wider(combine_meanstd_longer_avg,
                                         id_cols = c(SUBJID,ACTIVITY),
                                         names_from = variable,
                                         values_from = AVG)

## Final step: output the final tidy data
write.table(combine_meanstd_avg_wider, file = "final tidy data.txt", 
            row.names = F)