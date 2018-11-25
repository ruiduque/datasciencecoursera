
corr <- function(directory, treshold = 0) {
  
# Get all files in directory  
  filelist <- list.files(directory, full.names = TRUE)

# Get only number of complete observations by sensor    
  vComplete <- complete(directory, 1:length(filelist))
 
# Data.Frame with only sensor observations above treshold 
  above_treshold <- vComplete[vComplete$nobs > treshold,]

  vNitrate <- vSulfate <- numeric()
  
  for (i in 1:nrow(above_treshold)) {
    print(above_treshold[["id"]][i])
    
    
#    vRead <- read.csv(file = filelist[above_treshold[above_treshold[i]$id,]])
#    vNitrate <- c(vNitrate, vRead$nitrate)
#    vSulfate
  }
  
  
  vNitrate

}