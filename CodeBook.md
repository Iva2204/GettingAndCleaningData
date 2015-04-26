This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

#The data source

The original data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
And the full description of the dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#The dataset information
Information that follows was taken from the dataset description link above:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern. 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

#About the original data
After downloading the dataset you will have a zip file on your computer named "getdata-projectfiles-UCI HAR Dataset.zip" and after unzziping this file the dataset for analysis will be stored in a folder "UCI HAR Dataset"

This folder contains the following files:
*'README.txt'
*'features_info.txt': Shows information about the variables used on the feature vector.
*'features.txt': List of all features.
*'activity_labels.txt': Links the class labels with their activity name.
*'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
*'train/X_train.txt': Training set.
*'train/y_train.txt': Training labels.
*'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
*'test/X_test.txt': Test set.
*'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.
*'Inertial Signals/total_acc_x_train.txt (and './total_acc_y_train.txt' and './total_acc_z_train.txt')': The acceleration signal from the smartphone accelerometer X (and Y and Z) axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
*'Inertial Signals/body_acc_x_train.txt' (and './body_acc_y_train.txt' and './body_acc_z_train.txt'): The body acceleration signal obtained by subtracting the gravity from the total acceleration.
*'Inertial Signals/body_gyro_x_train.txt' (and './body_gyro_y_train.txt' and './body_gyro_z_train.txt'): The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

All of the features are normalized and bounded within [-1,1] and each feature vector is a row on the text file.

#Work performed on the dataset

The assignment consisted of the following:
You should create one R script called run_analysis.R that does the following.:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Result of the second step gives us a reduced dataset containing only variables that are calculated mean or standard deviation of original measurement.
The result of of the assignment is a data table containing calculated mean of the 82 selected variables grouped by each activity and each subject:
(note: the prefix 't' indicates time domain and the prefix 'f' indicates frequency domain)
*"subject": the subject who performed the activity for each window sample. Numeric variable in range from 1 to 30.
*"tbodyaccmeanx", "tbodyaccmeany", "tbodyaccmeanz", "fbodyaccmeanx", "fbodyaccmeany", "fbodyaccmeanz": calculated mean value for the body acceleration signals for 3-axial signals in the X, Y and Z directions. Expressed in standard gravity units 'g'.
*"tbodyaccstdx", "tbodyaccstdy", "tbodyaccstdz", "fbodyaccstdx", "fbodyaccstdy", "fbodyaccstdz": calculated std value for the body acceleration signals for 3-axial signals in the X, Y and Z directions. Expressed in standard gravity units 'g'.
*"tgravityaccmeanx", "tgravityaccmeany" "tgravityaccmeanz": calculated mean value for the gravity acceleration signals for 3-axial signals in the X, Y and Z directions. Expressed in standard gravity units 'g'.
*"tgravityaccstdx", "tgravityaccstdy", "tgravityaccstdz": calculated std value for the gravity acceleration signals for 3-axial signals in the X, Y and Z directions. Expressed in standard gravity units 'g'.
*"tbodyaccjerkmeanx", "tbodyaccjerkmeany", "tbodyaccjerkmeanz": calculated mean value of the body jerk signal for 3-axial signals in the X, Y and Z directions. Expressed in standard gravity units 'g'.
*"tbodyaccjerkstdx", "tbodyaccjerkstdy", "tbodyaccjerkstdz": calculated std value of the body jerk signal for 3-axial signals in the X, Y and Z directions. Expressed in standard gravity units 'g'.
*"tbodygyromeanx", "tbodygyromeany", "tbodygyromeanz", "fbodygyromeanx", "fbodygyromeany", "fbodygyromeanz": calculated mean value of the angular velocity vector measured by the gyroscope for each window sample for 3-axial signals in the X, Y and Z directions. The units are radians/second.
*"tbodygyrostdx", "tbodygyrostdy", "tbodygyrostdz", "fbodygyrostdx", "fbodygyrostdy", "fbodygyrostdz": calculated std value of the angular velocity vector measured by the gyroscope for each window sample for 3-axial signals in the X, Y and Z directions. The units are radians/second.
*"tbodygyrojerkmeanx", "tbodygyrojerkmeany", "tbodygyrojerkmeanz": calculated mean value of the jerk signal measured by the gyroscope for each window sample for 3-axial signals in the X, Y and Z directions. The units are radians/second. 
*"tbodygyrojerkstdx", "tbodygyrojerkstdy", "tbodygyrojerkstdz": calculated std value of the jerk signal measured by the gyroscope for each window sample for 3-axial signals in the X, Y and Z directions. The units are radians/second.
*"tbodyaccmagmean", "tbodyaccmagstd": calculated mean and std values for the magnitude of body acceleration. Expressed in standard gravity units 'g'.
*"tgravityaccmagmean", "tgravityaccmagstd": calculated mean and std values for the magnitude of the gravity acceleration. Expressed in standard gravity units 'g'.
*"tbodyaccjerkmagmean", "tbodyaccjerkmagstd": calculated mean and std values for the magnitude of body jerk signal. Expressed in standard gravity units 'g'.
*"tbodygyromagmean", "tbodygyromagstd": calculated mean and std values of the magnitude of the angular velocity vector measured by the gyroscope. The units are radians/second.
*"tbodygyrojerkmagmean", "tbodygyrojerkmagstd": calculated mean and std values of the magnitude of the jerk signal measured by the gyroscope. The units are radians/second.
*"fbodyaccmeanfreqx", "fbodyaccmeanfreqy", "fbodyaccmeanfreqz": calculated mean frequency value of body acceleration signals for 3-axial signals in the X, Y and Z directions. Units are Hz.
*"fbodyaccjerkmeanx", "fbodyaccjerkmeany", "fbodyaccjerkmeanz": calculated mean frequency value of body jerk signals for 3-axial signals in the X, Y and Z directions. Units are Hz.
*"fbodyaccjerkstdx", "fbodyaccjerkstdy", "fbodyaccjerkstdz": calculated frequency std value of body jerk signals for 3-axial signals in the X, Y and Z directions. Units are Hz.
*"fbodyaccjerkmeanfreqx", "fbodyaccjerkmeanfreqy", "fbodyaccjerkmeanfreqz": calculated mean frequency value of body acceleration and jerk signals for 3-axial signals in the X, Y and Z directions. Units are Hz.
*"fbodygyromeanfreqx" "fbodygyromeanfreqy" "fbodygyromeanfreqz": calculated mean frequency value of the angular velocity vector measured by the gyroscope for 3-axial signals in the X, Y and Z directions. Units are Hz. 
*"fbodyaccmagmean", "fbodyaccmagstd": calculated mean and std of body acceleration magnitude. 
*"fbodyaccmagmeanfreq": calculated mean frequency of body acceleration magnitude.  Units are Hz.
*"fbodybodyaccjerkmagmean" "fbodybodyaccjerkmagstd": calculated mean and std of body jerk magnitude. 
*"fbodybodyaccjerkmagmeanfreq": calculated mean frequency of body jerk magnitude. Units are Hz. 
*"fbodybodygyromagmean" "fbodybodygyromagstd": calculated mean and std of the angular velocity vector magnitude measured by the gyroscope. The units are radians/second.
*"fbodybodygyromagmeanfreq": calculated mean frequency of the angular velocity vector magnitude. Units are Hz.
*"fbodybodygyrojerkmagmean" "fbodybodygyrojerkmagstd": calculated mean and std of the jerk signal magnitude measured by the gyroscope. The units are radians/second.
*"fbodybodygyrojerkmagmeanfreq": calculated mean frequency of the jerk signal magnitude measured by the gyroscope. Units are Hz.
*"activityid": ID of the activity read from the file 'activity_labels.txt'. Numeric variable in range from 1 to 6.
*"activitylabel": the label of the activity corresponding to the activity ID in the previous variable. This is a factor variable of six levels: WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING
, LAYING

