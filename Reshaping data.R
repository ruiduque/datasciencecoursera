##
## Reshaping data
##
## Coursera: Getting Data - Week3
##

library(reshape2)
head(mtcars)

# Melting data frames - id is like a key and vars will be in a format of variable & value (KF model?) 
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)

# Casting dataframes
cylData <- dcast(carMelt, cyl ~ variable) #default shows count of observations
cylData

cylData <- dcast(carMelt, cyl ~ variable,mean) #using mean
cylData

# Averaging values

head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum) # Using tapply

# Another way - split
spIns =  split(InsectSprays$count,InsectSprays$spray)
spIns

# Another way - apply
sprCount = lapply(spIns,sum)
sprCount

# Another way - combine
t <- unlist(sprCount)
class(t)


