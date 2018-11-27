
complete <- function(directory, id = 1:32) {
  
  filelist <- list.files(directory, full.names = TRUE)
  
  # Init list
  my_output <- data.frame()
  
  for (i in seq_along(id)) {
    
    my_output <- rbind(my_output, c(id[i], sum(complete.cases(read.csv(file = filelist[id[i]])))))
    
  }   
  
  colnames(my_output) <- c("id", "nobs")
  my_output
} 

# --
# -- Trying with lapply
#--
complete1 <- function(directory, id = 1:32) {
  
  data.frame(id = id, nobs = sapply(list.files(directory, full.names = TRUE)[id], 
                                    function (filen) {
                                      sum(complete.cases(read.csv(file = filen)))
                                    }), row.names = NULL)

} 
