X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
dim(X_train)
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
dim(X_test)
X<-rbind(X_train,X_test)
dim(X)

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
dim(subject_train)
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
dim(subject_test)
subject<-rbind(subject_train,subject_test)
dim(subject)
names(subject)<-"subject"

y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
dim(y_train)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
dim(y_test)
y<-rbind(y_train,y_test)
dim(y)


features<-read.table("UCI HAR Dataset/features.txt")
dim(features)
features
meanind<-grep("mean\\(\\)",features[,2])
features[meanind,]
stdind<-grep("std\\(\\)",features[,2])
features[stdind,]
our_features<-features[c(meanind,stdind),]


activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
y_labels<-factor(y[,1],levels=activity_labels[,1],labels=activity_labels[,2])

data<-whole_data[,our_features[,1]]

descr_names<-sub("\\(\\)","",our_features[,2])
descr_names<-gsub("-","",descr_names)
descr_names<-sub("^t","time",descr_names)
descr_names<-sub("^f","freq",descr_names)
descr_names<-sub("mean","Mean",descr_names)
descr_names<-sub("std","Std",descr_names)
descr_names<-sub("BodyBody","Body",descr_names)
descr_names<-sub("Acc","Acceleration",descr_names)
descr_names<-sub("Gyro","Velocity",descr_names)
descr_names<-sub("Mag","Magnitude",descr_names)
names(data)<-descr_names

final_data<-aggregate(data,by=list(subject[,1],y_labels),FUN="mean")
names(final_data)[1:2]<-c("subject","activity")

write.table(final_data,file="tidydata.txt",row.names=FALSE )
