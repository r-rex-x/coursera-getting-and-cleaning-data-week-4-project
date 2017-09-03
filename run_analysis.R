run_analysis <- function() {
        
        # Read data into R
        subject_test <- read.table("test/subject_test.txt")
        X_test <- read.table("test/X_test.txt")
        y_test <- read.table("test/y_test.txt")
        
        subject_train <- read.table("train/subject_train.txt")
        X_train <- read.table("train/X_train.txt")
        y_train <- read.table("train/y_train.txt")
        
        testdata <- data.frame(subject_test, y_test, X_test)
        traindata <- data.frame(subject_train, y_train, X_train)
        
        
        # 1.
        # Combine test and train data into one dataset
        alldata <- rbind(traindata, testdata)
        
        
        
        # 2.
        # Find out which variables are measurements on mean or standard deviation
        features <- read.table("features.txt")
        features[ ,2] <- as.character(features[ ,2])
        colIndex <- grep(".*mean.*|.*std.*", features[ ,2])
        
        # Extracts only the measurements on the mean and standard deviation
        mydata <- alldata[, c(1, 2, colIndex+2)]
        
        
        
        # 3.
        # Uses descriptive activity names to name the activities in the data set
        activities <- read.table("activity_labels.txt")
        mydata[ ,2] <- factor(mydata[ ,2], levels = activities[ ,1], labels = activities[ ,2])
        
      
        
        # 4.
        # Name all the variables with descriptive names
        
        # Read the variable names from features list
        descriptive.names <- c("ID", "activity", features[colIndex ,2])
        
        # Clean up - & () in variable names
        descriptive.names <- gsub("-mean", "Mean", descriptive.names)
        descriptive.names <- gsub("-std", "Std", descriptive.names)
        descriptive.names <- gsub("[()]", "", descriptive.names)
        descriptive.names <- gsub("[-]", "", descriptive.names)
        
        names(mydata) <- descriptive.names
        
        
        # 5.
        # Create a second, independent tidy data set with the avearge of each vairiable 
        # for each activity and each subject ID
        library(plyr)
        tidydataset <- ddply(mydata, .(ID, activity), function(x) {colMeans(x[ ,3:81])})
        
        # Write the tidy set into a file.
        write.table(tidydataset, file = "tidydataset.txt", row.names = FALSE, quote = FALSE)
}