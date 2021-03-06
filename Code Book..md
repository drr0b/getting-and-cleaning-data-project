## Code Book for sum_tab.txt

### Transformations
- Each data set (training and test) consisted of a X_ file containing the body of the information (561 columns), a y_ file showing the activity (1-6),  and a subject_ file saying who the subject was (1-30, people aged 19-48).
- The y_ and subject files were appended to the corresponding X_ files with cbind, adding activity and subject columns
- The test and train data sets were combined with rbind to vreate a merged table with 10299 rows and 563 columns
- Only data pertaining to means and standard deviations of time domain statistics were extracted from the merged table (see below)
- Activities were given labels rather than numbers
- A new table was created, grouping by activity using dplyr
- A summary table was created, getting the mean of every value, and each activity

### Data

This table gives the *Mean value of each variable for each specific activity. Variables are normalised and bounded between -1 and 1.

Each  Column  represents  means (Mean.something) and standard deviations (SDev.something) of various values measured by the device. The full 561  Column  data include data in the time domain and frequency domain, so I only considered the data from the time domain. For each attribute, the x, y, and z components are given (..._X, ..._Y, and ..._Z) as well as the magnitude (...Mag).

The data come from an accelerometer and gyroscope in the device (Accel and Gyro); the acceleration was devided into gravtitational acceleration, and acceleration  from the body. 

Here is a list of  Column s in the sum_tab.txt table, with corresponding  Column s in the 561  Column  table described in features.txt.

*Mean.BodyAccel_X  Column 1   
*Mean.BodyAccel_Y  Column 2   
*Mean.BodyAccel_Z  Column 3   
*SDev.BodyAccel_X  Column 4   
*SDev.BodyAccel_Y  Column 5   
*SDev.BodyAccel_Z  Column 6   
*Mean.GravAccel_X  Column 41   
*Mean.GravAccel_Y  Column 42   
*Mean.GravAccel_Z  Column 43   
*SDev.GravAccel_X  Column 44   
*SDev.GravAccel_Y  Column 45   
*SDev.GravAccel_Z  Column 46   
*Mean.BodyJerk_X  Column 81   
*Mean.BodyJerk_Y  Column 82   
*Mean.BodyJerk_Z  Column 83   
*SDev.BodyJerk_X  Column 84   
*SDev.BodyJerk_Y  Column 85   
*SDev.BodyJerk_Z  Column 86   
*Mean.BodyGyro_X  Column 121   
*Mean.BodyGyro_Y  Column 122   
*Mean.BodyGyro_Z  Column 123   
*SDev.BodyGyro_X  Column 124   
*SDev.BodyGyro_Y  Column 125   
*SDev.BodyGyro_Z  Column 126   
*Mean.BodyGyroJerk_X  Column 161   
*Mean.BodyGyroJerk_Y  Column 162   
*Mean.BodyGyroJerk_Z  Column 163    
*SDev.BodyGyroJerk_X  Column 164   
*SDev.BodyGyroJerk_Y  Column 165   
*SDev.BodyGyroJerk_Z  Column 166   
*Mean.BodyAccelMag  Column 201   
*SDev.BodyAccelMag  Column 202   
*Mean.GravAccelMag  Column 214   
*SDev.GravAccelMag  Column 215   
*Mean.BodyJerkMag  Column 228   
*SDev.BodyJerkMag  Column 229   
*Mean.BodyGyroMag  Column 240   
*SDev.BodyGyroMag  Column 241   
*Mean.BodyGyroJerkMag  Column 253   
*SDev.BodyGyroJerkMag  Column 254   