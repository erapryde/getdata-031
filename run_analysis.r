run_analysis <- function(){
  #Setting directory
  #setwd("C:/Users/Admin/Dropbox/Coursera/20150803 Getting and Cleaning Data")
  #install.packages("dplyr")
  library(dplyr) #dplyr
  
  #setwd("./UCI HAR Dataset")
  #Pre-amble: Reading in Data Labels
  activity_labels<-read.table("activity_labels.txt",col.names=c("Label","Activity"))
  features<-read.table("features.txt",col.names=c("Label","variable"))
  #Reading training data
  setwd("./train")
  subject_train<-read.table("subject_train.txt",col.names="subject")
  X_train<-read.table("X_train.txt")
  y_train<-read.table("y_train.txt",col.names="Training label")
  #Reading test data  
  setwd("../")
  setwd("./test")
  subject_test<-read.table("subject_test.txt",col.names="subject")
  X_test<-read.table("X_test.txt")
  y_test<-read.table("y_test.txt",col.names="Training label")
  setwd("../")

#Assignment 1: Merges the training and the test sets to create one data set.
  X<-rbind(X_train,X_test) #Merged Data
  names(X)<-features[,2]
  y<-rbind(y_train,y_test) #1-6, Activity type
  subject<-rbind(subject_train,subject_test) #1-30, person doing activity
  #Recode the activity types into meaningful descriptions, k, factor with 6 levels
  k <- vector(length = dim(y)[1],mode="character")
  for (i in 1:dim(y)[1]){
    for (j in 1:6){
      if (y[i,1]==j){
        k[i]<-as.character(activity_labels[j,2])
      }
    }
  }
  Activity<-as.factor(k)
  #Recode the subjects into factors with 30 levels
  y <- vector(length = dim(y)[1],mode="character")
  for (i in 1:length(y)) {
    y[i] = paste("Test Subject",subject[i,1],sep=" ")
  }
  subject<- as.factor(y)
  assignmentOne<-cbind(subject,Activity,X)  

#Assignment 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
  #Note that meanFreq is a measurement, and not the 
  l1<-grep("mean[(][)]",features$variable,ignore.case=T,value=F) #regular expressions, returns vector of columns with means
  l2<-grep("std[(][)]",features$variable,ignore.case=T,value=F) #regular expressions, returns vector of columns with std
  l<-c(l1,l2) #merges all columns to be read
  Z<-X[,l] #extract columns
  assignmentTwo<-cbind(subject,Activity,Z)
  
#Assignment 3: Uses descriptive activity names to name the activities in the data set
  #This was already done in the preprocessing of the Activity labels and subjects


#Assignment 4: Appropriately labels the data set with descriptive variable names. 
  assignmentFour<-group_by(assignmentTwo, subject, Activity) %>% summarise_each(funs(mean))
  names(assignmentFour)[3:dim(assignmentFour)[2]] <- tolower(features[l,2])

#write files results
write.table(assignmentOne,file="./assignmentOne.txt",row.name=F,sep="\t")
write.table(assignmentTwo,file="./assignmentTwo.txt",row.name=F,sep="\t")
write.table(assignmentTwo,file="./assignmentThree.txt",row.name=F,sep="\t")
write.table(assignmentFour,file="./assignmentFour.txt",row.name=F,sep="\t")
}
