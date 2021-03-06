# Getting And Cleaning Data Assignment


### Project Details
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### How to work on the Course Project?
1. Download the **UCI HAR Dataset** and put it into a folder on your local drive.
2. Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.
3. Install the package named **dplyr** if you don't have it.
4. Source the **run_analysis.R** file in Rstudio and the code will be executed.A new file named **tinydata.txt** will be saved in the parent folder.

### Code Walkthrough
1. Merges the training and the test sets to create one data set using the rbind function
2. Extract the variables with the string "mean" & "std" from the features.txt
3. Keep only the required mean and std columns of the merged data
4. Uses descriptive activity names to name the activities in the data set
5. Update the activity names in y_data
6. Appropriately labels the data set with descriptive variable names.
7. From the data set in the previous step, creates a second,independent tidy data set with the average of each variable for each activity and each subject. 
8. Write the tidydata to "tidydata.txt" using the write.table function.