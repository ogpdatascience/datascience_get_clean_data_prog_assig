
**1. Getting and merging original dataset including modification of column names.**
**2. Producing a tidy data set from the merge data set.**

**1. Getting and merging original dataset including modification of column names.**

The data from train and test folder was imported to R and a new data set containing the only the features that contain mean() and std() was created avoided features meanFreq() stdFreq(). The data frame was called  **merge_data_set**. 
This dataset containg the merging of test and train data for columns containing mean() and std() and also the one column for subjects and one column for activities. All columns are name according to what is describe below.
Since the name of the features are no so descriptive for me I am going to change them as describe below.
t means time and f means frequency and was keep like that. The rest of names are described below. replace -mean() for _mean, -std() for _std , -X or -Y or -Z for _X , _Y, _Z respectively.

Do the following replacements on the names of the columns the name before ':' is replace by the name after it the names are paste in order to a variable call features_my_mod. Check this below by cbind(features[mean_true|std_true,2],features_my_mod) 

tBodyAcc: t_body_linear_acc, tGravityAcc: t_body_gravity_acc, tBodyGyro: t_body_angular_vel, tBodyAccJerk: t_body_linear_acc_Jerk, tBodyGyroJerk: t_body_angular_vel_Jerk, tBodyAccMag: t_body_linear_acc_magnitude, tBodyAccJerkMag: t_body_linear_acc_Jerk_magnitude, tGravityAccMag: t_body_gravity_acc_magnitude, tBodyGyroMag: t_body_angular_vel_magnitude, tBodyGyroJerkMag: t_body_angular_vel_Jerk_magnitude, fBodyAcc: f_body_linear_acc
fGravityAcc: f_body_gravity_acc, fBodyGyro: f_body_angular_vel, fBodyAccJerk: f_body_linear_acc_Jerk, fBodyGyroJerk: f_body_angular_vel_Jerk, fBodyAccMag: f_body_linear_acc_magnitude, fGravityAccMag: f_body_gravity_acc_magnitude, fBodyGyroMag: f_body_angular_vel_magnitude, fBodyGyroJerkMag: f_body_angular_vel_Jerk_magnitude, fBodyBodyAccJerkMag: f_body_linear_acc_Jerk_magnitude, fBodyBodyGyroMag: f_body_angular_vel_magnitude, fBodyBodyGyroJerkMag: f_body_angular_vel_Jerk_magnitude

Print of old and new names
ind | Column number original | column name original | new column name
----|------------------------|----------------------|-------------------------

1   |  1    |       tBodyAcc-mean()-X               | t_body_linear_acc_mean_X               
2   |  2    |       tBodyAcc-mean()-Y               | t_body_linear_acc_mean_Y               
3   |  3    |       tBodyAcc-mean()-Z               | t_body_linear_acc_mean_Z               
4   |  4    |        tBodyAcc-std()-X               | t_body_linear_acc_std_X               
5   |  5    |        tBodyAcc-std()-Y               | t_body_linear_acc_std_Y               
6   |  6    |        tBodyAcc-std()-Z               | t_body_linear_acc_std_Z               
41  | 41    |    tGravityAcc-mean()-X               | t_body_gravity_acc_mean_X               
42  | 42    |    tGravityAcc-mean()-Y               | t_body_gravity_acc_mean_Y   
43  | 43    |    tGravityAcc-mean()-Z               | t_body_gravity_acc_mean_Z               
44  | 44    |     tGravityAcc-std()-X               | t_body_gravity_acc_std_X               
45  | 45    |     tGravityAcc-std()-Y               | t_body_gravity_acc_std_Y               
46  | 46    |     tGravityAcc-std()-Z               | t_body_gravity_acc_std_Z               
81  | 81    |   tBodyAccJerk-mean()-X               | t_body_linear_acc_Jerk_mean_X               
82  | 82    |   tBodyAccJerk-mean()-Y               | t_body_linear_acc_Jerk_mean_Y               
83  | 83    |   tBodyAccJerk-mean()-Z               | t_body_linear_acc_Jerk_mean_Z               
84  | 84    |    tBodyAccJerk-std()-X               | t_body_linear_acc_Jerk_std_X               
85  | 85    |    tBodyAccJerk-std()-Y               | t_body_linear_acc_Jerk_std_Y               
86  | 86    |    tBodyAccJerk-std()-Z               | t_body_linear_acc_Jerk_std_Z               
121 |121    |      tBodyGyro-mean()-X               | t_body_angular_vel_mean_X               
122 |122    |      tBodyGyro-mean()-Y               | t_body_angular_vel_mean_Y               
123 |123    |      tBodyGyro-mean()-Z               | t_body_angular_vel_mean_Z               
124 |124    |       tBodyGyro-std()-X               | t_body_angular_vel_std_X               
125 |125    |       tBodyGyro-std()-Y               | t_body_angular_vel_std_Y               
126 |126    |       tBodyGyro-std()-Z               | t_body_angular_vel_std_Z               
161 |161    |  tBodyGyroJerk-mean()-X               | t_body_angular_vel_Jerk_mean_X               
162 |162    |  tBodyGyroJerk-mean()-Y               | t_body_angular_vel_Jerk_mean_Y               
163 |163    |  tBodyGyroJerk-mean()-Z               |  t_body_angular_vel_Jerk_mean_Z               
164 |164    |   tBodyGyroJerk-std()-X               |   t_body_angular_vel_Jerk_std_X               
165 |165    |   tBodyGyroJerk-std()-Y               | t_body_angular_vel_Jerk_std_Y               
166 |166    |   tBodyGyroJerk-std()-Z               | t_body_angular_vel_Jerk_std_Z               
201 |201    |      tBodyAccMag-mean()               | t_body_linear_acc_magnitude_mean               
202 |202    |       tBodyAccMag-std()               | t_body_linear_acc_magnitude_std               
214 |214    |   tGravityAccMag-mean()               | t_body_gravity_acc_magnitude_mean               
215 |215    |    tGravityAccMag-std()               | t_body_gravity_acc_magnitude_std               
227 |227    |  tBodyAccJerkMag-mean()               | t_body_linear_acc_Jerk_magnitude_mean               
228 |228    |   tBodyAccJerkMag-std()               | t_body_linear_acc_Jerk_magnitude_std               
240 |240    |     tBodyGyroMag-mean()               | t_body_angular_vel_magnitude_mean               
241 |241    |      tBodyGyroMag-std()               | t_body_angular_vel_magnitude_std               
253 |253    | tBodyGyroJerkMag-mean()               | t_body_angular_vel_Jerk_magnitude_mean               
254 |254    |  tBodyGyroJerkMag-std()               | t_body_angular_vel_Jerk_magnitude_std               
266 |266    |       fBodyAcc-mean()-X               | f_body_linear_acc_mean_X               
267 |267    |       fBodyAcc-mean()-Y               | f_body_linear_acc_mean_Y               
268 |268    |       fBodyAcc-mean()-Z               | f_body_linear_acc_mean_Z               
269 |269    |        fBodyAcc-std()-X               | f_body_linear_acc_std_X               
270 |270    |        fBodyAcc-std()-Y               | f_body_linear_acc_std_Y               
271 |271    |        fBodyAcc-std()-Z               | f_body_linear_acc_std_Z               
345 |345    |   fBodyAccJerk-mean()-X               | f_body_linear_acc_Jerk_mean_X               
346 |346    |   fBodyAccJerk-mean()-Y               | f_body_linear_acc_Jerk_mean_Y               
347 |347    |   fBodyAccJerk-mean()-Z               | f_body_linear_acc_Jerk_mean_Z               
348 |348    |    fBodyAccJerk-std()-X               | f_body_linear_acc_Jerk_std_X               
349 |349    |    fBodyAccJerk-std()-Y               | f_body_linear_acc_Jerk_std_Y               
350 |350    |    fBodyAccJerk-std()-Z               | f_body_linear_acc_Jerk_std_Z               
424 |424    |      fBodyGyro-mean()-X               | f_body_angular_vel_mean_X               
425 |425    |      fBodyGyro-mean()-Y               | f_body_angular_vel_mean_Y               
426 |426    |      fBodyGyro-mean()-Z               | f_body_angular_vel_mean_Z               
427 |427    |       fBodyGyro-std()-X               | f_body_angular_vel_std_X               
428 |428    |       fBodyGyro-std()-Y               | f_body_angular_vel_std_Y               
429 |429    |       fBodyGyro-std()-Z               | f_body_angular_vel_std_Z               
503 |503    |      fBodyAccMag-mean()               | f_body_linear_acc_magnitude_mean               
504 |504    |       fBodyAccMag-std()               | f_body_linear_acc_magnitude_std               
516 |516    |  fBodyBodyAccJerkMag-mean()           | f_body_linear_acc_Jerk_magnitude_mean               
517 |517    | fBodyBodyAccJerkMag-std()             | f_body_linear_acc_Jerk_magnitude_std               
529 |529    | fBodyBodyGyroMag-mean()               | f_body_angular_vel_magnitude_mean               
530 |530    |  fBodyBodyGyroMag-std()               | f_body_angular_vel_magnitude_std               
542 |542    | fBodyBodyGyroJerkMag-mean()           | f_body_angular_vel_Jerk_magnitude_mean               
543 |543    | fBodyBodyGyroJerkMag-std()            | f_body_angular_vel_Jerk_magnitude_std               


Units are described in the feature info from original file. I am pasting it below alonng with the description of the original features. The name change that I did to the features are described above.
from original feature_info.txt

Feature Selection 


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

**2. Producing a tidy data set from the merge data set.**
Using data.table package the mean of each column was calculated according to the subjets and the activities that they were performing. This new table is them write to a file call **tidy_data_set.txt**
