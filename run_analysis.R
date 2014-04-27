library(reshape2)

## load in all of the test and train data
X_train <- read.table('./UCI HAR dataset/train/X_train.txt')
Y_train <- read.table('./UCI HAR dataset/train/Y_train.txt')
X_test <- read.table('./UCI HAR dataset/test/X_test.txt')
Y_test <- read.table('./UCI HAR dataset/test/Y_test.txt')
subject_test <- read.table('./UCI HAR dataset/test/subject_test.txt')
subject_train <- read.table('./UCI HAR dataset/train/subject_train.txt')
feats <- read.table('./UCI HAR dataset/features.txt')
activity_labels <- read.table('./UCI HAR dataset/activity_labels.txt')

#combines test and train data
test <- cbind(X_test, Y_test, subject_test)
train <- cbind(X_train, Y_train, subject_train)
data <- rbind(test, train)

## extracts the variable names and names the columns of the data
var_names <- feats[,'V2']

for (i in 1:561) {
        names(data)[i] <- as.character(var_names[i])
}
meandata<- data[,grep('mean()',colnames(data),fixed = TRUE)]
stdevdata<- data[,grep('std()',colnames(data),fixed = TRUE)]

names(data)[562] <- 'activity'
names(data)[563] <- 'subject'
act_sub <- data[,562:563]

##sets data as the variables that were previously selected
data <- cbind(meandata,stdevdata,act_sub)

##decodes activity column to make it readable
act_labels <- activity_labels[,2]
data$activity <- factor(data$activity, labels = act_labels)

## melts and reconstructs data to show each subject's average for
## each activity for each variable

datamelt <- melt(data, id.vars = c('activity', 'subject'))
tidyset <- dcast(datamelt, subject + activity ~ variable, mean)

tidyset
