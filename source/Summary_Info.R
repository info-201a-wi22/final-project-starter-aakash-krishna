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
  filter(str_detect(owid_data_csv$country, exclude) != TRUE) %>%
  summarize(median(co2, na.rm = TRUE)) 

summary_info$country_median_emissions <- country_median_emissions[[1]]


