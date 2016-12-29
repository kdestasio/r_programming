##############################
# Practice Writing Functions #
##############################

## Add 2 numbers together
add2 <- function(x, y) {
        x + y
}

## List those numbers in a vector that are greater than 10
above10 <- function(x) {
        use <- x > 10     # Assign an object to return a logical vector of TRUEs and FALSEs to determine which element of x is greater than 10
        x[use]  # Returns the subset of the vector x that is greater than 10
}

## Allow the user to specifya number other than 10
above <- function(x, n = 10) {      # The default is 10, but the user can peciy a diff. number if they want
        use <- x > n
        x[use]
}

columnMeans <- function(y) {
    nc <- ncol(y)       # Figure out the number of columns y has
    means <- numeric(nc)        # Initialize a vector that will store the means for each column
    for(i in 1:nc) {        # Creates an integer vector starting at 1 through the number of columns
        means[i] <- mean(y[, i]) 
    }
    means       # Return the vector of means
}  