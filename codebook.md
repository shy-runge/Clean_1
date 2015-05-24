Introduction
The script run_analysis.R performs the 5 steps described in the course project's definition.

The test and train data are merged using the cbind() and rbind() functions. Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.
Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). 
The output file is called tidy_dat2.txt, and uploaded to this repository.

Variables
Xtrain, Ytrain, Xtest, Ytest, subjecttrain and subjecttest contain the data from the downloaded files.
They are merged for further analyis 
Finally, tiday_dat2 contains the relevant averages which will be later stored in a .txt file. 

Packages used
plyr
