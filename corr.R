corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  corrdf <-as.numeric()
  z <-1
 #directory <-"specdata"
  source("complete.R")
  for(i in 1:332){
    #i <-2
    ncomplete <- complete(directory,i)$nobs
    
    if(ncomplete > threshold){
      df <-getmonitor(i,directory)
      ndf <-df[complete.cases(df),]
      dd <- cor(ndf$nitrate,ndf$sulfate)
      corrdf[z] <-dd
      z <-z+1
    }
    
  }
  
  return(corrdf)
}