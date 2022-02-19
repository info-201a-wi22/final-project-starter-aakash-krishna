library(dplyr)
library(ggplot2)
library(plotly)

setwd(".")

consumption_data <- read.csv("../data/Primary-energy-consumption-from-fossilfuels-nuclear-renewables.csv")

data <- consumption_data %>%
  filter(Entity == "Bangladesh" | Entity == "Brazil" | Entity == "China" |
           Entity == "India" | Entity == "Indonesia" | Entity == "Mexico" |
           Entity == "Nigeria" |Entity == "Pakistan" |Entity == "Russia" |
           Entity == "United States") %>%
  select("Entity", "Year", "Renewables....sub.energy.", 
         "Nuclear....sub.energy.") %>%
  mutate(ratio = ifelse(Renewables....sub.energy. == 0, 0, Nuclear....sub.energy./Renewables....sub.energy.)) %>%
  mutate(text = paste0("Country: ", Entity, "\nYear: ", Year, "\nRatio of nuclear energy to other renewable energies used: ", ratio))

tabl <- data %>% 
  ggplot(aes(x = Year, y = Nuclear....sub.energy., color = Entity, size = ratio)) + 
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 15), name="Nuclear/Renewable Ratio") +
  ggtitle("Changes in Usage of Nuclear Energy") + 
  xlab("Year") +
  ylab("Percent of Energy from Nuclear") +
  labs(color='Country') 

tabl
