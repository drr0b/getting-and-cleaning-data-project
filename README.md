##READ ME


This is the course project for Getting and Cleaning Data. In it, we merge the provided data into one data set, and perform analysis. RUnning the program downloads and unzips the data.

### Data Structure
Unzipping the data yields a folder "UCI HAR Dataset" that contains separate folders for training and test data. These folders contain 3 text files, as well as another folder of raw data. The X_test.txt / X_train.txt contain the body of the data, with 561 columns; y_test.txt and y_train.txt contain a single column of data specifying the activity type (1-6), and the subject_train.txt and subject_test.txt files contain a single column with subject ID (1-30).

The top level of the data folder contains a file called features.txt that identifies the columns of the X- files, while activities.txt identify the activities.

### Procedure
Running the run_analysis.R script does the following.
* The activity and subject data were added to the corresponding X_files
* The training and test data sets were merged
* Useful columns containing means and standard deviations of interesting values were identified
* Activities were properly labeled
* A new table was made (for details see codebook)
* Table was grouped by activity then summarised.
* A plaintext table was created (sum_tab.txt)
