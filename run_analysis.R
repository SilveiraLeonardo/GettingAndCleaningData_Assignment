#################
# PEER-GRADED ASSIGNMENT
# Getting and Clieaning data

# the requirements of the project are
# 1 - a tidy dataset
# 2 - a link to github with your script for performing the analysis
# 3 - a codebook that describes the variables, the data, and any transformation or work you performed to clean up the data - called CodeBook.md
# 4 - a README.md in the repo with your scripts - explaining how the scripts work and how they are connected

# TIDY DATASET
# 1 - Each variable forms a column
# 2 - Each observation forms a row
# 3 - Each type of observational unit forms a table

library(dplyr)

# reading data

# reading features and activity labels
features <- read.table("features.txt", col.names = c("n","features"))
activity_label <- read.table("activity_labels.txt", col.names = c("label", "activity"))

# reading data from the test sample
xtest <- read.table("./test/X_test.txt", header = FALSE, col.names = features$features)
ytest <- read.table("./test/y_test.txt", header = FALSE, col.names = "label")
test_subject <- read.table("./test/subject_test.txt", col.names = "subject")

# reading data from the train sample
xtrain <- read.table("./train/X_train.txt", header = FALSE, col.names = features$features)
ytrain <- read.table("./train/y_train.txt", header = FALSE, col.names = "label")
train_subject <- read.table("./train/subject_train.txt", col.names = "subject")


# PART 1
# merging the training and testing datasets to create one comprehensive data set

# first we bind the rows of the test and training subjects
subject <- rbind(test_subject, train_subject)
# now we bind the rows of the test and training labels
label <- rbind(ytest, ytrain)
# and now we bind the rows of the test and training experimental data
x <- rbind(xtest, xtrain)

# merging the data: subject, label and x
complete <- cbind(subject, label, x)

#### Now our training and testing datasets are merged together in the complete dataset

# PART 2
# Select only the measurements of the mean and standard deviation for each measurement.
# we use the function select in combination with the function contains to get only the columns with the string "mean" and "std"
data_tidy <- select(complete, subject, label, contains("mean"), contains("std"))

# PART 3
# Uses descriptive activity names to name the activities in the data set
# we get the labels from the data fram activity_label to substitute the respective index in the data_tidy dataset
data_tidy$label <- activity_label[data_tidy$label, 2]

#renaming the column "label" to "Activity, and "subject" to "SubjectID"
data_tidy <- rename(data_tidy, Activity = label)
data_tidy <- rename(data_tidy, SubjectID = subject)

# PART 4
# Appropriately labels the data set with descriptive variable names
# we will change the abbreviations we identified by the complete names

names(data_tidy)<-gsub("Acc", "Accelerometer", names(data_tidy))
names(data_tidy)<-gsub("Gyro", "Gyroscope", names(data_tidy))
names(data_tidy)<-gsub("BodyBody", "Body", names(data_tidy))
names(data_tidy)<-gsub("Mag", "Magnitude", names(data_tidy))
names(data_tidy)<-gsub("^t", "Time", names(data_tidy))
names(data_tidy)<-gsub("^f", "Frequency", names(data_tidy))
names(data_tidy)<-gsub("tBody", "TimeBody", names(data_tidy))

# PART 5
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# First we group our data by Activity and SubjectID
data_grouped <- group_by(data_tidy, Activity, SubjectID)
# Now we summarize this data by the groups we just created and take the mean of their values
data_summarised <- summarise_all(data_grouped, mean)

# Writing in a txt file the data from part 5
write.table(data_summarised, file = "Step5_tidy.txt", row.names = FALSE)
