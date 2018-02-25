---
title: "Run_analysis_descript_book"
author: "Hema"
date: "18 02 2018"
---

Script download and unpack  "UCI HAR Dataset" from internet ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ), create some data aggregation and create a new file  - "mean_values.txt" with the average of each variable for each activity and each subject of investigation  



1. Script read.datas from test and train subset from txt ("X_train.txt", "X_test.txt"), and merge them with information about type of activity from files ("y_train.txt", "y_test.txt")

2. Text labels contains in file "activity_labels.txt" so the first column with numeric marks of activity replace by srting labels

3. Names of column are in file "features.txt", so column's names have been replaced to names from this files

Now the first column of our dataset is type of activity, and 561 column with different measuresements. 

4. We take only column, that contains in names "-mean()" or "-std()", because we need only information about mean values and standart deviation

5. We add add for the each row information about subject from ("subject_test.txt", "subject_train.txt")

Now we have dataset with first column - number of subject, second column - name of activity, and 79 columns with measureness

Finally script aggregate data by ezch subject and activity type and receive a mean value by 79 columns with measureness

The new dataset we save as "mean_values.txt" file to main directory with our zip file Code Book by columns

"subject" - code of subject (from 1 to 30)                         
"activity" - code of activity   
"mean()" - mean value of measureness
"std()" - standart deviation of measureness
"X / Y / Z" - direction of measureness
"tAcc" - data from accelerometer
"tGyro" - data from gyroscope
"tBodyAcc" - body acceleration signals
"tGravityAcc" - gravity acceleration signals
"tBodyAccJerk" - body linear acceleration
"tBodyGyroJerk" - angular velocity
"Mag" - magnitude
"f" - Fast Fourier Transform (FFT) was applied to some of these signals
"meanFreq" - Weighted average of the frequency components to obtain a mean frequency
"angle" - averaging the signals in a signal window sample
