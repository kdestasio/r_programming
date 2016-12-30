# Write a function that reads a directory full of files and reports 
# the number of completely observed cases in each data file. 
# The function should return a data frame where the first column 
# is the name of the file and the second column is the number 
# of complete cases.

# I found help here: https://zenagiwa.wordpress.com/2016/06/08/r-programming-assignment-1/


complete <- function(directory, id = 1:332) {
    # Create a list of files
    files <- list.files(directory, full.names = TRUE)
    # Create an empty data frame
    df <- data.frame()
    for(i in id) {
        # Read in the files listed in "id"
        temp <- read.csv(files[i], header=TRUE)
        # Remove rows that do not have complete cases
        temp <- na.omit(temp)
        # Count the rows with complete cases
        completeRows <- nrow(temp)
        # List the complete cases by index
        df <- rbind(df, data.frame(i, completeRows))
    }
    return(df)
}