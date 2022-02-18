library(dplyr)
library(ggplot2)
library(plotly)

setwd("D:/university/INFO201/Assignments/final-project-starter-aakash-krishna")

consumption_data <- read.csv("data/Primary-energy-consumption-from-fossilfuels-nuclear-renewables.csv")

tabl <- consumption_data %>%
  filter(Entity == "Bangladesh" | Entity == "Brazil" | Entity == "China" | Entity == "India" | Entity == "Indonesia" | Entity == "Mexico" |Entity == "Nigeria" |Entity == "Pakistan" |Entity == "Russia" |Entity == "United States") %>%
  select("Entity", "Year", "Renewables....sub.energy." , "Nuclear....sub.energy.") %>%
  
  mutate(ratio = Nuclear....sub.energy./Renewables....sub.energy.) %>%
  mutate(text = paste0("Country: ", Entity, "\nYear: ", Year, "\nRatio of nuclear energy to other renewable energies used: ", ratio)) %>%
  
  ggplot( aes(x = Year, y = Nuclear....sub.energy., size = ratio, color = Entity)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 19), name="Nuclear/Renewable Ratio") +
  scale_color_viridis_d(alpha = 1, begin = 0, end = 1, space = "Lab", na.value = "grey50", guide = "colorsteps")
  theme(legend.title=element_text("Changes in Usage of Nuclear Energy"))

tabl3 <-ggplotly(tabl, tooltip = text)
tabl3