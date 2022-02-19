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

#summary info for chart 2
owid_data_csv <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/data/owid-co2-data.csv")
continents <- c("Asia", "Africa", "North America", "South America", "Europe", "Australia")

summary_info$country_max_emissions <- owid_data_csv %>%
  filter(country %in% continents != TRUE) %>%
  filter(country != "World") %>%
  filter(co2 == max(co2, na.rm = TRUE)) %>%
  pull(country)

exclude <- c("World", "Asia", "Africa", "North America", "South America", "Europe", "Australia", "United States", "China", "Russia", "India")

summary_stat_2 <- owid_data_csv %>%
  filter(country %in% continents != TRUE) %>%
  filter(country %in% exclude != TRUE) %>%
  summarize(median(co2, na.rm = TRUE)) 

country_median_emissions <- country_median_emissions[[1]]

summary_info$country_median_emissions <- country_median_emissions


#Summary info for chart 1

consumption_data_csv <- read.csv("../data/Primary-energy-consumption-from-fossilfuels-nuclear-renewables.csv")
countries <- c("Brazil", "Mexico", "Pakistan", "Bangladesh", "Indonesia")

summary_info$country_max_nuclear_usage <- consumption_data_csv %>%
  filter(Entity %in% countries == TRUE) %>%
  filter(Nuclear....sub.energy. == max(Nuclear....sub.energy., na.rm = TRUE)) %>%
  pull(Entity)

consumption_data_csv <- mutate(consumption_data_csv, ratio = Nuclear....sub.energy./Renewables....sub.energy.);

summary_info$country_highest_nuclear_ratio <- consumption_data_csv %>%
  filter(Entity %in% countries == TRUE) %>%
  filter(ratio == max(ratio, na.rm = TRUE)) %>%
  pull(Entity)
