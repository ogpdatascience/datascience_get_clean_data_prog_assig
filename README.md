**README file for Coursera Getting and Cleaning Data course program assigment.**

**Summary.**

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**1. Merges the training and the test sets to create one data set.**

First set working directory to where train and test folders are and get data from train folder using read.table()
to add it to variables train_X for train data set, train_y for y_train and train_subjects for train subjects.
Do the same for the test data set to add X_test, y_test and subject_test to the variables call test_X, test_y and test_subjects respectively. After that merge both train and test tables using rbind and get three new tables: merge_train_test_X, merge_train_test_y and merge_train_test_subjects.

**2. Extracts only the measurements on the mean and standard deviation for each measurement.**

Read the file with features into R using read.table and put into variable features (this file contain the name of all data features). Produce to vectors mean_true and std_true for the features containing mean() and std(). The pattern to obtain these vectors was design to extract only the mean() or std() and avoid meanFreq() and stdFreq(). 
Check the features tables for this to be true using the below commands features[mean_true,] and features[std_true,].
Using the features[mean_true|std_true, ] to get both mean() and std() columns.
Use it to subset the dataset and get the columns for the mean and std features and get the columns for these features to a table call merge_mean_std using the following command (merge_mean_std <- merge_train_test_X[, features[mean_true|std_true,2]]).

**3. Uses descriptive activity names to name the activities in the data set to change the activities numbers by their name in the merge_train_test_y file.

1 as "walking", 2 as "walking_upstairs", 3 as "walking_downstairs", 4 as "sitting", 5 as "standing" and 6 as"laying"

Check that the labellig was correctly implemented using command cbind(merge_train_test_y,rbind(train_y,test_y)) and visually check in rows that the naming correspond with the value (1-6) of the activities. 

**4. Appropriately labels the data set with descriptive variable names.**
Name de merge_mean_std with the name of the features. This is following from step 2.
Using unlist(features[mean_true|std_true,2]) get feature names that we are interesting in (mean() std().
BUT since the name of the features are no so descriptive for me I am going to change them. t means time and f means frequency. Going to keep like that and change the rest of the names as describe below in the CodeBook.md file.
Using the command below check that the new names are correct. The output is in the CodeBook.
cbind(features[mean_true|std_true,],features_my_mod).

Add the names to de data using colnames(merge_mean_std) <- features_my_mod and double check that the names are correct by using colnames and showing few lines from the dataset colnames(merge_mean_std) and merge_mean_std[1:3,]

Next step is to merge the merge_mean_std with the activities and subjects and add the columns names for both activities and subjects. The new data set is call **merge_data_set**

**5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

Approach this part using data.table package by first transform merge_data_set into data.table object **DT** and them apply the mean over columns by subjects and activities. This step will average each feature for each subject according to the activities describe above and create the **tidy_data_set** which is them save to disk with no row names.

