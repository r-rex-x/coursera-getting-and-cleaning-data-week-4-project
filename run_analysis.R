run_analysis <- function() {
        
        # Read data into R
        subject_test <- read.table("test/subject_test.txt")
        X_test <- read.table("test/X_test.txt")
        y_test <- read.table("test/y_test.txt")
        
        subject_train <- read.table("train/subject_train.txt")
        X_train <- read.table("train/X_train.txt")
        y_train <- read.table("train/y_train.txt")
        
        # Name the variables
        features <- read.table("features.txt")
        names(X_test) <- features[,2]
        names(X_train) <- features[,2]
        
        # Match variables with subject ID & activity labels
        names(subject_test) <- "ID"
        names(subject_train) <- "ID"
        names(y_test) <- "activity"
        names(y_train) <- "activity"
        
        testdata <- data.frame(subject_test, y_test, X_test)
        traindata <- data.frame(subject_train, y_train, X_train)
        
        # 1.
        # Combine test and train data into one dataset
        alldata <- rbind(traindata, testdata)
        
        # 2.
        # Find out which variables are measurements on mean or standard deviation
        colIndex <- which(grepl("mean()", names(alldata)) | grepl("std()", names(alldata)))
        
        # Extracts only the measurements on the mean and standard deviation
        mydata <- alldata[, c(1, 2, colIndex)]
        
        # 3.
        # Uses descriptive activity names to name the activities in the data set
        activities <- read.table("activity_labels.txt")
        mydata$activity <- factor(mydata$activity, levels = activities[ ,1], labels = activities[ ,2])
        
        # 4.
        # All varibles in the data set are already labelled with descriptive names 
        # when matched with ID and activity before combining into one dataset.

        # 5.
        # Create a second, independent tidy data set with the avearge of each vairiable 
        # for each activity and each subject ID
        library(plyr)
        tidydataset <- ddply(mydata, .(ID, activity), function(x) {colMeans(x[ ,3:81])})
        
        # Write the tidy set into a file.
        write.table(tidydataset, file = "tidydataset.txt", row.names=FALSE)
}