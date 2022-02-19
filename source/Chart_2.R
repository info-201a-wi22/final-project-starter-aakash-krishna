library("ggplot2")
library("dplyr")
library("stringr")
library("tidyverse")

owid_data_csv <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/data/owid-co2-data.csv")
continents <- c("Asia", "Africa", "North America", "South America", "Europe", "Australia")

country_max_emissions <- owid_data_csv %>%
  filter(country %in% continents != TRUE) %>%
  filter(country != "World") %>%
  filter(co2 == max(co2, na.rm = TRUE)) %>%
  pull(country)

exclude <- c("World", "Asia", "Africa", "North America", "South America", "Europe", "Australia", "United States", "China", "Russia", "India")

summary_stat_2 <- owid_data_csv %>%
  filter(country %in% continents != TRUE) %>%
  filter(str_detect(owid_data_csv$country, exclude) != TRUE) %>%
  summarize(median(co2, na.rm = TRUE)) 

country_median_emissions <- country_median_emissions[[1]]
  

by_country_df <- owid_data_csv %>%
  filter(population > 128800000) %>%
  filter(country %in% continents != TRUE) %>%
  filter(country != "World") %>%
  filter(year > 1950) %>%
  mutate(country = fct_reorder2(country, year, co2)) %>%
  group_by(country) %>%

  select(country, year, co2)



chart2 <- ggplot(data = by_country_df) +
  geom_line(
    mapping = aes(x = year, y = co2, color = country), size = 1.5)  +
  ggtitle("CO2 Emissions of Highly Populated Countries (100m+) by Year") +
  ylab("CO2 Emissions (in million metric tons)") +
  xlab("Year")



View(by_country_df)
