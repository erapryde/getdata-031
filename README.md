### Expectations of file structures and packages used for Getting and Cleaning Data Course Project, August 3rd 2015

R version 3.1.2<br>
install.packages("dplyr") has been installed<br>

###Expected folder structure for run_analysis.r

run_analysis.r is on the same folder level as the UCI HAR Dataset folder<br>
Activity labels and feature files are in setwd("./UCI HAR Dataset")<br>
data file paths are setwd("./train"), setwd("./test")<br>

###Explanation of run_analysis.r
- load the library(dplyr)
- move into folder
- read in the activity labels and features 

```
library(dplyr)                  
setwd("./UCI HAR Dataset")      #Move into folder to start reading
activity_labels<-read.table("activity_labels.txt",col.names=c("Label","Activity"))
features<-read.table("features.txt",col.names=c("Label","variable"))
```

- move into train folder
- read X_train, y_train, subject_train
- move back up and then into test folder
- read X_test, y_test, subject_test

```
setwd("./train")
subject_train<-read.table("subject_train.txt",col.names="subject")
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt",col.names="Training label")
setwd("../")
setwd("./test")
subject_test<-read.table("subject_test.txt",col.names="subject")
X_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt",col.names="Training label")
setwd("../")
```

#Assignment 1: Merges the training and the test sets to create one data set.
- Use rbind to bind the X_train and X_test to form **X**
- names(X) is equated to features[,2] so as to give each column of **X** a meaningful description
- Use rbind to bind the y_train and y_test to form **y**
- use rbind to bind the subject_train and subject_test to form subject
- The order train, test must be adhered to consistently

```
X<-rbind(X_train,X_test) #Merged Data
names(X)<-features[,2]
y<-rbind(y_train,y_test) #1-6, Activity type
subject<-rbind(subject_train,subject_test) #1-30, person doing activity
```

Now, we have to recode the **Activity** from numeric labels into their respective activity_labels character conterparts as well as converted into factor of 6 levels.

```
k <- vector(length = dim(y)[1],mode="character")
for (i in 1:dim(y)[1]){
  for (j in 1:6){
    if (y[i,1]==j){
      k[i]<-as.character(activity_labels[j,2])
    }
  }
}
Activity<-as.factor(k)
```

Also, we recode the numeric **subject** variables into a 30-factor variable which is more descriptive. Finally, concatenate the **subjects**, **Activity** and **X** into a complete merged **assignmentOne**. <a href="https://en.wikipedia.org/wiki/CamelCase">CamelCase</a> is used as it is a viable form of describing important variables that is eye-catching and descriptive.  

```
y <- vector(length = dim(y)[1],mode="character")
for (i in 1:length(y)) {
  y[i] = paste("Test Subject",subject[i,1],sep=" ")
}
subject<- as.factor(y)
assignmentOne<-cbind(subject,Activity,X) 
```

