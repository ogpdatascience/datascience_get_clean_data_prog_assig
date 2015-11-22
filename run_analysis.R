#You should create one R script called run_analysis.R that does the following.
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each
#variable for each activity and each subject.
##########################################################################################
#Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file
#created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box,
#as this may cause errors saving your submission).
##########################################################################################
#1. 
#Merges the training and the test sets to create one data set.

###########################
#set working directory to where train and test folders are.
#I am leaving it empty here for you to set
#just copy paste the inside the "" the path to dir
setwd("")

##
#get data from train folder
train_X <- read.table("./train/X_train.txt")
train_y <- read.table("./train/y_train.txt")
train_subjects <- read.table("./train/subject_train.txt")

#get data from test folder
test_X <- read.table("./test/X_test.txt")
test_y <- read.table("./test/y_test.txt")
test_subjects <- read.table("./test/subject_test.txt")
##
#merge both train and test tables
merge_train_test_X <- rbind(train_X,test_X)
merge_train_test_y <- rbind(train_y,test_y)
merge_train_test_subjects <- rbind(train_subjects, test_subjects)

########################
#2. 
#Extracts only the measurements on the mean and standard deviation for each measurement.

#Read the file with features into R
#This file contain the name of all data
features <- read.table("features.txt")
#get the features for mean and std
#Pattern was design to extract only the mean() and avoid meanFreq()
mean_true <- unlist(lapply(features[,2], grepl, pattern = "(mean)([(][)])", ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE))
std_true <- unlist(lapply(features[,2], grepl, pattern = "(std)([(][)])", ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE))

#I do chech the features tables for this to be true using the below command
#features[mean_true,]
#features[std_true,]

#using the features[mean_true|std_true, 2] get both mean() and std() columns
#get the columns for these features
merge_mean_std <- merge_train_test_X[, features[mean_true|std_true,2]]


########################
#3. 
#Uses descriptive activity names to name the activities in the data set
#Change the activities numbers by their name in the merge_train_test_y file
#
merge_train_test_y[merge_train_test_y[,1] == 1,] <- "walking"
merge_train_test_y[merge_train_test_y[,1] == 2,] <- "walking_upstairs"
merge_train_test_y[merge_train_test_y[,1] == 3,] <- "walking_downstairs"
merge_train_test_y[merge_train_test_y[,1] == 4,] <- "sitting"
merge_train_test_y[merge_train_test_y[,1] == 5,] <- "standing"
merge_train_test_y[merge_train_test_y[,1] == 6,] <- "laying"

#I did check that the labellig was correctly implemented by the command
#cbind(merge_train_test_y,rbind(train_y,test_y)) and check in many rows 
#that the naming correspond with the value (1-6) of the activities. 


#########################
#4. 
#Appropriately labels the data set with descriptive variable names.
#name de merge_mean_std with the name of the features.
#
###
#Read the file with features into R
#This file contain the name of all data
#using the same variable feaure from above get the name of all features that contain mean() and std()
#
#unlist(features[mean_true|std_true,2])
# I use the output of the command above to change the column names
# according to description in code book and to the print of all and new names below

##############
features_my_mod <- c("t_body_linear_acc_mean_X", "t_body_linear_acc_mean_Y", "t_body_linear_acc_mean_Z", "t_body_linear_acc_std_X", "t_body_linear_acc_std_Y", "t_body_linear_acc_std_Z", "t_body_gravity_acc_mean_X", "t_body_gravity_acc_mean_Y", "t_body_gravity_acc_mean_Z", "t_body_gravity_acc_std_X", "t_body_gravity_acc_std_Y", "t_body_gravity_acc_std_Z", "t_body_linear_acc_Jerk_mean_X", "t_body_linear_acc_Jerk_mean_Y", "t_body_linear_acc_Jerk_mean_Z", "t_body_linear_acc_Jerk_std_X", "t_body_linear_acc_Jerk_std_Y", "t_body_linear_acc_Jerk_std_Z", "t_body_angular_vel_mean_X", "t_body_angular_vel_mean_Y", "t_body_angular_vel_mean_Z", "t_body_angular_vel_std_X", "t_body_angular_vel_std_Y", "t_body_angular_vel_std_Z", "t_body_angular_vel_Jerk_mean_X", "t_body_angular_vel_Jerk_mean_Y", "t_body_angular_vel_Jerk_mean_Z", "t_body_angular_vel_Jerk_std_X", "t_body_angular_vel_Jerk_std_Y", "t_body_angular_vel_Jerk_std_Z", "t_body_linear_acc_magnitude_mean", "t_body_linear_acc_magnitude_std", "t_body_gravity_acc_magnitude_mean", "t_body_gravity_acc_magnitude_std", "t_body_linear_acc_Jerk_magnitude_mean", "t_body_linear_acc_Jerk_magnitude_std", "t_body_angular_vel_magnitude_mean", "t_body_angular_vel_magnitude_std", "t_body_angular_vel_Jerk_magnitude_mean", "t_body_angular_vel_Jerk_magnitude_std", "f_body_linear_acc_mean_X", "f_body_linear_acc_mean_Y", "f_body_linear_acc_mean_Z", "f_body_linear_acc_std_X", "f_body_linear_acc_std_Y", "f_body_linear_acc_std_Z", "f_body_linear_acc_Jerk_mean_X", "f_body_linear_acc_Jerk_mean_Y", "f_body_linear_acc_Jerk_mean_Z", "f_body_linear_acc_Jerk_std_X", "f_body_linear_acc_Jerk_std_Y", "f_body_linear_acc_Jerk_std_Z", "f_body_angular_vel_mean_X", "f_body_angular_vel_mean_Y", "f_body_angular_vel_mean_Z", "f_body_angular_vel_std_X", "f_body_angular_vel_std_Y", "f_body_angular_vel_std_Z", "f_body_linear_acc_magnitude_mean", "f_body_linear_acc_magnitude_std", "f_body_linear_acc_Jerk_magnitude_mean", "f_body_linear_acc_Jerk_magnitude_std", "f_body_angular_vel_magnitude_mean", "f_body_angular_vel_magnitude_std", "f_body_angular_vel_Jerk_magnitude_mean", "f_body_angular_vel_Jerk_magnitude_std")

#check if the name are correct by cbind(features[mean_true|std_true,2],features_my_mod)
cbind(features[mean_true|std_true,],features_my_mod)
#     V1                          V2                        features_my_mod
#1     1           tBodyAcc-mean()-X               t_body_linear_acc_mean_X
#2     2           tBodyAcc-mean()-Y               t_body_linear_acc_mean_Y
#3     3           tBodyAcc-mean()-Z               t_body_linear_acc_mean_Z
#4     4            tBodyAcc-std()-X                t_body_linear_acc_std_X
#5     5            tBodyAcc-std()-Y                t_body_linear_acc_std_Y
#6     6            tBodyAcc-std()-Z                t_body_linear_acc_std_Z
#41   41        tGravityAcc-mean()-X              t_body_gravity_acc_mean_X
#42   42        tGravityAcc-mean()-Y              t_body_gravity_acc_mean_Y
#43   43        tGravityAcc-mean()-Z              t_body_gravity_acc_mean_Z
#44   44         tGravityAcc-std()-X               t_body_gravity_acc_std_X
#45   45         tGravityAcc-std()-Y               t_body_gravity_acc_std_Y
#46   46         tGravityAcc-std()-Z               t_body_gravity_acc_std_Z
#81   81       tBodyAccJerk-mean()-X          t_body_linear_acc_Jerk_mean_X
#82   82       tBodyAccJerk-mean()-Y          t_body_linear_acc_Jerk_mean_Y
#83   83       tBodyAccJerk-mean()-Z          t_body_linear_acc_Jerk_mean_Z
#84   84        tBodyAccJerk-std()-X           t_body_linear_acc_Jerk_std_X
#85   85        tBodyAccJerk-std()-Y           t_body_linear_acc_Jerk_std_Y
#86   86        tBodyAccJerk-std()-Z           t_body_linear_acc_Jerk_std_Z
#121 121          tBodyGyro-mean()-X              t_body_angular_vel_mean_X
#122 122          tBodyGyro-mean()-Y              t_body_angular_vel_mean_Y
#123 123          tBodyGyro-mean()-Z              t_body_angular_vel_mean_Z
#124 124           tBodyGyro-std()-X               t_body_angular_vel_std_X
#125 125           tBodyGyro-std()-Y               t_body_angular_vel_std_Y
#126 126           tBodyGyro-std()-Z               t_body_angular_vel_std_Z
#161 161      tBodyGyroJerk-mean()-X         t_body_angular_vel_Jerk_mean_X
#162 162      tBodyGyroJerk-mean()-Y         t_body_angular_vel_Jerk_mean_Y
#163 163      tBodyGyroJerk-mean()-Z         t_body_angular_vel_Jerk_mean_Z
#164 164       tBodyGyroJerk-std()-X          t_body_angular_vel_Jerk_std_X
#165 165       tBodyGyroJerk-std()-Y          t_body_angular_vel_Jerk_std_Y
#166 166       tBodyGyroJerk-std()-Z          t_body_angular_vel_Jerk_std_Z
#201 201          tBodyAccMag-mean()       t_body_linear_acc_magnitude_mean
#202 202           tBodyAccMag-std()        t_body_linear_acc_magnitude_std
#214 214       tGravityAccMag-mean()      t_body_gravity_acc_magnitude_mean
#215 215        tGravityAccMag-std()       t_body_gravity_acc_magnitude_std
#227 227      tBodyAccJerkMag-mean()  t_body_linear_acc_Jerk_magnitude_mean
#228 228       tBodyAccJerkMag-std()   t_body_linear_acc_Jerk_magnitude_std
#240 240         tBodyGyroMag-mean()      t_body_angular_vel_magnitude_mean
#241 241          tBodyGyroMag-std()       t_body_angular_vel_magnitude_std
#253 253     tBodyGyroJerkMag-mean() t_body_angular_vel_Jerk_magnitude_mean
#254 254      tBodyGyroJerkMag-std()  t_body_angular_vel_Jerk_magnitude_std
#266 266           fBodyAcc-mean()-X               f_body_linear_acc_mean_X
#267 267           fBodyAcc-mean()-Y               f_body_linear_acc_mean_Y
#268 268           fBodyAcc-mean()-Z               f_body_linear_acc_mean_Z
#269 269            fBodyAcc-std()-X                f_body_linear_acc_std_X
#270 270            fBodyAcc-std()-Y                f_body_linear_acc_std_Y
#271 271            fBodyAcc-std()-Z                f_body_linear_acc_std_Z
#345 345       fBodyAccJerk-mean()-X          f_body_linear_acc_Jerk_mean_X
#346 346       fBodyAccJerk-mean()-Y          f_body_linear_acc_Jerk_mean_Y
#347 347       fBodyAccJerk-mean()-Z          f_body_linear_acc_Jerk_mean_Z
#348 348        fBodyAccJerk-std()-X           f_body_linear_acc_Jerk_std_X
#349 349        fBodyAccJerk-std()-Y           f_body_linear_acc_Jerk_std_Y
#350 350        fBodyAccJerk-std()-Z           f_body_linear_acc_Jerk_std_Z
#424 424          fBodyGyro-mean()-X              f_body_angular_vel_mean_X
#425 425          fBodyGyro-mean()-Y              f_body_angular_vel_mean_Y
#426 426          fBodyGyro-mean()-Z              f_body_angular_vel_mean_Z
#427 427           fBodyGyro-std()-X               f_body_angular_vel_std_X
#428 428           fBodyGyro-std()-Y               f_body_angular_vel_std_Y
#429 429           fBodyGyro-std()-Z               f_body_angular_vel_std_Z
#503 503          fBodyAccMag-mean()       f_body_linear_acc_magnitude_mean
#504 504           fBodyAccMag-std()        f_body_linear_acc_magnitude_std
#516 516  fBodyBodyAccJerkMag-mean()  f_body_linear_acc_Jerk_magnitude_mean
#517 517   fBodyBodyAccJerkMag-std()   f_body_linear_acc_Jerk_magnitude_std
#529 529     fBodyBodyGyroMag-mean()      f_body_angular_vel_magnitude_mean
#530 530      fBodyBodyGyroMag-std()       f_body_angular_vel_magnitude_std
#542 542 fBodyBodyGyroJerkMag-mean() f_body_angular_vel_Jerk_magnitude_mean
#543 543  fBodyBodyGyroJerkMag-std()  f_body_angular_vel_Jerk_magnitude_std

#Add the names to de data
colnames(merge_mean_std) <- features_my_mod
# Check that the names are correct by using colnames and showing few lines from the dataset
#colnames(merge_mean_std)
#merge_mean_std[1:3,]

#########################
####
#Merge the merge_mean_std with the activities and subjects 
#call the dataset merge_data_set
merge_data_set <- cbind(merge_mean_std, merge_train_test_subjects, merge_train_test_y)

#add the columns names for both activities and subjects
colnames(merge_data_set) <- c(colnames(merge_mean_std), "subjects", "activities")

######
#5. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each
#variable for each activity and each subject.
###
library(data.table)
DT <- data.table(merge_data_set)
###
tidy_data_set <- DT[,lapply(.SD,mean),by=.(subjects, activities)]
###
write.table(tidy_data_set, file = "tidy_data_set.txt", row.name=FALSE)

