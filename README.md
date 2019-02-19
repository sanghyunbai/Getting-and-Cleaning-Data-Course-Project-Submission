SanghyunBai
2019년 2월 18일

Getting And Cleaning Data
=========================

#### The purpose

this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

<!-- #### Requirements for the project  -->
<!-- 1. Get data -> raw data -> clean-> tidy data.  -->
<!-- 2. CodeBook.md (that describes the variables, the data, and any transformations or work that you performed to clean up the data)  -->
<!-- 3. Link to Github repo -->
<!-- 4. README.md (explains how all of the scripts work and how they are connected.) -->
<!-- 5. More detailed description of the project can be found in  -->
<!-- <https://www.coursera.org/learn/data-cleaning> -->
#### Files & Folders Description

1.  `README.md` -this file explains how all of the scipts work and how they are connected
2.  `CodeBook.md` -this file describes the data, variables, and any transformation of work that are performed to clean up the data.
3.  `dataset` - this folder should contain the raw data. Please see below section [retrieve raw data](#retrieve-raw-data) to obtain the raw data.
4.  `run_analysis.R` - is a script written in R. It cleans raw data and creates `tidy_data.txt`. Please see below section [Clean data](#clean-data) to understand what procedures the script follows.
5.  `tidy_data.txt` - it contains tidy dataset.

#### Setup

1.  Clone the git repository from by typing the command git clone "<https://github.com/sanghyunbai/Getting-and-Cleaning-Data-Course-Project-Submission.git>"
2.  Retrieve raw data [retrieve raw data](#retrieve-raw-data)
3.  Install the following R packages by giving command to R Console `install.packages("XX")`
    1.  `dplyr`

#### Retrieve Raw Data

1.  Download the raw data from [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The **description of data** can be found in `CodeBook.md`
2.  Unzip the downloaded file to `dataset` inside of the directory `Getting-and-Cleaning-Data-Course-Project-Submission` that is created by cloning.

#### Clean data

`run_analysis.R` script does followings to clean the raw data.

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6.  Write the data set to the `tidy_data.txt` file.

#### Running the analysis.

1.  Source `run_analysis.R` by giving command `source(run_analysis.R)`
2.  Execute the function `run()`
