# Code Book

This a codebook that modifies and updates the available codebooks with the data provided by the ”Getting and Cleaning Data Course” for the course project.

### **1. Load packages.** 
Package ‘dplyr’ is required to clean up the data.

### **2. Download and import the data set.**
The data was provided by the ”Getting and Cleaning Data Course”.
All the data was imported to R and assigned to variables:
-  features: Variable used in the dataset.
-  activity_labels: Links the class labels with their activity name.
-  subject_test: Identifies the subject who performed the activity for test set. 
-  X_test: Data for test set.
-  y_test: Test labels.
-  subject_train: Identifies the subject who performed the activity for train set. 
-  X_train: Data for test set.
-  y_train: Test labels.

### **3. Merge the training and the test sets to create one data set.**
-  x_fulldata: created by merging X_test and X_train using rbind() function.
-  y_fulldata: created by merging y_test and y_train using rbind() function.
-  subject: created by merging subject_test and subject_train using rbind() function.
-  merged_data: created by merging subject, y_fulldata and x_fulldata using cbind() function.

### **4. Extract the mean and standard deviation for each measurement.**
-  selected_data: created by selecting the following columns from merged_data using select() function:
   - Subject, Activity and the measurements containing the mean (“mean”) and the standard deviation (“std”).

### **5. Use descriptive activity names to name the activities in the data set.**
The numbers in the Activity column of selected_data were replaced with the corresponding activity according to the second column of activity_labels.

### **6. Label the data set with descriptive variable names.**
-  Periods were eliminated or replace for underscore.
-  Short names were replaced for the full word.
-  Every word was started with uppercase.

### **7. From the data set in the previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject.**
-  selected_data_sum: created by summarizing selected_data with the means of each variable after grouped by Activity and Subject.

