library(dplyr)

setwd(".")

power_plant_data <- read.csv("../data/global_power_plant_database_last.csv") %>%
  filter(primary_fuel != "Waste" & primary_fuel != "Storage" & 
           primary_fuel != "Petcoke" & primary_fuel != "Cogeneration" &
           primary_fuel != "Biomass")

#aggregate table setup
power_plant_count <- power_plant_data %>% group_by(primary_fuel) %>% 
  tally() %>% 
  rename(number_of_plants = n)
power_plant_capacity <- power_plant_data %>% 
  group_by(primary_fuel) %>% 
  summarise(total_capacity = sum(capacity_mw))

# the actual aggregate table
aggregate_table <- left_join(power_plant_capacity, power_plant_count,
                                   by = "primary_fuel") %>% 
  mutate(Average_MW_Capacity_per_Plant = total_capacity/number_of_plants) %>%
  arrange(desc(Average_MW_Capacity_per_Plant)) %>% 
  rename(Energy_Source = primary_fuel) %>%
  rename(Total_MW_Capacity_in_the_World = total_capacity) %>% 
  rename(Number_of_Plants_in_the_World = number_of_plants) %>% 
  mutate_if(is.numeric, round)
