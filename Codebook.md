This document describes the code inside the scrip run_analysis.R, written as a submission to the Getting and Cleaning Data course on Coursera.

The script is divided in 6 parts (from zero to five), as is this codebook.

# PART ZERO
In this part of the code, the library dplyr is loaded, and all the data used in the analysis is also loaded into R.
Eight sets of data are used:

## reading features and activity labels
1) features: this are the names of all the variables recorded in the experiment.
2) activity_label: this contains the index and the names of the 6 different activities performed in the experiment.

It is important to know that the data generated in the experiment was separated in two datasets: the test and train datasets. It was needed to load both datasets separately.

## reading data from the test dataset
xtest: this file contains the record for the differente variables in the test dataset.
ytest: this file contains the index indicating the activity being performed in each record.
test_subject: this file contains the SubjectID of the volunteer who were performing each record.

## reading data from the train dataset
xtrain: this file contains the record for the differente variables in the train dataset.
ytrain: this file contains the index indicating the activity being performed in each record.
train_subject: this file contains the SubjectID of the volunteer who were performing each record.

# PART ONE
Merging the train and test datasets to create a comprehensive dataset:

In this part were created the following datasets:
subject: containing all the subject record from training and testing datasets.
label: containing all the indexes indicating the activity being performed in the training and testing datasets.
x: containg all the record from the training and testing datasets.

In the sequence, this three datasets were bind together, forming the "complete" dataset, contaning all the data from subject, activity being performed and values of the variables.]

# PART TWO
In this second part we subset our "complete" dataset, keeping only the variables that bring mean or standard deviation measuraments.
We do this using the select funcion, in conjunction with the contains function, looking for the strings "mean" and "std".

# PART THREE
In this part we use more descriptive names to describe the activities being performed in each record. Until this point, the activity is described in the "complete" dataset by its index (a number from 1 to 6). We changed it by its descriptive number, present in the dataset "features" loaded in the beginning of the script.

Then we rename our variables to more a descriptive name. The following variables are renamed:
Activities = labels. This variable contains the activity being performed in each record.
SubjectID = subject. This variable represents the ID of the volunteer performing the activity.

# PART FOUR
In this part of the script, we improve the labels of our data, changing abbreviated names by their complete description.
We perform that using gsub funcion. Following are the changes made:
1) Accelerometer < Acc;
2) Gyroscope < Gyro;
3) BodyBody < Body;
4) Magnitude < Mag;
5) Time < ^t;
6) Frequency < ^f;
7) TimeBody < tBody;

# PART FIVE
In this section the data is group by Activity and by SubjectID, and then are calculated the average value of each variable for this gropus.
The resultant dataframe is recorded in the data_summarised dataframe, and it is written in a text file named "Step5_tidy.txt"


