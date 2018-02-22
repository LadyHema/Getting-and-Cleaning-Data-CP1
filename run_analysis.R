library(ggplot2)
library(dplyr)
library(data.table)
library(WriteXLS)
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "run.zip", method = "curl")
unzip("run.zip")
setwd("UCI HAR Dataset")


#download and unpack this script in folder with downloaded and unpacked "UCI HAR Dataset"
#run the script
#we will get the new file  - "" with the average of each variable for each activity and each subject

#read.datas
xtrain <- cbind(read.table(file = "train/y_train.txt"), read.table(file = "train/X_train.txt"))
xtest <- cbind(read.table(file = "test/y_test.txt"),read.table(file = "test/X_test.txt"))

#read labels/subjects/features' name
features <- read.table(file = "features.txt")
labels_act <- read.table(file = "activity_labels.txt")
subject <- rbind(read.table(file = "train/subject_train.txt"), read.table(file = "test/subject_test.txt"))


#merge two datasets in one and rename the column with features and rename numeric labels activity by string
dset <- rbind(xtrain, xtest)
names(dset) <- c("activity", as.character(features$V2))
dset$activity <- labels_act$V2[dset$activity]

# Extracts only the measurements on the mean and standard deviation for 
# each measurement.
dset <- dset[,grepl("-mean()|-std()|activity", names(dset))]

#create new dataset with information about subject
subactivity <- cbind(subject, dset)
names(subactivity)[1] <- "subject"

# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
mean_values <- subactivity %>% 
  group_by(subject, activity) %>% 
  summarise_all(mean)

setwd('..')
WriteXLS(mean_values, ExcelFileName = "mean_values.xlsx")
