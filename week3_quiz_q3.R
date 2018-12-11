##
## Week3 Quiz - Question 3 & 4 & 5
##
## Coursera: Getting Data - Week3
##
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#
# Load the educational data from this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
#
# Match the data based on the country shortcode. How many of the IDs match?
# Sort the data frame in descending order by GDP rank (so United States is last).
# What is the 13th country in the resulting data frame?
# Original data sources:
#  
# http://data.worldbank.org/data-catalog/GDP-ranking-table
#
# http://data.worldbank.org/data-catalog/ed-stats

if(!file.exists("./data")){dir.create("./data")}
file1Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file2Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(file1Url,destfile="./data/Fgdp.csv",method="curl")
download.file(file2Url,destfile="./data/Education.csv",method="curl")

fgdp_df <- read_csv("./data/Fgdp.csv", skip = 3)
educ_df <- read_csv("./data/Education.csv")

joined_df <- fgdp_df %>% rename(CountryCode = 1, DollarVal = 5) %>%
  filter(!is.na(CountryCode) & !is.na(Ranking)) %>%
  select(CountryCode:DollarVal, -X3) %>%
  inner_join(educ_df, by="CountryCode") %>%
  mutate(Ranking = as.numeric(Ranking)) %>%
  arrange(desc(Ranking))

nrow(joined_df)
joined_df[13,]


# Quiz Q4
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
joined_df %>% filter(`Income Group` == "High income: OECD") %>%
  summarise(mean(as.numeric(Ranking)))
# or
joined_df %>% 
  group_by(`Income Group`) %>%
  summarise(mean(as.numeric(Ranking)))

# Quiz Q5
# Cut the GDP ranking into 5 separate quantile groups.
# Make a table versus Income.Group.
# How many countries are Lower middle income but among the 38 nations with highest GDP?
joined_df %>% 
  select(Ranking, `Income Group`) %>%
  mutate(Ranking = as.numeric(Ranking), ntile_split = ntile(Ranking, 5)) %>%
  filter(ntile_split == 1) %>%
  group_by(`Income Group`) %>%
  summarise(sum(ntile_split)) %>%
  print








