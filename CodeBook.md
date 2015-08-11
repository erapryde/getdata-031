#List of generated variables<br>




|   CodeBook             |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|:---------------------: |--------|---------|---------------------|----------|-----------|
| **Raw Variable names** |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`features`              |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |
|`activityLabels`        |  Mode  |  Class  |  dim() or length()  |  Source  |  Remarks  |



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
