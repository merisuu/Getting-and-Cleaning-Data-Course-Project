{\rtf1\ansi\ansicpg1252\cocoartf2708
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fswiss\fcharset0 Helvetica-Bold;\f2\fnil\fcharset0 HelveticaNeue;
\f3\fnil\fcharset0 HelveticaNeue-Bold;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red0\green0\blue0;\red38\green38\blue38;
\red24\green24\blue24;\red255\green255\blue255;\red24\green24\blue24;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\csgray\c0\c0;\cssrgb\c20000\c20000\c20000;
\cssrgb\c12157\c12157\c12157;\cssrgb\c100000\c100000\c100000;\cssrgb\c12157\c12157\c12157;}
\margl1440\margr1440\vieww26560\viewh17260\viewkind0
\deftab720
\pard\tx940\tx1440\pardeftab720\li1440\fi-1440\partightenfactor0

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 \
This \cf5 \cb6 \strokec5 a codebook that modifies and updates the available codebooks with the data provided by\cf7 \cb6 \outl0\strokewidth0  the\cf2 \cb3  \cf7 \cb6 \'94Getting and Cleaning Data Course\'94 for the course project.\cf2 \cb3 \outl0\strokewidth0 \strokec4 \
\pard\pardeftab720\sa200\partightenfactor0
\cf2 \

\f1\b 1. Load packages.
\f0\b0 \
	Package \'91dplyr\'92 is required to clean up the data.\cf7 \cb6 \outl0\strokewidth0 \
\cf2 \cb3 \outl0\strokewidth0 \strokec4 \

\f1\b 2. Download and import the data set.
\f0\b0 \
	The data was provided by the \cf7 \cb6 \outl0\strokewidth0 \'94Getting and Cleaning Data Course\'94.\
	All the data was imported to R and assigned to variables:\
		-  features: Variable used in the dataset.\
		-  activity_labels: Links the class labels with their activity name.\
		-  subject_test: Identifies the subject who performed the activity for test set. \
		-  X_test: Data for test set.\
		-  y_test: Test labels.\
		-  \cf7 subject_train: Identifies the subject who performed the activity for train set. \
\pard\pardeftab720\sa200\partightenfactor0
\cf7 		-  X_train: Data for test set.\
		-  y_train: Test labels.\cf2 \cb3 \outl0\strokewidth0 \strokec4 \
\

\f1\b 3. Merge the training and the test sets to create one data set.
\f0\b0 \
		-  x_fulldata: created by merging X_test and X_train using rbind() function.\
		-  \cf2 \cb3 \outl0\strokewidth0 y_fulldata: created by merging y_test and y_train using rbind() function.\
		-  subject: created by merging subject_test and subject_train using rbind() function.\
		-  merged_data: created by merging subject, y_fulldata and x_fulldata using cbind() function.\
\
\pard\pardeftab720\sa200\partightenfactor0

\f1\b \cf2 4. Extract the mean and standard deviation for each measurement.
\f0\b0 \
\pard\pardeftab720\sa200\partightenfactor0
\cf2 \cb3 \outl0\strokewidth0 \strokec4 		-  selected_data: created by selecting the following columns from merged_data using select() function:\
			Subject, Activity and the measurements containing the mean (\'93mean\'94) and the standard deviation (\'93std\'94).\
\

\f1\b 5. Use descriptive activity names to name the activities in the data set.
\f0\b0 \

\f2 	The numbers in the Activity column of selected_data were replaced with the corresponding activity according to the second column of activity_labels.\
\

\f3\b 6. Label the data set with descriptive variable names.
\f2\b0 \
		-  Periods were eliminated or replace for underscore.\
		-  Short names were replaced for the full word.\
		-  Every word was started with uppercase.\
\

\f3\b 7. From the data set in the previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject.
\f2\b0 \
		-  selected_data_sum: created by summarizing selected_data with the means of each variable after grouped by Activity and Subject.\
\
}