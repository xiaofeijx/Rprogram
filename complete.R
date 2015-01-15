complete <- function(directory, id=1:332) {
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
  #id=1:332
 # directory <-"specdata"
  source("getmonitor.R")
  nr <-length(id)
  mdf <-data.frame(id=rep(NA, nr), nobs=rep(NA, nr))
  z<-1
  for(i in id){  
    
       myfirstdf <-getmonitor(i,directory,FALSE)
      #if(nchar(as.character(i))==1) fname=paste("00",i,sep="")
      #if(nchar(as.character(i))==2) fname=paste("0",i,sep="")
     # if(nchar(as.character(i))==3) fname=as.character(i)
      
          
   # dir <- paste(directory,"/",fname,".csv",sep="")
    #mydata <- read.csv(dir,header=TRUE)
      
      mdf[z,]$id <-i
      mdf[z,]$nobs <- sum(complete.cases(myfirstdf))
      z<-z+1
  }
  mdf
}
