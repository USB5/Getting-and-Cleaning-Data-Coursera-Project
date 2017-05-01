# Getting-and-Cleaning-Data-Coursera-Project
This repository contains the files (R codes and codebook) for the John Hopkins' Getting and Cleaning Data course on Coursera.
The run_analysis.R takes care of the 5 objectives specified in the project description. The R scripts achieves the objectives by performing the following tasks:
1. If the data is not already present in the working directory, it downloads and unzips the data set.
2. Loads the training, tests, and feature data sets
3. Combines the test(x_test.txt), activity(y_test.txt) and subject(subject.txt) text files to create one data set for testing data. Repeats the task for training data as well.
4. Merges testing and training data into a single data set
5. Filters this merged dataset to keep columns containing mean or std dev values
6. Loads the activity data for the dataset. This data set is saved as FinalData1.txt
7. Creates a tidy dataset that consists of the mean value of each variable for each subject and activity pair. This data set is saved as FinalData2.txt
