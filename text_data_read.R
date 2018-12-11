##
## Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
## https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
## Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
## (Hint this is a fixed width file format)


library(tidyverse)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for","nino.txt")
dsample <- read_fwf("nino.txt", fwf_cols(SST = c(29, 32)), skip = 4 )
