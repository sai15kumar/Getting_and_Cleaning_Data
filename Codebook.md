##Brief
The script run_analysis.R performs the described 5 steps of the course project's definition.
•	Merge all the similar data using the rbind() function. Similarly merge address of those files having the same number of columns and referring to the same entities.
•	Then extract only those columns with the mean and standard deviation measures from the whole dataset. After extracting these columns, they are given the correct names from features.txt.
•	As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
•	On the whole dataset, those columns with vague column names are corrected.
•	Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called averages_data.txt, and uploaded to this repository.

##Variables
•	xtrain, ytrain, xtest, ytest, subject_train and subject_test contain the data from the downloaded files.
•	xdata, ydata and subject_data merge the previous datasets to further analysis.
•	features contains the correct names for the xdata dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
•	A similar approach is taken with activity names through the activities variable.
•	all_data merges xdata, ydata and subject_data in a big dataset.
•	Finally, averages_data contains the relevant averages which is later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
