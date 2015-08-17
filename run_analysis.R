### Course Project
# Download and unzip data
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
#              destfile="data.zip")
#unzip("data.zip")

# This makes a folder with contents described in  "Read Me.md".  First read in some data. fill=TRUE
#adds any required missing text to bring rows to equal length

#comment this to prevent doing it each time REMOVE COMMENT BEFORE SUBMISSION
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",sep="",fill=TRUE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")



# All sets in training have 7352 rows, with y_train and subject_train having one column each

# add columns in
new_train <- cbind(x_train,y_train,subject_train)





# Now do the same for the test group
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",sep="",fill=TRUE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

new_test <- cbind(x_test,y_test,subject_test)

# NOW MERGE DATA. IT IS VERY IMPORTANT NOT TO NAME ANY COLUMNS BEFORE MERGING
# I SPENT HOURS FAFFING WITH RBIND FOR THIS STUPID REASON!!!!

merged_data <- rbind(new_train,new_test)

# Make a table from all useful columns, following descriptions in features.txt
# We only use variables in time rather than frequency

Mean.BodyAccel_X <- merged_data[,1]
Mean.BodyAccel_Y <- merged_data[,2]
Mean.BodyAccel_Z <- merged_data [,3]
SDev.BodyAccel_X <- merged_data[,4]
SDev.BodyAccel_Y <- merged_data[,5]
Sdev.BodyAccel_Z <- merged_data[,6]
Mean.GravAccel_X <- merged_data[,41]
Mean.GravAccel_Y <- merged_data[,42]
Mean.GravAccel_Z <- merged_data[,43]
SDev.GravAccel_X <- merged_data[,44]
SDev.GravAccel_Y <- merged_data[,45]
SDev.GravAccel_Z <- merged_data[,46]
Mean.BodyJerk_X <- merged_data[,81]
Mean.BodyJerk_Y <- merged_data[,82]
Mean.BodyJerk_Z <- merged_data[,83]
SDev.BodyJerk_X <- merged_data[,84]
SDev.BodyJerk_Y <- merged_data[,85]
SDev.BodyJerk_Z <- merged_data[,86]
Mean.BodyGyro_X <- merged_data[,121]
Mean.BodyGyro_Y <- merged_data[,122]
Mean.BodyGyro_Z <- merged_data[,123]
SDev.BodyGyro_X <- merged_data[,124]
SDev.BodyGyro_Y <- merged_data[,125]
SDEV.BodyGyro_Z <- merged_data[,126]
Mean.BodyGyroJerk_X <- merged_data[,161]
Mean.BodyGyroJerk_Y <- merged_data[,162]
Mean.BodyGyroJerk_Z <- merged_data[,163]
SDev.BodyGyroJerk_X <- merged_data[,164]
SDev.BodyGyroJerk_Y <- merged_data[,165]
SDev.BodyGyroJerk_Z <- merged_data[,166]
Mean.BodyAccelMag <- merged_data[,201]
SDev.BodyAccelMag <- merged_data[,202]
Mean.GravAccelMag <- merged_data[,214]
SDev.GravAccelMag <- merged_data[,215]
Mean.BodyJerkMag <- merged_data[,228]
SDev.BodyJerkMag <- merged_data[,229]
Mean.BodyGyroMag <- merged_data[,240]
SDev.BodyGyroMag <- merged_data[,241]
Mean.BodyGyroJerkMag <- merged_data[,253]
SDev.BodyGyroJerkMag <- merged_data[,254]
Activity <- merged_data[,562]
Subject <-merged_data[,563]

# TUrn activity types 1-6 into activities shown in activity_labels.txt
activity.types <- c("WALKING","WALKING UPSTAIRS", "WALKING DOWNSTAIRS", "SITTING",
                    "STANDING", "LAYING")
Activity  <-  activity.types[Activity]

# MAKE NEW TABLE

new_table <- data.frame(Mean.BodyAccel_X ,
                   Mean.BodyAccel_Y ,
                   Mean.BodyAccel_Z ,
                   SDev.BodyAccel_X ,
                   SDev.BodyAccel_Y ,
                   Sdev.BodyAccel_Z ,
                   Mean.GravAccel_X ,
                   Mean.GravAccel_Y ,
                   Mean.GravAccel_Z ,
                   SDev.GravAccel_X ,
                   SDev.GravAccel_Y ,
                   SDev.GravAccel_Z ,
                   Mean.BodyJerk_X ,
                   Mean.BodyJerk_Y ,
                   Mean.BodyJerk_Z ,
                   SDev.BodyJerk_X,
                   SDev.BodyJerk_Y,
                   SDev.BodyJerk_Z,
                   Mean.BodyGyro_X,
                   Mean.BodyGyro_Y,
                   Mean.BodyGyro_Z,
                   SDev.BodyGyro_X,
                   SDev.BodyGyro_Y,
                   SDEV.BodyGyro_Z,
                   Mean.BodyGyroJerk_X,
                   Mean.BodyGyroJerk_Y,
                   Mean.BodyGyroJerk_Z,
                   SDev.BodyGyroJerk_X,
                   SDev.BodyGyroJerk_Y,
                   SDev.BodyGyroJerk_Z,
                   Mean.BodyAccelMag ,
                   SDev.BodyAccelMag ,
                   Mean.GravAccelMag ,
                   SDev.GravAccelMag ,
                   Mean.BodyJerkMag,
                   SDev.BodyJerkMag ,
                   Mean.BodyGyroMag ,
                   SDev.BodyGyroMag ,
                   Mean.BodyGyroJerkMag ,
                   SDev.BodyGyroJerkMag ,
                   Activity,
                   Subject )



# Use dplyr to manipulate data
library(dplyr)

# First group
grouped_table <- group_by(new_table,Activity)


#Then summarize
sum_tab <- summarize(grouped_table,Mean.BodyAccel_X=mean(Mean.BodyAccel_X),
                     Mean.BodyAccel_Y = mean(Mean.BodyAccel_Y),
                     Mean.BodyAccel_Z = mean(Mean.BodyAccel_Z),
                     SDev.BodyAccel_X = mean(SDev.BodyAccel_X),
                     SDev.BodyAccel_Y = mean(SDev.BodyAccel_Y),
                     Sdev.BodyAccel_Z = mean(Sdev.BodyAccel_Z),
                     Mean.GravAccel_X = mean(Mean.GravAccel_X),
                     Mean.GravAccel_Y = mean(Mean.GravAccel_Y),
                     Mean.GravAccel_Z = mean(Mean.GravAccel_Z),
                     SDev.GravAccel_X = mean(SDev.GravAccel_X),
                     SDev.GravAccel_Y = mean(SDev.GravAccel_Y),
                     SDev.GravAccel_Z = mean(SDev.GravAccel_Z),
                     Mean.BodyJerk_X  = mean(Mean.BodyJerk_X),
                     Mean.BodyJerk_Y  = mean(Mean.BodyJerk_Y),
                     Mean.BodyJerk_Z = mean(Mean.BodyJerk_Z),
                     SDev.BodyJerk_X = mean(SDev.BodyJerk_X),
                     SDev.BodyJerk_Y = mean(SDev.BodyJerk_Y),
                     SDev.BodyJerk_Z = mean(SDev.BodyJerk_Z),
                     Mean.BodyGyro_X = mean(Mean.BodyGyro_X),
                     Mean.BodyGyro_Y = mean(Mean.BodyGyro_Y),
                     Mean.BodyGyro_Z = mean(Mean.BodyGyro_Z),
                     SDev.BodyGyro_X = mean(SDev.BodyGyro_X),
                     SDev.BodyGyro_Y = mean(SDev.BodyGyro_Y),
                     SDEV.BodyGyro_Z = mean(SDEV.BodyGyro_Z),
                     Mean.BodyGyroJerk_X = mean(Mean.BodyGyroJerk_X),
                     Mean.BodyGyroJerk_Y = mean(Mean.BodyGyroJerk_Y),
                     Mean.BodyGyroJerk_Z = mean(Mean.BodyGyroJerk_Z),
                     SDev.BodyGyroJerk_X = mean(SDev.BodyGyroJerk_X),
                     SDev.BodyGyroJerk_Y = mean(SDev.BodyGyroJerk_Y),
                     SDev.BodyGyroJerk_Z = mean(SDev.BodyGyroJerk_Z),
                     Mean.BodyAccelMag = mean(Mean.BodyAccelMag),
                     SDev.BodyAccelMag = mean(SDev.BodyAccelMag),
                     Mean.GravAccelMag = mean(Mean.GravAccelMag),
                     SDev.GravAccelMag = mean(SDev.GravAccelMag),
                     Mean.BodyJerkMag = mean(Mean.BodyJerkMag),
                     SDev.BodyJerkMag = mean(SDev.BodyJerkMag),
                     Mean.BodyGyroMag = mean(Mean.BodyGyroMag),
                     SDev.BodyGyroMag = mean(SDev.BodyGyroMag),
                     Mean.BodyGyroJerkMag = mean(Mean.BodyGyroJerkMag),
                     SDev.BodyGyroJerkMag = mean(SDev.BodyGyroJerkMag)
                     )
