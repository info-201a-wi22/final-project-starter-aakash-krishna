library(dplyr)
library(ggplot2)

setwd(".")

power_plant_data <- read.csv("../data/global_power_plant_database_last.csv") %>%
  filter(primary_fuel != "Waste" & primary_fuel != "Storage" & 
           primary_fuel != "Petcoke" & primary_fuel != "Cogeneration" &
           primary_fuel != "Biomass")
          

power_plant_count <- power_plant_data %>% group_by(primary_fuel) %>% 
  tally() %>% 
  rename(number_of_plants = n)

power_plant_capacity <- power_plant_data %>% 
  group_by(primary_fuel) %>% 
  summarise(total_capacity = sum(capacity_mw))

power_plant_aggregate <- left_join(power_plant_capacity, power_plant_count,
                                   by = "primary_fuel") 

ggplot(power_plant_aggregate, aes(fill=primary_fuel, 
                                  y=total_capacity/number_of_plants, 
                                  x = primary_fuel)) + 
  geom_bar(position="stack", stat="identity") +
  ggtitle("Average Efficiency of Power Plants by Energy Source") + 
  xlab("Energy Source") +
  ylab("Average Power Plant Capacity (MW)") + 
  labs(fill='Energy Source') 

