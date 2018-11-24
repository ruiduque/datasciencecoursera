
pollutantmean <- function(directory, pollutant, id = 1:332){
  
  # Save current directory
  #  currDir <- getwd()
  
  # Change dir to the one specified in the parameters
  #  setwd(paste0(currDir,"/",directory))
  
  
  # Init list
  my_datalist <- list()
  my_files <- vector()
  vCount <- vector("numeric", 1)
  vSum <- vector("numeric", 1)
  
  # Read files
  for (i in seq_along(id)) {
    
    # Create Filename   
    if (id[i] < 10) {
      my_files = paste0("00", id[i], ".csv")
    } else if (id[i] < 100) {
      my_files = paste0("0", id[i], ".csv")
    } else {
      my_files = paste0(id[i], ".csv")
    }
    
    # Read file      
    my_datalist[[i]] <- read.csv(file = my_files)
    
    # Calculate mean
    vCount <- sum(!is.na(my_datalist[[i]][pollutant])) + vCount
    vSum <- sum(my_datalist[[i]][pollutant], na.rm = TRUE) + vSum
    print(paste("Count:",vCount," Sum:",vSum))
  }
  
  
  # Set working directory to the old one
  #  setwd(currDir)
  
  # Calculare mean
  vMean = vSum / vCount
  
  print(vMean)
}