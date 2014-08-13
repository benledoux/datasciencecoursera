complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

	myfiles <- list.files(path=directory,pattern=".csv", full.names=TRUE)
	mydata <- numeric()

	completeList = data.frame()

	nobs <- rep(0, times = length(id))

	j<-1

	for(i in id) {
		mydata <- read.csv(myfiles[i])
		ok <- sum(complete.cases(mydata))
		nobs[j] <- ok
		j<- j+1
	}
	completeList<-data.frame(cbind(id,nobs))
	completeList
}
