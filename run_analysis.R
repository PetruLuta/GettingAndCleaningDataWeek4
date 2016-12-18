## Getting and cleaning data Week 4 assignment

# Create folder and set working directory
if (!file.exists("Week4assignment")) {
    dir.create("Week4assignment")
}
setwd("./Week4assignment")

# Download file and unzip data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "rawdata.zip")
unzip("rawdata.zip")

# Read required data and merge them to create one data set
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
trainobs <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
testobs <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
observations <- rbind(trainobs, testobs)
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
testact <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
activities <- rbind(trainact, testact)
trainsubj <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
testsubj <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subjects <- rbind(trainsubj, testsubj)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(activity_labels) <- c("id", "label")
rawData <- cbind(subjects, activities, observations)

# Use descriptive variable names
colnames(rawData) <- c("Subject", "Activity", as.vector(features$V2))

# Extract only measurements on the mean and standard deviation
toMatch <- c("Subject", "Activity", "\\bmean()\\b", "std()")
matches <- unique (grep(paste(toMatch,collapse="|"), colnames(rawData), value=TRUE))
selectData<-rawData[matches]

# Remove unneded objects
rm("testact", "testobs", "testsubj", "trainact", "trainobs", "trainsubj", "activities", "features", "observations", "subjects", "toMatch", "matches")

# Use descriptive activiy names
selectData$Activity<-activity_labels[selectData$Activity, "label"]

# Create an independent data set with the average of each variable for each
# activity and each subject
tidyData<-aggregate(selectData[,3:68], list(selectData$Activity, selectData$Subject), mean)
colnames(tidyData)[1:2]<-c("Activity","Subject")
write.table(tidyData, "tidyData.csv", sep = ",")
