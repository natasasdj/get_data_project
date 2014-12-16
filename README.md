### Human Activity Recognition Using Smartphones Dataset

Raw data: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


`run_analysis.R` script:
 
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`tidydata.txt` the tidy data-set obtained from the `run_analysis.R` script; it can be loaded into R with the following code:

`data<-read.table("tidydata.txt",header=TRUE)`

`codebook.md` describes the variables in the  the tidy data-set `tidydata.txt`

`README.md` describes all steps in the analysis from the raw data to the tidy data