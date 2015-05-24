library(plyr)
Xtest<-read.table("test/X_test.txt",header=FALSE)
Ytest<-read.table("test/Y_test.txt",header=FALSE)

Xtrain<-read.table("train/X_train.txt",header=FALSE)
Ytrain<-read.table("train/Y_train.txt",header=FALSE)


subjecttest<-read.table("test/subject_test.txt",header=FALSE)
subjecttrain<-read.table("train/subject_train.txt",header=FALSE)
activity_labels<-read.table("activity_labels.txt",col.names = c("activity", "activityname"))

Test_combine<-cbind(Xtest,Ytest,subjecttest)
Train_combine<-cbind(Xtrain,Ytrain,subjecttrain)
test_train<-rbind(Test_combine,Train_combine)
features<-read.table("features.txt")
colnames(test_train)<-c(as.character(features$V2),"activity","subject") # features is stored as factor, needs to converted
a<-grep("-(mean|std|)\\(\\)",colnames(test_train))
features_req<-features$V2[a]
cols_req <- c(a, 562, 563) # need to add the subject and activity id
# seperate these columns from actual data
req_data<-test_train[,cols_req]

req_dat2 <- join(req_data, activity_labels, by = "activity", match = "first") #join the activity table with actua data (activity id replaced by activity itself)

# renaming abbreviation to proper descriptive names using gsub function. 

names(req_dat2)<-gsub("^t", "time", names(req_dat2))
names(req_dat2)<-gsub("^f", "frequency", names(req_dat2))
names(req_dat2)<-gsub("Acc", "Accelerometer", names(req_dat2))
names(req_dat2)<-gsub("Gyro", "Gyroscope", names(req_dat2))
names(req_dat2)<-gsub("Mag", "Magnitude", names(req_dat2))
names(req_dat2)<-gsub("BodyBody", "Body", names(req_dat2))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_dat2 = ddply(req_dat2, c("subject","activity"), numcolwise(mean))
write.table(tidy_dat2, file = "tidy_dat2.txt")