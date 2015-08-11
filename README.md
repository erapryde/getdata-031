#README.md

![course project layout](https://cloud.githubusercontent.com/assets/8188574/9192272/2ac304b4-403c-11e5-9cdd-a0f9fdf97f25.png)

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
_______________________________________________________________________________________________________________________________
#Assignment 1: Merges the training and the test sets to create one data set
_______________________________________________________________________________________________________________________________
Use rbind to bind the training and test data sets of X and y and subjects into one set<br>
The results will be binded by column into one data set, **assignmentOne**. Note that we have not yet introduced column names as that is done in assignmentFour.
```
  X<-rbind(xTrain,xTest)
  y<-rbind(yTrain,yTest)
  subject<-rbind(subjectTrain,subjectTest)  
  assignmentOne <- cbind(subject, y, X)
```
_______________________________________________________________________________________________________________________________
#Assignment 2:  Extracts only the measurements on the mean and standard deviation for each measurement
_______________________________________________________________________________________________________________________________
Notice that there are 86 variables with the word **"mean"** in them, **but only** 66 with the word **"mean()"** in them. See <a href="https://class.coursera.org/getdata-031/forum/thread?thread_id=160">**dispute**</a> here. CTA has confirmed that both are acceptable.
Since we want only measurements on the mean and standard deviation, we elect to keep to only one form of the mean measurement, i.e. "mean()", and not select variables like meanFreq. <br><br>
  
We shall grep on the pattern "mean[(][)]" and put the indexes into **l1**
We shall grep on the pattern "std[(][)]" and put the indexes into **l2** and merge these indices into **l** and extract X[,l] into **Z**
Finally, we bind subject, activity and Z columnwise into **assignmentTwo**.
```
  l1<-grep("mean[(][)]",features$variable,ignore.case=T,value=F) #returns vector of indices of coumns with mean()
  l2<-grep("std[(][)]",features$variable,ignore.case=T,value=F) #returns vector of indices of columns with std()
  l<-c(l1,l2) #merges all columns to be read
  Z<-X[,l] #extract columns
  assignmentTwo<-cbind(subject,y,Z)
```
_______________________________________________________________________________________________________________________________
#Assignment 3:  Uses descriptive activity names to name the activities in the data set
_______________________________________________________________________________________________________________________________
From the lecture, variables with character values should be made into factor variables and be descriptive<br>
We shall have to recode the **integer list "y"** into a list of factor variables of 6 levels called **"Activity"** by referencing to activity_labels.txt

The **integer list "subject"** shall also be recoded from an integer list of 1-30 into a list of factors variables **"Test Subject 1"..."Test Subject 30"<br>**
The reason for recoding into factor variables is to prevent misunderstanding of the meaning of these numeric values. This is because *PEOPLE* and *ACTIVITY* do not have an order to them and are not interval or ordinal variables and are better suited as factor variables.<br>
"k" is a holding list for performing the conversion<br>
**assignmentThree** shall be cbind(subject, Activity, Z)<br>
```
#Recode Activity as factors
  k <- vector(length = dim(y)[1],mode="character")
  for (i in 1:dim(y)[1]){
    for (j in 1:6){
      if (y[i,1]==j){
        k[i]<-as.character(activityLabels[j,2])
      }
    }
  }
  Activity<-as.factor(k)
  
  #Recode subjects as factors
  y <- vector(length = length(subject),mode="character")
  for (i in 1:dim(subject)[1]) {
    y[i] = paste("Test Subject",subject[i,1],sep=" ")
  }
  subject<- as.factor(y)
  
  assignmentThree<-cbind(subject,Activity,Z)
```
_______________________________________________________________________________________________________________________________
#Assignment 4:  Appropriately labels the data set with descriptive variable names.
_______________________________________________________________________________________________________________________________
From lecture, names of variables should be lowercase and not have underscores, dots or white spaces.<br>
We shall extract the elements of **features$variable** through our previous index "l"  (features$variable[l]) into a holding variable, **"a"**<br><br>

We shall now regularise the features$variable[l] into human-readable variable names and then pass these into the names of Z, which are the extracted values.<br>
After that, we shall pass these names into the tolower().<br>
Remember to change a back into a factor, as the features list was originally a list of 477 factor variables<br>
The concatenated **assignmentFour** shall hold the **named** subjects, Activity as well as extracted **means()** and **std()**.
```
  a<-features$variable[l]
  a<-gsub("[(][)]","",a)
  a<-gsub(" ","",a)
  a<-gsub("//.","",a)
  a<-gsub("_","",a)
  a<-tolower(a)
  a<-as.factor(a) #There are now only 66 levels
  
  names(Z) <- a
  assignmentFour <- cbind(subject,Activity,Z)
  names(assignmentFour) <- tolower(names(assignmentFour))
```
_______________________________________________________________________________________________________________________________
#Assignment 5:  From the data set in step 4, creates a second, independent tidy data set <br>
###with the average of each variable for each activity and each subject
_______________________________________________________________________________________________________________________________
There are 30 test subjects performing 6 different activities. Averaging the variables for each activity for each subject for each variable would lead to a 180 x 68 data.frame. <br><br>
There are disputes over whether the data should be *long form* or *short form*, but either case are confirmed to be acceptable by <a href="https://class.coursera.org/getdata-031/forum/thread?thread_id=28">**Community TA, David Hood**</a>.<br><br>
The rows would have each subject/activity combination and the coloumns would be each variable<br>
You need dplyr package to run this code.

```
assignmentFive<-group_by(assignmentFour, subject, activity) %>% summarise_each(funs(mean))
```

_______________________________________________________________________________________________________________________________
#Write the output files as .txt
_______________________________________________________________________________________________________________________________
```
  write.table(assignmentOne,file="./assignmentOne.txt",row.name=F,sep="\t")
  write.table(assignmentTwo,file="./assignmentTwo.txt",row.name=F,sep="\t")
  write.table(assignmentThree,file="./assignmentThree.txt",row.name=F,sep="\t")
  write.table(assignmentFour,file="./assignmentFour.txt",row.name=F,sep="\t")
  write.table(assignmentFive,file="./assignmentFive.txt",row.name=F,sep="\t")  
```
