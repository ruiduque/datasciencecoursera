
complete <- function(directory, id = 1:32) {
  
  # Need to set working directory
  
  # Init list
  my_output <- data.frame()
  
  # Read files
  for (i in seq_along(id)) {
    
    #Create filename
    if (id[i] < 10) {
      my_files = paste0("00", id[i], ".csv")
    } else if (id[i] < 100) {
      my_files = paste0("0", id[i], ".csv")
    } else {
      my_files = paste0(id[i], ".csv")
    }   
    
    # Derive ouput
    my_output <- rbind(my_output, c(id[i], sum(complete.cases(read.csv(file = my_files)))))
    
  }   
  
  names(my_output) <- c("id","nobs")
  print(my_output)
} 
