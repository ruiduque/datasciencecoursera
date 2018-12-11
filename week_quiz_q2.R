##
## Week3 Quiz - Question 2
##
## Coursera: Getting Data - Week3
##
#
# Using the jpeg package read in the following picture of your instructor into R
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?
# (some Linux systems may produce an answer 638 different for the 30th quantile)

library(jpeg)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,destfile="./data/Fjeff.jpg",method="curl")

pic <- readJPEG("./data/Fjeff.jpg", native = TRUE)

quantile(pic, probs = c(.3,.8))