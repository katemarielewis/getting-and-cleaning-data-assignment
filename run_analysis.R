#read files
setwd("C:/Users/kate/Documents/datascience/coursera")
subjecttest<-read.table("C:/Users/kate/Documents/datascience/coursera/subject_test.txt")
xtest<-read.table("C:/Users/kate/Documents/datascience/coursera/X_test.txt")
ytest<-read.table("C:/Users/kate/Documents/datascience/coursera/y_test.txt")
subjecttrain<-read.table("C:/Users/kate/Documents/datascience/coursera/subject_train.txt")
xtrain<-read.table("C:/Users/kate/Documents/datascience/coursera/X_train.txt")
ytrain<-read.table("C:/Users/kate/Documents/datascience/coursera/y_train.txt")
features<-read.table("C:/Users/kate/Documents/datascience/coursera/features.txt")

#Merges the training and the test sets to create one data set
dataset<-rbind(xtest, xtrain)

#Extracts only the measurements on the mean and standard deviation for each measurement.
colnames(dataset)<-features[,2]
meandata<-names(dataset)[grep("mean", names(dataset))]
stddata<-names(dataset)[grep("std", names(dataset))]
datasub<-dataset[,c(meandata, stddata)]

#Uses descriptive activity names to name the activities in the data set
dataactivity<-rbind(ytest, ytrain)
colnames(dataactivity)<-"activitynum"
dataactivity$activity <- "walking"
dataactivity$activity[dataactivity$activitynum==2]<-"walkingupstairs"
dataactivity$activity[dataactivity$activitynum==3]<-"walkingdownstairs"
dataactivity$activity[dataactivity$activitynum==4]<-"sitting"
dataactivity$activity[dataactivity$activitynum==5]<-"standing"
dataactivity$activity[dataactivity$activitynum==6]<-"laying"
datasub$activity<-dataactivity$activity

#Appropriately labels the data set with descriptive variable names. 
shortname<-c("-X", "-Y", "-Z", "Acc", "Gyro", "tBody", "tGravity", "fBody", "fGravity", "Jerk", "Mag", "mean()", "std()", "meanFreq()", "fBodyBody")
descriptname<-c("xaxis", "yaxis", "zaxis", "accelerometer", "gyroscope", "timedomainbody", "timedomaingravity", "frequencydomainbody", "frequencydomaingravity", "jerk", "magnitude", "mean", "standarddeviation", "meanfrequency", "frequencydomainbodybody")
names<-colnames(datasub)
rename<-function(names, shortname, descriptname){
  namelist<-list()
  for (i in 1:length(names)){
    rename<-""
    for (index in 1:length(shortname)){
      if ((grepl(shortname[index], names[i]))==TRUE){
        rename<-c(rename, descriptname[index])
      }
    }
    rename<-paste(rename, collapse="")
    namelist<-c(namelist, rename)
  }
  return(namelist)
}

listofcolnames<-rename(names, shortname, descriptname)

datanamed<-datasub
listofcolnames[80]<-"activity"
colnames(datanamed)<-listofcolnames


#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
datasubject<-rbind(subjecttest, subjecttrain)
dataall<-cbind(datasubject, datanamed)
colnames(dataall)[1]<-"subject"
tidymeans<-aggregate(. ~ activity + subject, data = dataall, FUN = mean)
write.table(tidymeans, "C:/Users/kate/Documents/datascience/coursera/tidymeans.txt")
