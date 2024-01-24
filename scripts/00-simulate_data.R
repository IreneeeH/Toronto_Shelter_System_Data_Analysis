#### Preamble ####
# Purpose: Simulates Toronto Shelter System Flow data from 2018 to 2023.
# Author: Irene Huynh
# Date: 24 January 2024
# Contact: irene.huynh@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(123) # For reproducibility 

n <- 504 # Number of observations/rows in the table

# Dates for each row
 date_seq <- seq.Date(from=mdy("01-01-2018") , to=mdy("12-01-2023"), by="month")
#date <- seq.Date(as.Date("01-01-2018"), as.Date("12-01-2023"), by="month", format="%m-%y")

# Creating n rows with population group as "Chronic", "Refugees", "Families", 
# "Youth", "Single Adult", and "Non-Refugees" in that order, repeating.
population_group_seq <- rep(NA, times=n)
pop_group_tracker <- 1
for(i in 1:n){
  if (pop_group_tracker == 8){
    pop_group_tracker <- 1
  }
  
  if(pop_group_tracker == 1){
    population_group_seq[i] <- "Chronic"
  } else if (pop_group_tracker == 2){
    population_group_seq[i] <- "Refugees"
  } else if (pop_group_tracker == 3){
    population_group_seq[i] <- "Families"
  } else if (pop_group_tracker == 4){
    population_group_seq[i] <- "Youth"
  } else if (pop_group_tracker == 5){
    population_group_seq[i] <- "Single Adult"
  } else if (pop_group_tracker == 6){
    population_group_seq[i] <- "Non-Refugees"
  } else if (pop_group_tracker == 7){
    population_group_seq[i] <- "All Population"
  }
  
  pop_group_tracker <- pop_group_tracker + 1
}

simulated_data <-
  tibble(
    # Use 1 through to 504 to represent each id
    id = 1:504,
    date = rep(x = date_seq, each = 7),
    population_group = population_group_seq,
    # Randomly pick an integer, with replacement, n times
    returned_from_housing = sample(1:200, n, replace=TRUE),
    newly_identified = sample(1:2000, n, replace=TRUE),
    actively_homeless = sample(1:11000, n, replace=TRUE),
    gender_male = sample(1:7000, n, replace=TRUE),
    gender_female = sample(1:5000, n, replace=TRUE),
  )

# Format the date to match the date in the data set
simulated_data$date <- format(as.Date(simulated_data$date), "%b-%y")

simulated_data