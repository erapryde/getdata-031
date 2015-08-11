#README.md
_______________________________________________________________________________________________________________________________
![course project layout](https://cloud.githubusercontent.com/assets/8188574/9188852/c138bf3e-4013-11e5-9c9e-47af5fd4270b.png)
________________________________________________________________________________________________________________________________
run-analysis.R must be placed at the same hierarchy as the UCI HAR Dataset folder, with the datasets distributed in the same manner you have downloaded it. The following picture describes the file/folder hierarchy.<br><br>
run_analysis.R also assumes that you have a Windows system as setwd() commands are different for Mac OS.<br><br>
You must also have installed and loaded dplyr package. You can do so by<br>
>>install.packages("dplyr")<br>
>>library(dplyr)<br>

We will be using <a href="https://en.wikipedia.org/wiki/CamelCase">camelCase</a> for variable names to improve readability of the variables. 
________________________________________________________________________________________________________________________________
#Reading and Loading Data
________________________________________________________________________________________________________________________________
The objective is to move into UCI HAR Dataset and then
- read activity_labels.txt into activityLabels
- read features.txt into features

Move into train folder, read data then move back up
- read X_train.txt into xTrain
- read y_train.txt into yTrain
- read subject_train.txt into subjectTrain

Move into test folder, read data then move back up
- read X_test.txt into xTest
- read y_test.txt into yTest
- read subject_test.txt into subjectTest

```
  activityLabels<-read.table("activity_labels.txt",col.names=c("Label","Activity"))
  features<-read.table("features.txt",col.names=c("Label","variable"))
  setwd("./train")
  subjectTrain<-read.table("subject_train.txt",col.names="subject")
  xTrain<-read.table("X_train.txt")
  yTrain<-read.table("y_train.txt",col.names="Training label")
  setwd("../")
  setwd("./test")
  subjectTest<-read.table("subject_test.txt",col.names="subject")
  xTest<-read.table("X_test.txt")
  yTest<-read.table("y_test.txt",col.names="Training label")
  setwd("../")
  setwd("../")
```

#Assignment 1: Merges the training and the test sets to create one data set
