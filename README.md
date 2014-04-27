GettingAndCleaning
==================

This repo contains an R script that aggregates and cleans activity data collected by accelerometers of the Galaxy S Smartphone. The data should be in the working directory when running the script. 

The script will first load all of the necessary data in order to develop a dataset that consists of mean, standard deviation, and data desrcibing the subject and activty. 

The script then takes all of the accelerometer data and binds it into one dataframe. 

The script will then take the variable names, loaded in from features.txt, and place then into the dataframe as column labels. the variable names 'subject' and 'activity' are also hard coded into there respective columns.

Next, the script selects only the data that isn't about the subject, activity, mean or standard deviation. this data is put into a dataframe. 

The activity labels are coded in as numbers so the script codes them back into descriptive labels corresponding to the code.

The script then takes the average reading for each column for each subject and activity and outputs a dataframe of these results.



