CodeBook
================
SanghyunBai
2019년 2월 19일

The data used for this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. Please check [raw data description](#raw-data-description)

Raw data description
--------------------

The raw data set is retrieve from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Please check the website for detailed description.

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Clean data `tidy_data.txt`
--------------------------

The first row contains the names of the [variables](#variables) and the following rows contain the values of these variables. Since the dataset is created using appropriately labels with descriptive variable names, it should be understandable what the each variable name means. How the data is produced can be found in [transforming data](#transforming-data)

### Transforming data

1.  The raw data is downloaded via [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2.  The following files are used in this project.

    -   activities\_labels.txt
    -   features.txt
    -   test/X\_test.txt
    -   test/y\_test.txt
    -   test/subject\_test.txt
    -   train/X\_train.txt
    -   train/y\_train.txt
    -   train/subject\_train.txt

3.  Firstly, each files are read using `dplyr` package. Each read table is given a variable name. For example

        colnames(trainingSubject) = "subjectId"
        colnames(trainingY) = "activityId"
        colnames(trainingX) = features[,2]

4.  Then, train\_ dataset and test\_ dataset are merged, creating `mergedActivityData`
5.  The data which represents `mean` and `standard deviation` are extracted
6.  activityId(numeric 1:6) is represented using activityType ('walking','sitting',etc)
7.  Column(variable) names are updated, so more readable.
8.  Finally, `tidy_data.txt` is created by summarizing mean of each variable for each subject & each activity

### variables

        `"subjectId"` 
        `"activityId" `

        `"timeBodyAccelerometerMeanX"`
        `"timeBodyAccelerometerMeanY"`
        `"timeBodyAccelerometerMeanZ" `
        
        `"timeBodyAccelerometerStandardDeviationX"`
        `"timeBodyAccelerometerStandardDeviationY"`
        `"timeBodyAccelerometerStandardDeviationZ"`
        
        `"timeGravityAccelerometerMeanX" `
        `"timeGravityAccelerometerMeanY"`
        `"timeGravityAccelerometerMeanZ"`
        
        `"timeGravityAccelerometerStandardDeviationX"`
        `"timeGravityAccelerometerStandardDeviationY"`
        `"timeGravityAccelerometerStandardDeviationZ"`
        
        `"timeBodyAccelerometerJerkMeanX"`
        `"timeBodyAccelerometerJerkMeanY"`
        `"timeBodyAccelerometerJerkMeanZ"`
        
        `"timeBodyAccelerometerJerkStandardDeviationX"`
        `"timeBodyAccelerometerJerkStandardDeviationY"`
        `"timeBodyAccelerometerJerkStandardDeviationZ"`
        
        `"timeBodyGyroscopeMeanX"`
        `"timeBodyGyroscopeMeanY" `
        `"timeBodyGyroscopeMeanZ"`
        
        `"timeBodyGyroscopeStandardDeviationX"`
        `"timeBodyGyroscopeStandardDeviationY"`
        `"timeBodyGyroscopeStandardDeviationZ"`
        
        `"timeBodyGyroscopeJerkMeanX"`
        `"timeBodyGyroscopeJerkMeanY"`
        `"timeBodyGyroscopeJerkMeanZ"`
        
        `"timeBodyGyroscopeJerkStandardDeviationX"`
        `"timeBodyGyroscopeJerkStandardDeviationY"`
        `"timeBodyGyroscopeJerkStandardDeviationZ"`
        
        ...
