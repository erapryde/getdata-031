run_analysis<- function(){
  
  #Code was written by erapryde ats of 11th August 2015
  #No part shall be reproduced without expressed permission
  #in accordane with the Coursera Honor Code.
  
  library(dplyr)
  setwd("./UCI HAR Dataset")
  
  #---------------------------------------------------------
  #Read and Load
  #---------------------------------------------------------
  #xTrain, yTrain, subjectTrain, xTest, yTest, subjectTest  are lists 
  #features is a 561 x 2 list with attributes "variable"
  #activityLabels are the list containing the 6 labels for activity
  
  #Pre-amble: Reading in Data Labels
  activityLabels<-read.table("activity_labels.txt",col.names=c("Label","Activity"))
  features<-read.table("features.txt",col.names=c("Label","variable"))
  #Reading training data
  setwd("./train")
  subjectTrain<-read.table("subject_train.txt",col.names="subject")
  xTrain<-read.table("X_train.txt")
  yTrain<-read.table("y_train.txt",col.names="Training label")
  #Reading test data  
  setwd("../")
  setwd("./test")
  subjectTest<-read.table("subject_test.txt",col.names="subject")
  xTest<-read.table("X_test.txt")
  yTest<-read.table("y_test.txt",col.names="Training label")
  setwd("../")
  setwd("../")
  
  #---------------------------------------------------------
  #Assignment 1:  Merges the training and the test sets to create one data set
  #---------------------------------------------------------
  #xTrain and xTest are binded by rows into X
  #yTrain and yTest are binded by rows into y
  #subjectTrain and subjectTest are binded by rows into subject
  #The concatenated cbind(subject, y, X) shall be assigned into assignmentOne
  
  #Note that recoding activity into factor and meaningful variables occurs in Assignment 3.
  
  X<-rbind(xTrain,xTest)
  y<-rbind(yTrain,yTest)
  subject<-rbind(subjectTrain,subjectTest)  
  assignmentOne <- cbind(subject, y, X)
  
  #---------------------------------------------------------
  #Assignment 2:  Extracts only the measurements on the mean and standard deviation for each measurement
  #---------------------------------------------------------
  #Notice that there are 86 variables with the word "mean" in them, but only 66 with the word "mean()" in them.
  #Since we want only measurements on the mean and standard deviation, we elect to keep to only one form of the mean 
  #measurement, i.e. "mean()", and not select variables like meanFreq,
  
  #We shall grep on the pattern "mean[(][)]" and put the indexes into l1
  #We shall grep on the pattern "std[(][)]" and put the indexes into l2
  #and merge these indices into l and extract X[,l] into Z
  
  l1<-grep("mean[(][)]",features$variable,ignore.case=T,value=F) #regular expressions, returns vector of columns with means
  l2<-grep("std[(][)]",features$variable,ignore.case=T,value=F) #regular expressions, returns vector of columns with std
  l<-c(l1,l2) #merges all columns to be read
  Z<-X[,l] #extract columns
  assignmentTwo<-cbind(subject,y,Z)
  
  #---------------------------------------------------------
  #Assignment 3:  Uses descriptive activity names to name the activities in the data set
  #---------------------------------------------------------  
  #From the lecture, variables with character values should be made into factor variables and be descriptive
  
  #We shall have to recode the integer list "y" into a list of factor variables of 6 levels called "Activity" 
  #by referencing to activity_labels.txt
  
  #The integer list "subject" shall also be recoded from an integer list of 1-30
  #into a list of factors variables "Test Subject 1"..."Test Subject 30"
  
  #The reason for recoding into factor variables is to prevent misunderstanding of the meaning
  #of these numeric values. This is because PEOPLE and ACTIVITY do not have an order to them and are not
  #interval or ordinal variables and are better suited as factor variables.
  
  #"k" is a holding list for performing the conversion
  
  #assignmentThree shall be cbind(subject, Activity, Z)
  
  #We are also assuming that the 66 extracted "mean()" and "std()" variables are of concern, 
  #instead of the 561 variable set.
  
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
  
  #---------------------------------------------------------
  #Assignment 4:  Appropriately labels the data set with descriptive variable names.
  #---------------------------------------------------------  
  #From lecture, names of variables should be lowercase
  #and not have underscores, dots or white spaces
  
  #We shall extract the elements of features$variable through our previous index "l"  (features$variable[l]) 
  #into a holding variable, "a"
  
  #We shall now regularise the features$variable[l] into human-readable variable names
  #and then pass these into the names of Z, which are the extracted values
  #The first two names of assignmentThree have to remain unchanged as they point to the subjects and Activity
  
  #To do this, we shall employ gsub to replace patterns:   "[(][)]" becomes ""            (human-readable text, remove "()")
  #To do this, we shall employ gsub to replace patterns:   " " becomes ""                 (human-readable text, remove white space)
  #To do this, we shall employ gsub to replace patterns:   "//. " becomes ""              (human-readable text, remove periods)
  #To do this, we shall employ gsub to replace patterns:   "_" becomes ""                 (human-readable text, remove white space)
  
  #After that, we shall pass these names into the tolower() 
  #Remember to change a back into a factor, as the features list was originally a list of 477 factor variables
  
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
  
  #---------------------------------------------------------
  #Assignment 5:  From the data set in step 4, creates a second, independent tidy data set 
  #               with the average of each variable for each activity and each subject
  #---------------------------------------------------------  
  #There are 30 test subjects performing 6 different activities. 
  #Averaging the variables for each activity for each subject for each variable
  #would lead to a 180 x 68 data.frame
  
  #The rows would have each subject/activity combination and the coloumns would be each variable
  
  assignmentFive<-group_by(assignmentFour, subject, activity) %>% summarise_each(funs(mean))
  
  #---------------------------------------------------------
  #Generate output .txt files in tab-delimited format
  #---------------------------------------------------------   
  #Take note that the output files have headers, so in using read.table("filename.txt",header=T)
  write.table(assignmentOne,file="./assignmentOne.txt",row.name=F,sep="\t")
  write.table(assignmentTwo,file="./assignmentTwo.txt",row.name=F,sep="\t")
  write.table(assignmentThree,file="./assignmentThree.txt",row.name=F,sep="\t")
  write.table(assignmentFour,file="./assignmentFour.txt",row.name=F,sep="\t")
  write.table(assignmentFive,file="./assignmentFive.txt",row.name=F,sep="\t")  
}
