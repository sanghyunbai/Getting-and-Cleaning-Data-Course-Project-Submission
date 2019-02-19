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
        #tag column names 
        colnames(activityLabels) <- c('activityId','activityType')
        
        ## read training dataset
        trainingSubject <- read.table(
                paste(getwd(),train, "subject_train.txt",sep = "/")
                ,header=FALSE)
        trainingX <- read.table(
                paste(getwd(),train, "X_train.txt",sep = "/")
                ,header=FALSE)
        trainingY <- read.table(
                paste(getwd(),train, "y_train.txt",sep = "/")
                ,header=FALSE)
        # tag training dataset
        colnames(trainingSubject) = "subjectId"
        colnames(trainingY) = "activityId"
        colnames(trainingX) = features[,2]

        ## Read Test dataset 
        testSubject <- read.table(
                paste(getwd(),test, "subject_test.txt",sep = "/")
                ,header=FALSE)
        testX <- read.table(
                paste(getwd(),test, "X_test.txt",sep = "/")
                ,header=FALSE)
        testY <- read.table(
                paste(getwd(),test, "y_test.txt",sep = "/")
                ,header=FALSE)
        #taging 
        colnames(testSubject) = "subjectId"
        colnames(testY) = "activityId"
        colnames(testX) = features[,2]
        
        ## Merges the training and the test sets to create one data set.
        training <- cbind(trainingY,trainingSubject,trainingX)
        testing <- cbind(testY,testSubject,testX) 
        mergedActivityData <-rbind(training,testing)

        ## Extracts only the measurements on the mean and standard deviation for each measurement.
        # give column names, so we can extract only needed columns
        # print(features[,2]) # contains measurement names #observations
        columnNames <- colnames(mergedActivityData)
        extractColumnes<-grepl("subjectId|activityId|mean|std",columnNames)
        # print(extractColumnes)
        mergedActivityData<-mergedActivityData[ ,extractColumnes]
        

        # ## Uses descriptive activity names to name the activities in the data set
        mergedActivityData <- merge(mergedActivityData, activityLabels,
                                      by="activityId",
                                      all.x=TRUE)
        columnNames <- colnames(mergedActivityData)
        mergedActivityData$activityId <- mergedActivityData$activityType
        mergedActivityData <- select(mergedActivityData,-activityType)
        
        columnNames <- colnames(mergedActivityData)
        columnNames <- gsub("[\\(\\)-]", "", columnNames)
        # replace names in columns
        columnNames <- gsub("^f", "frequency", columnNames)
        columnNames <- gsub("^t", "time", columnNames)
        columnNames <- gsub("Acc", "Accelerometer", columnNames)
        columnNames <- gsub("Gyro", "Gyroscope", columnNames)
        columnNames <- gsub("Magn", "Magnitude", columnNames)
        columnNames <- gsub("Freq", "Frequency", columnNames)
        columnNames <- gsub("mean", "Mean", columnNames)
        columnNames <- gsub("std", "StandardDeviation", columnNames)
        # use new labels as column names
        colnames(mergedActivityData) <- columnNames

        ## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
        groupBy<-group_by(mergedActivityData,subjectId,activityId)
        mergedActivityDataMean<-summarise_each(groupBy,funs = mean)

        View(mergedActivityDataMean)
        write.table(mergedActivityDataMean, "tidy_data.txt", row.names = FALSE,
                    quote = TRUE)
}
run()