## Register an application with the Github API here https://github.com/settings/applications.
## Access the API to get information on your instructors repositories
## (hint: this is the url you want "https://api.github.com/users/jtleek/repos").
## Use this data to find the time that the datasharing repo was created. What time was it created?
## This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r).

library(httr)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "3f2597217839df6ab422",
                   secret = "c9503fad28ef2c6f84955b9fe544888feab867ba")

# 3. Get OAuth credentials


# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

# RS - start JSON processing
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

library(dplyr)
myDT <- as_tibble(json2) 

json2 %>%
  select("name", "created_at") %>%
  filter(name == "datasharing") %>%
  print
  
  
  