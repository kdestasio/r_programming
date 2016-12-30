# Write a function that takes a directory of data files and 
# a threshold for complete cases and calculates the correlation 
# between sulfate and nitrate for monitor locations where 
# the number of completely observed cases (on all variables) 
# is greater than the threshold. The function should return 
# a vector of correlations for the monitors that meet the 
# threshold requirement. If no monitors meet the threshold requirement,
# then the function should return a numeric vector of length 0. 

# Steps:
#   1. Read in the files
#   2. Remove the NAs
#   3. See if the complete cases are above the threshold
#   4. Find the correlation using "cor"

# I found help here: https://zenagiwa.wordpress.com/2016/06/08/r-programming-assignment-1/

corr <- function(directory, threshold = 0) {
    # Create a list of files
    files <- list.files(directory, full.names = TRUE)
    # Create an empty vector
    vec <- vector(mode = "numeric", length = 0)
    for(i in 1:length(files)) {
        # Read in the files
        temp <- read.csv(files[i], header=TRUE)
        # Remove NAs
        temp <- temp[complete.cases(temp),]
        # Count the number of observations
        completeCases <- nrow(temp)
        # If the number of rows is greater than the threshold
        if(completeCases>threshold){
            # Run the correlation
            df <- c(df, cor(temp$nitrate, temp$sulfate))
        }
    }
    return(df)
}