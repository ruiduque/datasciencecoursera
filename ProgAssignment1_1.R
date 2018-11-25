
pollutantmean <- function(directory, pollutant, id = 1:332){
  
  filelist <- list.files(directory, full.names = TRUE)
  
  # Init list
  my_vector <- numeric()
  
  for (i in seq_along(id)) {
    
    # Read files      
    my_vector <- c(read.csv(file = filelist[id[i]])[pollutant], my_vector)
  }
  
  # Calculare mean
  mean(unlist(my_vector), na.rm = TRUE)
  
}