library(dplyr)
#Download and unzip data
if(!file.exists("./proj"))
  {dir.create("./proj")}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./proj/Proj.zip")

if (!file.exists("UCI HAR Dataset")) { 
  unzip("./proj/Proj.zip", exdir="./proj") 
}

#Reading features matrix
features <- read.table('./proj/UCI HAR Dataset/features.txt')

#Reading training data sets and setting tppropriate column names
XTrain <- read.table("./proj/UCI HAR Dataset/train/X_train.txt")
colnames(XTrain) <- features[,2] #Column names for the x_train.txt data set is given by the feature names
YTrain <- read.table("./proj/UCI HAR Dataset/train/Y_train.txt")
colnames(YTrain)<-"activity"
SubTrain <- read.table("./proj/UCI HAR Dataset/train/subject_train.txt")
colnames(SubTrain)<-"subjectid"
#Merging training data into a single data set
train <- cbind(YTrain, SubTrain, XTrain)

#Reading testing data sets and setting tppropriate column names
XTest <- read.table("./proj/UCI HAR Dataset/test/X_test.txt")
colnames(XTest) <- features[,2]  #Column names for the x_test.txt data set is given by the feature names
YTest <- read.table("./proj/UCI HAR Dataset/test/y_test.txt")
colnames(YTest)<-"activity"
SubTest <- read.table("./proj/UCI HAR Dataset/test/subject_test.txt")
colnames(SubTest)<-"subjectid"
#Merging test data into a single data set
test <- cbind(YTest, SubTest, XTest)
#Merging training and test data into a single data set
totalData <- rbind(train, test)
#Extracting only the measurements on the mean and standard deviation for each measurement
colNames<-colnames(totalData)
WantedCols <- (grepl("activity" , colNames) | grepl("subjectid" , colNames) | grepl("mean" , colNames) | grepl("std" , colNames))
MeanStd <- totalData[ , WantedCols == TRUE] #Extracting only required columns
#Using descriptive activity names to name the activities in the data set
activity = read.table('./proj/UCI HAR Dataset/activity_labels.txt')
colnames(activity) <- c('activity','activityType')
FinalData1 <- merge(MeanStd, activity, by='activity', all.x=TRUE)
#creating a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData2 <- FinalData1 %>% group_by(activity,activityType,subjectid) %>% summarize_all(mean)
write.table(FinalData1, "FinalData1.txt", row.name=FALSE)
write.table(FinalData2, "FinalData2.txt", row.name=FALSE)




