
pollutantmean <- function(directory, pollutant, id = 1:332){
  

  filelist <- list.files(directory, full.names = TRUE)
  
  # Init list
  my_datalist <- list()
  
  vCount <- vector("numeric", 1)
  vSum <- vector("numeric", 1)
  
  # Read files
  for (i in seq_along(id)) {
    
    # Read file      
    my_datalist[[i]] <- read.csv(file = filelist[id[i]])
    
    # Calculate mean
    vCount <- sum(!is.na(my_datalist[[i]][pollutant])) + vCount
    vSum <- sum(my_datalist[[i]][pollutant], na.rm = TRUE) + vSum
    
    mean()
  }
  
  # Calculare mean
  vMean = vSum / vCount
  
  vMean
}