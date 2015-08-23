setwd("e:/Data Scientist Course/R Files/UCI HAR Dataset")
library(plyr)

# Step 1 - Merge the training and test sets into one data set
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
xdata <- rbind(xtrain, xtest)

# create 'y' data set
ydata <- rbind(ytrain, ytest)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# Step 2 -Extract only the measurements on the mean and standard deviation for each measurement

features_data <- read.table("features.txt")

# get columns with mean() or std() as names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
xdata <- xdata[, mean_and_std_features]

# Change the column names
names(xdata) <- features_data[mean_and_std_features, 2]

# Step 3 - descriptive activity names to name the activities in the data set

activities_data <- read.table("activity_labels.txt")

# update values with correct activity names
ydata[, 1] <- activities_data[ydata[, 1], 2]

# correct column name
names(ydata) <- "activity"

# Step 4 - Appropriately label the data set with descriptive variable names

# Change column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(xdata, ydata, subject_data)

# Step 5 -Create a second, independent tidy data set with the average of each variable for each activity and each subject

# 66 to 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)