#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto.
# Author: Irene Huynh
# Date: 24 January 2024
# Contact: irene.huynh@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
toronto_shelters <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/daily-shelter-overnight-service-occupancy-capacity/
  list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93") |>
  # Within that package, we are interested in the 2021 dataset
  filter(name == 
           "toronto-shelter-system-flow.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()

write_csv(
  x = toronto_shelters,
  file = "toronto_shelters.csv"
)


#### Save data ####
write_csv(toronto_shelters, "inputs/data/raw_toronto_shelters_data.csv") 
