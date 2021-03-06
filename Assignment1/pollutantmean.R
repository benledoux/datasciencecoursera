pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

	myfiles <- list.files(path=directory,pattern=".csv", full.names=TRUE)

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

	mydata <- numeric()

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
	
	for(i in id) {
		mydata <- rbind(mydata, read.csv(myfiles[i]))
	}
	mean(mydata[,pollutant], na.rm=TRUE)
}
