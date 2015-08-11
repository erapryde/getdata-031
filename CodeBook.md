#List of raw, interim, generated and transformed variables<br>

|   CodeBook             |  Mode  |  Class       |  dim() or length()  |  Source         |  Remarks  |
|:---------------------: |:------:|:------------:|:-------------------:|:---------------:|-----------|
`features`              |  list  |  data.frame  |  561 x 2            | *features.txt*  |  *features* holds the names of measured variables in its $variable attribute |
|`activityLabels`        |  list  |  data.frame  |  6 x 2              |  *activity_labels.txt*  |  *activityLabels* holds the mapping of the numeric code in *y* to the activity type in 6 factor levels  |
|`xTrain`                |  list  |  data.frame  |  7352 x 561         |  *X_train.txt*  |  Training dataset holding normalised, numeric values of 561 measurements of 7352 combinations of subjects/activity |
|`xTest`                 |  list  |  data.frame  |  2947 x 561         |  *X_test.txt*  |  Test dataset holding normalised, numeric values of 561 measurements of 2947 combinations of subjects/activity |
|`yTrain`                |  list  |  data.frame  |  7352 x 1           |  *y_train.txt*  |  Training dataset holding activities taking place while xTrain was being measured. Needs to be recoded into factors  |
|`yTest`                 |  list  |  data.frame  |  2947 x 1           |  *y_test.txt*   |  Test dataset holding activities taking place while xTest was being measured. Needs to be recoded into factors  | 
|`subjectTrain`          |  list  |  data.frame  |  7352 x 1           |  *subject_train.txt*  |  Training dataset holding participant identity while xTrain was being measured. Needs to be recoded into factors  |
|`subjectTest`           |  list  |  data.frame  |  2947 x 1           |  *subject_test.txt*   |  Test dataset holding participant identity while xTest was being measured. Needs to be recoded into factors   |
|`X`                     | list   |  data.frame   |  10299 x 561  |  rbind(`xTrain`, `xTest`)  |  Merged datasets of `xTrain` and `xTest`  |
|`y`                     |  list  |  data.frame  |  10299 x 1 |  rbind(`yTrain`, `yTest`)  |  Merged datasets of `xTrain` and `xTest`, later to be used as a temporary holder and discarded in favour of the term **Activity**  |
|`subject`               |  numeric  |  factor  |  10299  |  rbind(`subjectTrain`,`subjectTest`) and then recoded as factors  |  Holds participant identity whil X was measured  |
|`Activity`              |  numeric  |  factor  |  10299  |  recoded y into factors using activityLabels  |  *LAYING*, *SITTING*, *STANDING*, *WALKING*, *WALKING_DOWNSTAIRS*, *WALKING_UPSTAIRS*  |
|`l1`                    |  numeric  |  integer  |  33  |  grep("mean[(][)]",features$variable,F,value=F)  |  indices of features that containt the word *"mean()"*  |
|`l2`                    |  numeric  |  integer  |  33   |  grep("std[(][)]",features$variable,F,value=F)   |  indices of features that containt the word *"std()"*  |
|`l`                     |  numeric  |  integer  |  66  |  c(`l1`,`l2)`  |  Overall container for indices of *"mean()"* and *"std()"*  |
|`Z`                     |  list  |  data.frame  |  10299 x 66  |  Extracted components from X  |  Contains only the means() and std() observations  |
|`k`                     |  char  |  char  |  10299  |  vector used to assist recoding of activityLabels into Activity  |  Remarks  |
|`a`                     |  numeric  |  factor  | 66  |  Recoded from features$variable[l]  to meet tidy data principles|  `a` is used subsequently as the names of `Z`  |
|`assignmentOne`         |  list  |  data.frame  |  10299 x 563  |  cbind(subject, y, X)  |  rudimentary merged set, has no column names  |
|`assignmentTwo`         | list  |  data.frame  |  10299 x 68  |  Extracted set containing *mean()* and *std()*  |  has no column names  |
|`assignmentThree`       |  list  |  data.frame  |  10299 x 68  |  Recoded participants and Activity into meaningful factor levels  |  column names still not implemented  |
|`assignmentFour`        |  list  |  data.frame  |  10299 x 68  |  Tidied up `features` and columns of `assignmentFour` appropraitely named  |    |
|`assignmentFive`        |  list  |  tbl  |  180 x 68  |  group_by(assignmentFour, subject, activity) %>% summarise_each(funs(mean))  |  Averaged each variable for each participant for each activity  |


