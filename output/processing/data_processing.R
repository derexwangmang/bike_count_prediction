# Data Processing

library(tidyverse)
library(lubridate)

# Reading in data
bike <- read_csv("data/unprocessed/seoul_bike_data.csv", locale = locale(encoding = "ISO-8859-1"))

# Reviewing data
# No missing values
skimr::skim_without_charts(bike)
summary(bike)

# Reformatting with correct types
bike <- bike %>%
  janitor::clean_names() %>%
  # Reformatting with correct types
  mutate(month = month(as.Date(date, "%d/%m/%Y")),
         holiday = factor(holiday)) %>%
  # Replacing month 12 (December) with 0, so that December 2017 comes before January 2018
  mutate(month = replace(month, month == 12, 0)) %>%
  # Retrieving days with only functioning hours
  filter(functioning_day == "Yes") %>%
  # Moving month to first column
  relocate(month) %>%
  # Removing variables from dataset
  select(-c(date, seasons, functioning_day))

# Reviewing processed data
skimr::skim_without_charts(bike)
summary(bike)

# Writes updated data to directory
save(bike, file = "data/processed/intermediate_seoul_bike_data.rda")
