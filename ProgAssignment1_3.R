
corr <- function(directory, treshold = 0) {
  
  # Get all files in directory  
  filelist <- list.files(directory, full.names = TRUE)
  
  # Get only number of complete observations by sensor    
  vComplete <- complete(directory, 1:length(filelist))
  
  # Data.Frame with only sensor observations above treshold 
  above_treshold <- vComplete[vComplete$nobs > treshold,]
  
vCorr <- numeric()
  
  if (nrow(above_treshold) > 0) {
    
    for (i in 1:nrow(above_treshold)) {
      
      vRead <- read.csv(file = filelist[above_treshold[["id"]][i]])
      
      vCorr[i] <- cor(vRead[["nitrate"]], vRead[["sulfate"]], use = "complete.obs")
      
    }
  }
  
  vCorr
}