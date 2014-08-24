##Course Project
setwd("C:/Users/Juan/Documents/School/Coursera/Getting and Cleaning Data/Project")
##Load data sets
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt",header=F)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt",header=F)
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt",header=F)

xtest <- read.table("UCI HAR Dataset/test/X_test.txt",header=F)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt",header=F)
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt",header=F)

activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt",header=F)
colnames(activitylabels) <-c("activity","label")

#Combine all columns and rows (no column names yet)
xtest <- cbind(xtest,ytest,subjecttest)
xtrain <- cbind(xtrain,ytrain,subjecttrain)
xdata <- rbind(xtest,xtrain)

##Get column names and make them tidy
features <- read.table("UCI HAR Dataset/features.txt",header=F,skip=0)
features[,2]<- tolower(features[,2])
features[,2]<- gsub("-","",features[,2])
features[,2]<- gsub(")","",features[,2])
features[,2]<- gsub(",","",features[,2])
features[,2]<- gsub("\\(","",features[,2])
activitylabelsv <- c(562,"activity")
subjectv <- c(563, "subject")
features <- rbind(features,activitylabelsv,subjectv)
colnames(xdata) <- features$V2

##Merge labels
xdatamerged <- suppressWarnings(merge(xdata,activitylabels,by="activity",sort=F))

##Extract Mean and std columns
xdatameanstd <- xdatamerged[,c(563,564,grep("mean|std",colnames(xdatamerged)))]

##Get mean on columns by subject by activity label
xdatameans <- suppressWarnings(aggregate(xdatameanstd, by=list(label = xdatameanstd$label, subject=xdatameanstd$subject), mean, na.rm=T))
tidyxdata <- xdatameans[,-c(3,4)]

##Write Tidy data table
write.table(xdatameans, "tidymeans.txt", row.names=F)

