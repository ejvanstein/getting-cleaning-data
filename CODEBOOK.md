## Code book

This code book describes the data used in this project and all the variables and summaries calculated and any other relevant information.

### Overview

See also http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip for input data.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### Input files (see also  `README.txt` and `features_info.txt`)

* `features.txt`: List of all features. See also `features_info.txt`.
* `X_train.txt`: Training set.
* `y_train.txt`: Training labels. See also `activity_labels.txt`.
* `X_test.txt`: Test set.
* `y_test.txt`: Test labels. See also `activity_labels.txt`.
* `subject_test.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* `subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

### Processing steps

1. Data was read in from txt files.
2. Descriptive labels were added.
3. Data was merged.
4. Only SubjectID, Activity and mean and std columns were kept.
5. Descriptive activity names were added.
6. Mean per subject/activity was calculated.
7. Outcome was saved as `tidy.txt`.

### Output (`tidy.txt`)
* Contains 180 rows: 30 subjects (identified by SubjectID) and per subject 6 activities (Activity column).
* Columns tBodyAcc-mean()-X through fBodyBodyGyroJerkMag-std() (66 columns) contain the means for those variables from the input data sets.
