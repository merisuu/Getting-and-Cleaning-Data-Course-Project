## Loading packages.

library(dplyr)


## Import datasets.

features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features[,2])
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")


## 1. Merge the training and the test sets to create one data set.

x_fulldata <- rbind(X_test, X_train)
y_fulldata <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)
merged_data <- cbind(subject, y_fulldata, x_fulldata)


## 2. Extract the mean and standard deviation for each measurement.

selected_data <- merged_data %>% 
  select(Subject, Activity, contains("mean"), contains("std"))


## 3. Use descriptive activity names to name the activities in the data set.

selected_data$Activity <- activity_labels[selected_data$Activity, 2]


## 4. Label the data set with descriptive variable names.

names(selected_data) <- gsub("\\.+$", "", names(selected_data))
names(selected_data) <- gsub("\\.+", "_", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data)) 
names(selected_data) <- gsub("mean", "Mean", names(selected_data))
names(selected_data) <- gsub("std", "STD", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("std", "STD", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("Freq", "Frequency", names(selected_data))
names(selected_data) <- gsub("angle", "Angle", names(selected_data))
names(selected_data) <- gsub("gravity", "Gravity", names(selected_data))
names(selected_data) <- gsub("_t", "_Time", names(selected_data))
names(selected_data) <- gsub("^t", "Time", names(selected_data)) 
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))


## 5. From the data set in step 4, create a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

selected_data_sum <- selected_data %>%
                    group_by(Activity, Subject) %>%
                    summarize_all(mean)

write.table(selected_data_sum, "selected_data_sum.txt", row.names = FALSE)                    

