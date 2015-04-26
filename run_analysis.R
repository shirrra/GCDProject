# download the zip file
# urlSmartphones <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# temp <- tempfile()
# download.file(urlSmartphones, temp)
# unzip(temp)
# unlink(tmp)

# read features list
features <- read.table("UCI HAR Dataset//features.txt")
features <- features$V2
activityLabels <- read.table("UCI HAR Dataset//activity_labels.txt")
activityLabels <- activityLabels$V2

# read  train data
subjectTrain <- read.table("UCI HAR Dataset//train//subject_train.txt",col.names='subject')
XTrain <- read.table("UCI HAR Dataset//train//X_train.txt", col.names=features)
yTrain <- read.table("UCI HAR Dataset//train//y_train.txt", col.names='activity')
trainDT <- cbind(activity=activityLabels[yTrain$activity], XTrain)
trainDT <- cbind(subjectTrain, trainDT)

# read test data 
subjectTest <- read.table("UCI HAR Dataset//test//subject_test.txt",col.names='subject')
XTest <- read.table("UCI HAR Dataset//test//X_test.txt", col.names=features)
yTest <- read.table("UCI HAR Dataset//test//y_test.txt", col.names='activity')
testDT <- cbind(activity=activityLabels[yTest$activity], XTest)
testDT <- cbind(subjectTest, testDT)

# merge both data sets
allDT <- rbind(trainDT,testDT)

# extract only measurements on the mean and std of each measurement
myFeatures <- grep("mean|std", names(allDT)) 
meanStdDT <- select(allDT, myFeatures)
# write the tidy data into a file
# filen <- "meanStdData.txt"
# write.table(meanStdDT, filen, row.name=F)

# find the average of each variable for each subject+activity
spl <- split(meanStdDT, list(allDT$activity, allDT$subject))
avgDT <- sapply(spl, colMeans, na.rm=T)
avgDT <- t(avgDT)
# write the tidy data into a file
filen <- "avgMeanStdDate.txt"
write.table(avgDT, filen, row.name=F)
