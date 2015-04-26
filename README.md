script works as follows:

1. reads the training and data sets and gives each meaningful headers using the 'features' file

2. replaces the activities code numbers into meaningful names according to the 'activity_labels' file

3. merges the training and the test sets to create one data set

4. extracts only the measurements on the mean and standard deviation for each measurement.
this means extracting only measurements whose name contains either the string 'mean' or the string 'std'

5. creates a second data set with the average of each variable for each activity and each subject

6. saves the data set defined in 5 to a file named "avgMeanStdDate.txt"
