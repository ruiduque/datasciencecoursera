##
## Managing Data Frames with dplyr
##
## Coursera: Getting Data - Week3
##

chicago <- readRDS("./data/chicago.rds")
dim(chicago)
str(chicago)

names(chicago)

## Select function
head(select(chicago, city:dptp))    # all variables between city and dtpt

head(select(chicago, -(city:dptp))) # all variables less the ones between city and dtpt

# .equivalent in R would be...
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

## Filter funciton
chic.f <- filter(chicago, pm25tmean2 > 30)
head(select(chic.f, 1:3, pm25tmean2), 10)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(select(chic.f, 1:3, pm25tmean2, tmpd), 10)

## Arrange function
chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 5)
tail(select(chicago, date, pm25tmean2), 3)

# ...descending order...
chicago <- arrange(chicago, desc(date))
head(select(chicago, date, pm25tmean2), 3)

## Rename function

head(chicago[, 1:5], 3)
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3)

## Mutate function
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm=TRUE))
head(select(chicago, pm25, pm25detrend))

## Group_By function
chicago <- mutate(chicago, 
                  tempcat = factor(1 * (tmpd > 80), 
                                   labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
summarise(hotcold, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2), 
          no2 = median(no2tmean2))

# ...other group_by
chicago <- mutate(chicago, 
                  year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarise(years, pm25 = mean(pm25, na.rm = TRUE), 
          o3 = max(o3tmean2, na.rm = TRUE), 
          no2 = median(no2tmean2, na.rm = TRUE))


## Pipeline %>%

chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% 
  summarise(pm25 = mean(pm25, na.rm = TRUE), 
            o3 = max(o3tmean2, na.rm = TRUE), 
            no2 = median(no2tmean2, na.rm = TRUE))

