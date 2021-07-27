# Get-clean_project

Peer-graded Assignment: Getting and Cleaning Data Course Project

Below files are contained in the repository "Get-clean_project":

1.  README.md: This is the exact file you're reading, which provides the information about what's included in each file of this repository.

2.  final tidy data.txt: This is the "independent tidy data set with the average of each variable for each activity and each subject" required in step 5. It's generated using run_analysis.R and the raw data provided (both training and test data). To read this final tidy data back to R, you can first download the text file (into working directory) and then use below code:

    ```{r}
    data <- read.table("final tidy data.txt", header = TRUE) 
    View(data)
    ```

3.  run_analysis.R: This is the code used to manipulate raw data into the final tidy data. Comments of the purpose of each part of the code are included.

4.  CodeBook.md: This code book provides a general idea about how the raw data was processed and gives detailed information about each variables in the final tidy data.
