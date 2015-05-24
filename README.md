
==================================================================
Data related to Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

=========================================

The script *run_analysis.R* performs the 5 steps described in the course project's definition.

The *Readme.md* file has overview of the data and what has been performed in this project

The *codebook.md* has the variables and the packages used in this project

The *tidy_dat2.txt* has the final tidy data


The test and train data are merged using the cbind() and rbind() functions. Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.
Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). 
The output file is called tidy_dat2.txt, and uploaded to this repository.
