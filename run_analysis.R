run <- function(){
        #Import packages
        library(dplyr)
        
        ## store path 
        test <- "dataset/UCI HAR Dataset/test"
        train<- "dataset/UCI HAR Dataset/train"
        info <- "dataset/UCI HAR Dataset"
        
        ## read names; labels; features
        features <- read.table(
                paste(getwd(),info,"features.txt",sep = "/")
                ,header=FALSE);
        activityLabels <- read.table(
                paste(getwd(),info,"activity_labels.txt",sep = "/")
                ,header=FALSE);
        ## read training dataset
        trainingSubject <- read.table(
                paste(getwd(),train, "subject_train.txt",sep = "/"))
        trainingX <- read.table(
                paste(getwd(),train, "X_train.txt",sep = "/"))
        trainingY <- read.table(
                paste(getwd(),train, "y_train.txt",sep = "/"))
        ## Read Test dataset 
        testSubject <- read.table(
                paste(getwd(),test, "subject_test.txt",sep = "/"))
        testX <- read.table(
                paste(getwd(),test, "X_test.txt",sep = "/"))
        testY <- read.table(
                paste(getwd(),test, "y_test.txt",sep = "/"))
        
        #Give variable names
        colnames(activityLabels) <- c("activityID","activity")
        
        ## Step1. Merges the training and the test sets to create one data set.
        training <- cbind(trainingSubject,trainingX,trainingY)
        # head(training)
        testing <- cbind(testSubject,testX,testY) 
        mergedActivityData <-rbind(training,testing)
        # head(mergedActivityData)
}
run()