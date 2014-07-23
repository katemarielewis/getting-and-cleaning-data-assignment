---
README: Mean values by activity and subject for mean and standard deviation variables from the Human Activity Recognition Using Smartphones Dataset
---
All the related files:
"CodeBook.MD"
"run_analysis.R"
"subject_test.txt"
"X_test.txt"
"y_test.txt"
"subject_train.txt"
"X_train.txt"
"y_train.txt"
"features.txt"

Instructions on how to use the script:
The "run_analysis.R" script requires all of the related files to be located within the working directory. If this is the case, then the script with perform the functions described below when it is run in R.

Description of what the script will do:
the script "run_analysis.R" is used to open the files associated with the original Human Activity Recognition Using Smartphones Dataset. Then:
-Merges the training and the test sets to create one data set.
-Extracts only the measurements on the mean and standard deviation for each measurement. 
-Uses descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names. 
-Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

General description of the raw data and it's source: 
This discription is an exerpt from the readme file for the raw data:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.