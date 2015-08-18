## Merges the training and the test sets to create one data set.
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

x_data <- rbind(x_train,x_test)
y_data <-rbind(y_train,y_test)
subject_data <- rbind(subject_train,subject_test)

## Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table(file="./features.txt")
library(dplyr) ## Load the dply package
mean_std_features <- rbind(features[grep("mean",features[,2],ignore.case = TRUE),],features[grep("std",features[,2],ignore.case = TRUE),])
mean_std_features <- arrange(mean_std_features,mean_std_features[,1])

# Keep only the required mean and std columns of the merged data
x_data<-x_data[,mean_std_features[,1]]
names(x_data)<- mean_std_features[,2]

##Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

#Update the activity names in y_data
y_data[,1] <- activities[y_data[,1],2]
names(y_data) <- "activity"


## Appropriately labels the data set with descriptive variable names. 
names(subject_data) <- "subject"
alldata <- cbind(x_data,y_data,subject_data)

## From the data set in step 4, creates a second,
## independent tidy data set with the average of each variable
## for each activity and each subject.  

avg <- aggregate(alldata[,1:84],by=list(activity=alldata$activity,subject=alldata$subject),mean)
write.table(avg,file="./tidydata.txt",row.names = FALSE)
