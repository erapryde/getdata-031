#List of raw, interim, generated and transformed variables<br>

|               |   CodeBook             |  Mode  |  Class       |  dim() or length()  |  Source         |  Remarks  |
|:-------------:|:---------------------: |:------:|:------------:|:-------------------:|:---------------:|-----------|
|**Raw**        |`features`              |  list  |  data.frame  |  561 x 2            | *features.txt*  |  *features* holds the names of measured variables in its $variable attribute |
|               |`activityLabels`        |  list  |  data.frame  |  dim() or length()  |  Source  |  Remarks  |
|**Generated**  |`xTrain`                |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`xTest`                 |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`yTrain`                |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`yTest`                 |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  | 
|               |`subjectTrain`          |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`subjectTest`           |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|**Transformed**|`X`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`y`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`subject`               |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|**Recoded**    |`Activity`              |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`subject` (overwritten) |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|**Extracted**  |`l1`                    |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`l2`                    |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`l`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`Z`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|**Holder**     |`k`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`a`                     |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|**Submissions**|`assignmentOne`         |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`assignmentTwo`         |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`assignmentThree`       |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`assignmentFour`        |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|               |`assignmentFive`        |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |




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
