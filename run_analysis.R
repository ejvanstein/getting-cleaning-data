# set location of input/output
setwd("C:/Users/Edwin van Stein/Desktop/Edwin")

# read in data
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")
featureNames <- read.table("features.txt")

# add SubjectID as variable name
names(subject_train) <- "SubjectID"
names(subject_test) <- "SubjectID"

# add Activity as variable name
names(y_train) <- "Activity"
names(y_test) <- "Activity"

# add other variable names
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# merge the data
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)

# only keep SubjectID, Activity and mean and std columns
keepcols <- grepl("mean\\(\\)", names(combined)) |  grepl("std\\(\\)", names(combined))
keepcols[1:2] <- TRUE
combined <- combined[, keepcols]

# add descriptive activity names
combined$Activity <- factor(combined$Activity, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# load reshape2 package (for melt and dcast functions)
library(reshape2)

# keep one record per subject/activity with mean value per variable
melt <- melt(combined, id=c("SubjectID","Activity"))
tidy <- dcast(melt, SubjectID+Activity ~ variable, mean)

# save tidy.csv
write.csv(tidy, "tidy.txt", row.names=FALSE)
