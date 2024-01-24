#### Preamble ####
# Purpose: Cleans the raw Toronto Shelter System Flow data from opendatatoronto.
# Author: Irene Huynh
# Date: 24 January 2024
# Contact: irene.huynh@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_toronto_shelters_data <- read_csv("inputs/data/raw_toronto_shelters_data.csv")

cleaned_toronto_shelters_data <-
  raw_toronto_shelters_data |> 
  rename(date = date.mmm.yy.) |>
  clean_names() |>
  select(date, population_group, returned_from_housing, newly_identified, 
         actively_homeless, gender_male, gender_female)


#### Save data ####
write_csv(cleaned_toronto_shelters_data, "outputs/data/cleaned_toronto_shelters_data.csv")