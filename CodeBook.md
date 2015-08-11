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
|`subject` (overwritten) |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`l1`                    |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`l2`                    |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`l`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`Z`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`k`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`a`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`assignmentOne`         |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`assignmentTwo`         |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`assignmentThree`       |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`assignmentFour`        |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`assignmentFive`        |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |




---
###Raw variable names, left unchanged out of respect for the data's source
---
**features** <- This holds the *561* names of the variables that were measured by reading in features.txt. Its attributes are c(*labels* and *variable*).<br>
**activityLabels** <- This holds the 6 codes which map y_train and y_test into sensible activity and consists of 6 levels which are *WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING AND LAYING*.<br><br>

---
###Generated variables from reading the data files
---
**xTrain** <- a list made by reading X_train, it holds *7352 observations of 561* normalised, numeric variables<br>
**yTrain** <- a list made by reading y_train, it holds the *7352* activities that were occuring when measurements in xTrain were taken.<br>
**subjectTrain** <- a list made by reading subject_train, it holds the identifier of the **Test Subject** of whom the measurements in xTrain were taken.<br>

**xTest** <- a list made by reading X_test, it holds *2947 observations of 561* normalised, numeric variables<br>
**yTest** <- a list made by reading y_test, it holds the *2947* activities that were occuring when measurements in xTest were taken.<br>
**subjectTest** <- a list made by reading subject_test, it holds the identifier of the **Test Subject** of whom the measurements in xTest were taken.<br>

---
###Transformed variables, by rbind, cbind, recoding as well as subsetting
---
X
y
subject

Activity
subject

Z

assignmentOne
assignmentTwo
assignmentThree
assignmentFour
