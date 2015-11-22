#README.md
#1. 
#Merges the training and the test sets to create one data set.

###########################
#set working directory to where train and test folders are.
#using setwd()

##
#get data from train folder using read.table()
#and add it to variables
#train_X for train data set
#train_y for y_train
#train_subjects for train subjects
###
#again use read.table to put X_test, y_test and subject_test
#in thre variables call test_X, test_y and test_subjects
###
#merge both train and test tables using rbind
#put them in the tables variables
#merge_train_test_X
#merge_train_test_y
#merge_train_test_subjects
##
#The merge of these three tables will be done below 
########################
#2. 
#Extracts only the measurements on the mean and standard deviation for each measurement.

#Read the file with features into R using read.table and put into
#variable features
#This file contain the name of all data features

#produce to vectors mean_true and std_true for the features containing mean() and std()
#Pattern was design to extract only the mean() or std() and avoid meanFreq() and stdFreq()
#check the features tables for this to be true using the below command
#features[mean_true,]
#features[std_true,]

#using the features[mean_true|std_true, ] to get both mean() and std() columns
#Use it to subset the dataset and get the columns for the mean and std features
#get the columns for these features to a table call merge_mean_std
#using the following command
#merge_mean_std <- merge_train_test_X[, features[mean_true|std_true,2]]

########################
#3. 
#Uses descriptive activity names to name the activities in the data set
#Change the activities numbers by their name in the merge_train_test_y file
##
#1 "walking"
#2 "walking_upstairs"
#3 "walking_downstairs"
#4 "sitting"
#5 "standing"
#6 "laying"
#I did check that the labellig was correctly implemented by the command
#cbind(merge_train_test_y,rbind(train_y,test_y)) and check in rows 
#that the naming correspond with the value (1-6) of the activities. 

#########################
#4. 
#Appropriately labels the data set with descriptive variable names.
#name de merge_mean_std with the name of the features.
#This is following from step 2
##
#Using unlist(features[mean_true|std_true,2])
#I got the name of the features that we are interesting in
#This are the ones for mean and std
# BUT since the name of the features are no so descriptive for me I am going to change them.
#t means time and f means frequency. Going to keep like that and change the rest of the names as describe below
#replace -mean() for _mean and -std() for _std
#replace -X or -Y or -Z for _X , _Y, _Z respectively
#####################################################
#Do the following replacements on the names of the columns
#the name before ':' is replace by the name after it
#the names are paste in order to a variable call features_my_mod
#The order is the one that we get from unlist(features[mean_true|std_true,2])
#and that correspond to the order of the columns
#check below by printing original name close to modify name
#the same order as obtained by the command above/below is used
#this way the name of the columns are not going to be changed
#I do check this below by cbind(features[mean_true|std_true,2],features_my_mod) 

##
#tBodyAcc: t_body_linear_acc
#tGravityAcc: t_body_gravity_acc
#tBodyGyro: t_body_angular_vel
#tBodyAccJerk: t_body_linear_acc_Jerk
#tBodyGyroJerk: t_body_angular_vel_Jerk
#tBodyAccMag: t_body_linear_acc_magnitude
#tBodyAccJerkMag: t_body_linear_acc_Jerk_magnitude
#tGravityAccMag: t_body_gravity_acc_magnitude
#tBodyGyroMag: t_body_angular_vel_magnitude
#tBodyGyroJerkMag: t_body_angular_vel_Jerk_magnitude

#fBodyAcc: f_body_linear_acc
#fGravityAcc: f_body_gravity_acc
#fBodyGyro: f_body_angular_vel
#fBodyAccJerk: f_body_linear_acc_Jerk
#fBodyGyroJerk: f_body_angular_vel_Jerk
#fBodyAccMag: f_body_linear_acc_magnitude
#fGravityAccMag: f_body_gravity_acc_magnitude
#fBodyGyroMag: f_body_angular_vel_magnitude
#fBodyGyroJerkMag: f_body_angular_vel_Jerk_magnitude
#fBodyBodyAccJerkMag: f_body_linear_acc_Jerk_magnitude
#fBodyBodyGyroMag: f_body_angular_vel_magnitude
#fBodyBodyGyroJerkMag: f_body_angular_vel_Jerk_magnitude


##############
#features_my_mod <- c("t_body_linear_acc_mean_X", "t_body_linear_acc_mean_Y", "t_body_linear_acc_mean_Z", "t_body_linear_acc_std_X", "t_body_linear_acc_std_Y", "t_body_linear_acc_std_Z", "t_body_gravity_acc_mean_X", "t_body_gravity_acc_mean_Y", "t_body_gravity_acc_mean_Z", "t_body_gravity_acc_std_X", "t_body_gravity_acc_std_Y", "t_body_gravity_acc_std_Z", "t_body_linear_acc_Jerk_mean_X", "t_body_linear_acc_Jerk_mean_Y", "t_body_linear_acc_Jerk_mean_Z", "t_body_linear_acc_Jerk_std_X", "t_body_linear_acc_Jerk_std_Y", "t_body_linear_acc_Jerk_std_Z", "t_body_angular_vel_mean_X", "t_body_angular_vel_mean_Y", "t_body_angular_vel_mean_Z", "t_body_angular_vel_std_X", "t_body_angular_vel_std_Y", "t_body_angular_vel_std_Z", "t_body_angular_vel_Jerk_mean_X", "t_body_angular_vel_Jerk_mean_Y", "t_body_angular_vel_Jerk_mean_Z", "t_body_angular_vel_Jerk_std_X", "t_body_angular_vel_Jerk_std_Y", "t_body_angular_vel_Jerk_std_Z", "t_body_linear_acc_magnitude_mean", "t_body_linear_acc_magnitude_std", "t_body_gravity_acc_magnitude_mean", "t_body_gravity_acc_magnitude_std", "t_body_linear_acc_Jerk_magnitude_mean", "t_body_linear_acc_Jerk_magnitude_std", "t_body_angular_vel_magnitude_mean", "t_body_angular_vel_magnitude_std", "t_body_angular_vel_Jerk_magnitude_mean", "t_body_angular_vel_Jerk_magnitude_std", "f_body_linear_acc_mean_X", "f_body_linear_acc_mean_Y", "f_body_linear_acc_mean_Z", "f_body_linear_acc_std_X", "f_body_linear_acc_std_Y", "f_body_linear_acc_std_Z", "f_body_linear_acc_Jerk_mean_X", "f_body_linear_acc_Jerk_mean_Y", "f_body_linear_acc_Jerk_mean_Z", "f_body_linear_acc_Jerk_std_X", "f_body_linear_acc_Jerk_std_Y", "f_body_linear_acc_Jerk_std_Z", "f_body_angular_vel_mean_X", "f_body_angular_vel_mean_Y", "f_body_angular_vel_mean_Z", "f_body_angular_vel_std_X", "f_body_angular_vel_std_Y", "f_body_angular_vel_std_Z", "f_body_linear_acc_magnitude_mean", "f_body_linear_acc_magnitude_std", "f_body_linear_acc_Jerk_magnitude_mean", "f_body_linear_acc_Jerk_magnitude_std", "f_body_angular_vel_magnitude_mean", "f_body_angular_vel_magnitude_std", "f_body_angular_vel_Jerk_magnitude_mean", "f_body_angular_vel_Jerk_magnitude_std")


#cbind(features[mean_true|std_true,],features_my_mod)
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

#Add the names to de data using
#colnames(merge_mean_std) <- features_my_mod
# Check that the names are correct by using colnames and showing few lines from the dataset
#colnames(merge_mean_std)
#merge_mean_std[1:3,]

#########################
####
#Merge the merge_mean_std with the activities and subjects 
#add the columns names for both activities and subjects
#call the dataset merge_data_set
#merge_data_set <- cbind(merge_mean_std, merge_train_test_subjects, merge_train_test_y)
#add the name to subjects and activities columns
#colnames(merge_data_set) <- c(colnames(merge_mean_std), "subjects", "activities")

######
#5. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each
#variable for each activity and each subject.
###
#to do this part use data.table package
#library(data.table)
#transform merge_data_set into data.table object
#DT <- data.table(merge_data_set)
###
#lapply mean for columns of the data.table by subjects and activities
#what will average each feature for each subject according to the activities describe above
#and create the tidi_data_set
#tidy_data_set <- DT[,lapply(.SD,mean),by=.(subjects, activities)]
###
#write it to disk using write.table and row.name=FALSE
#write.table(tidy_data_set, file = "tidy_data_set.txt", row.name=FALSE)
