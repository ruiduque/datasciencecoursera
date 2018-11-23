
pollutantmean <- function(directory, pollutant, id = 1:332){

# Save current directory
  currDir <- getwd()

# Change dir to the one specified in the parameters
  setwd(paste0(currDir,"/",directory))
  
# File names
  my_files = paste0(id, ".csv")
  
# Init list
  my_datalist <- list()
  
# Read files
  for (i in seq_along(my_files)) {
    my_datalist[[i]] <- read.csv(file = my_files[i])
    my_datalist
  }
  
# Set working directory to the old one
  setwd(currDir)
}