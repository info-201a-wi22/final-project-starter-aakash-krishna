#dataset
power_plant_data <- read.csv("../data/global_power_plant_database_last.csv") %>%
  filter(primary_fuel != "Waste" & primary_fuel != "Storage" & 
           primary_fuel != "Petcoke" & primary_fuel != "Cogeneration" &
           primary_fuel != "Biomass")

#summary info
summary_info <- list()
summary_info$energy_source_with_most_number_of_power_plants <- power_plant_data %>% 
  group_by(primary_fuel) %>%
  tally() %>% 
  filter(n == max(n)) %>% 
  pull(primary_fuel)
summary_info$most_used_energy_source <- power_plant_data %>% 
  group_by(primary_fuel) %>% 
  summarise(total_capacity = sum(capacity_mw)) %>% 
  filter(total_capacity == max(total_capacity)) %>% 
  pull(primary_fuel)
