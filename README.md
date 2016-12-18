# Getting And Cleaning Data Week4 Programming assignment

This is the description of the steps performed in the run_analysis.R script file. All the transformations are performed on the dataset provided by the UCI Machine Learning Repository. This dataset represents the data collected from the accelerometers from the Samsung Galaxy S phone. All the work is done by one script in run_analysis.R file. This script was tested using R 3.3.1 and RStudio 0.99.903 on a Windows 10 x64 machine. No additional packages are required.
====================

1. Create and set the working directory.
2. Download the data from the provided URL and unzip files.
3. Read the training and test data regarding observations, subjects, activities, activity names and feature names.
4. Merge the data into one dataset called rawData using rbind and cbind functions.
5. Replace generic column names with descriptive variable names.
6. Extract only the observations on the mean and standard deviation, by matching mean() and std() in column names, and store them in a dataset called selectData.
   Note: this does not include observations on the weighted average of the frequency components (variable names that contain "meanFreq()") because these measurements are calculated using a different concept compared to the observations on mean value (variable names that contain "mean()").
7. Remove unneeded objects from previous steps.
8. Replace activity IDs with descriptive names.
9. Create an independent data set called tidyData with the average of each variable for each activity and each subject using aggregate function.
10. Export the tidy data in csv format.

=====================
The dataset obtained in step 9 has the wide form and respects the principles of tidy data:
 - Each variable is in one column.
 - Each different observation of that variable is in a different row. 

 

