library(dplyr)

#1. Merges the training and the test sets to create one data set.
#Create a single data set from the files in test and train folders of your data. 
#The "test" and "train" folders each have three .txt files and a directory. 
#You are to take the three .txt files from each of the "test" and "train" folders and 
#combine them into one, single data frame.
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
XTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
#3. Uses descriptive activity names to name the activities in the data set
#Apply the names given in "activity_labels.txt" to your merged data.
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
yTest[,2] <- activityLabels[yTest[,1],2]
names(yTest) <- c("ActivityID", "ActivityLabel")
names(subjectTest) <- "Subject"

subjectTrain <- read.table("UCI HAR Dataset/train//subject_train.txt")
XTrain <- read.table("UCI HAR Dataset/train//X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")

#3. Uses descriptive activity names to name the activities in the data set
#Apply the names given in "activity_labels.txt" to your merged data.
#activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
yTrain[,2] <- activityLabels[yTrain[,1],2]
names(yTrain) <- c("ActivityID", "ActivityLabel")
names(subjectTrain) <- "Subject"

subjectsTemp <- rbind(subjectTest, subjectTrain)
dataTemp <- rbind(XTest, XTrain)
actTemp <- rbind(yTest, yTrain)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Filter for column names that include strings "mean" and "std" and discard the rest.
featureNames <- read.table("UCI HAR Dataset//features.txt")
tempNamesMean <- subset(featureNames, grepl("mean", featureNames[,2]))
tempNamesSTD <- subset(featureNames, grepl("std", featureNames[,2]))
tempNames <- rbind(tempNamesMean, tempNamesSTD)

indicesMeanStd <- tempNames[order(tempNames[,1]),]

data4final <- dataTemp[, c(indicesMeanStd[,1])]

#4. Appropriately labels the data set with descriptive variable names. 
#The variable names you want are given in "features.txt"
names(data4final) <- indicesMeanStd[,2]

dataFinal <- cbind(subjectsTemp, data4final, actTemp)
names(dataFinal) <- gsub("(-|\\(|\\))", "", names(dataFinal))
names(dataFinal) <- tolower(names(dataFinal))
#5. From the data set in step 4, creates a second,:
#independent tidy data set with the average of each variable for each activity and each subject.
#tidyDataMean<-sapply(data4final,mean,na.rm=TRUE)
#tidyDataStd<-sapply(data4final,sd,na.rm=TRUE)

tidy <- aggregate(dataFinal, by=list(activity = dataFinal$activityid, subject=dataFinal$subject), mean, na.rm = TRUE)
tidy$activitylabel <- activityLabels[tidy$activityid,2]

write.table(tidy, "tidy.txt", sep="\t")