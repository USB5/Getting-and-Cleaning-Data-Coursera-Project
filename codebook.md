This codebook explains all the variable names and transformations in run_analysis.R
##Variables:
* features, XTrain, YTrain, SubTrain, XTest, YTest, SubTest and activity contain data from the downloaded and unzipped txt files
* train and test contain the training and test data respectively merged into a data set.
* totalData consists on train and test data sets merged together
* colnames is a vector of column names in totalData 
* WantedCols is a logical vector that is used to subset the rows containing the mean or std dev values
* MeanStd is a data set of only those columns from totalData which contain mean or std dev values for all activity and subjectid
* FinalData1 is a tidy data set where the MeanStd data set is modified to have proper activityType
* FinalData2 is a tidy data set with the average of each variable for each activity and each subject.


##Transformations:
1. If the data is not already present in the working directory, the R script downloads and unzips the data set in proj folder.
2. Loads the training, tests, and feature data sets
3. Combines the test(x_test.txt), activity(y_test.txt) and subject(subject.txt) text files to create one data set called test for testing data. 
4. Repeats the task for training dataset as well.
5. Merges testing and training data into a single data set called totalData
6. Filters this merged dataset to keep columns containing mean or std dev values. The data set thus obtained is called MeanStd
7. Loads the activity data for the dataset in FinalData1. This data set is saved as FinalData1.txt
8. Creates a tidy dataset that consists of the mean value of each variable for each subject and activity pair in FinalData2. This data set is saved as FinalData2.txt
