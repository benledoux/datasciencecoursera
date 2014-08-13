corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
	myfiles <- list.files(path=directory, pattern=".csv", full.names=TRUE)
	mydata <- numeric()
	
	finaldata <- c()

	for(i in 1:length(myfiles)) {
		mydata <- read.csv(myfiles[i])
		mydata <- mydata[complete.cases(mydata),]
		if(nrow(mydata) > threshold) {
			finaldata <- c(finaldata, cor(mydata$sulfate,mydata$nitrate))
		}
	
	}

	return (finaldata) 

}
