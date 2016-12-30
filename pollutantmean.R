# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data 
# from the directory specified in the 'directory' argument and returns the mean of the pollutant 
# across all of the monitors, ignoring any missing values coded as NA. 

# I found help here: https://zenagiwa.wordpress.com/2016/06/08/r-programming-assignment-1/

pollutantmean <- function(directory, pollutant, id = 1:332) {
    # Create a list of files
    files <- list.files(directory, full.names = TRUE)
    # Create an empty data frame
    df <- data.frame()
    for(i in id) {
        # Read in the files listed in "id"
        temp <- read.csv(files[i], header=TRUE)
        # Add the files into a data frame
        df <- rbind(df, temp)
    }
    # Find the mean for the specified pollutant 
    return(mean(df[,pollutant], na.rm = TRUE))
}