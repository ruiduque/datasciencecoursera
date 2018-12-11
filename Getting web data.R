##
## Getting Data from the Web
##
## Coursera: Getting Data - Week3
##

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")

summary(restData)

str(restData)

# Standard quantiles
quantile(restData$councilDistrict, na.rm = TRUE)

# For custom quantiles
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))

# To see the distribution of values in a table format, including NAs
table(restData$zipCode,useNA="ifany")

# To see the relationship between two variables i.e. intersection in a two dimensional table
table(restData$councilDistrict,restData$zipCode)
restData[(restData$zipCode == 21227 & restData$councilDistrict==8), c("zipCode","councilDistrict")]

# Check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# Checking for missing values using row & column sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

# Values in a table with specific values/chars
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]

#
# Cross Tabs
#
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit,data=DF)
xt

# Flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt

# Or, to better show the previous cross-tab:
ftable(xt)

# Size of dataset
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")



