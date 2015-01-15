pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  #directory <-"specdata"
 # pollutant <- "sulfate"
  #id <- 2
  totalpol <-0
  totalrow <- 0
  for (i in id) {
    if(nchar(as.character(i))==1) i=paste("00",i,sep="")
    if(nchar(as.character(i))==2) i=paste("0",i,sep="")
    dir <- paste(directory,"/",i,".csv",sep="")
    mydata <- read.csv(dir)
    totalpol <- sum(mydata[,pollutant],na.rm=T)+totalpol
    totalrow <- sum(!is.na(mydata[,pollutant]))+totalrow
      }
  
  totalmean <-round(totalpol/totalrow,3)
  return(totalmean)
}

