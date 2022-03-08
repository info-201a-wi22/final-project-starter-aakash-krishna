library(dplyr)
library(plotly)

owid_data_csv <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/data/owid-co2-data.csv")
power_plant_data_csv <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/data/global_power_plant_database_last.csv")
  
server <- function(input,output) {
  output$page2_chart <- renderPlotly({
    df <- owid_data_csv %>% 
      filter(year >= input$page2_year[1]  & 
               year <= input$page2_year[2] &
               country == input$page2_country)
    df$x <- df[["year"]]
    df$y <- df[[if(input$page2_axis == "CO2") "co2" else "co2_per_capita"]]
    plot <- plot_ly(df, x = ~x, y = ~y, type = "scatter", mode = "lines+markers",
                    hovertemplate = paste(
                      "%{xaxis.title.text}: %{x}<br>",
                      "%{yaxis.title.text}: %{y}<br>"
                    )) %>% 
      layout(xaxis = list( title="Year"), 
             yaxis = list(title=paste(input$page2_axis, "Emissions",
                                       if(input$page2_axis == "CO2") "(in million metric tonnes)" else "(in metric tonnes per person)")),
             title = paste(input$page2_axis, "Output of", input$page2_country, "Over Time"))
    plot
  })
  
  output$page3_chart <- renderPlotly({
    power_plant_data <- if(input$page3_country != "World") 
      power_plant_data_csv %>% 
      filter(country_long == input$page3_country) 
    else power_plant_data_csv
    
    power_plant_data <- power_plant_data %>% filter(primary_fuel %in% input$page3_sources)
    
    power_plant_count <- power_plant_data %>% group_by(primary_fuel) %>% 
      tally() %>% 
      rename(number_of_plants = n)

    power_plant_capacity <- power_plant_data %>% 
      group_by(primary_fuel) %>% 
      summarise(total_capacity = sum(capacity_mw))

    df <- left_join(power_plant_capacity, power_plant_count,
                                       by = "primary_fuel") 
    df$x <- df[["primary_fuel"]]
    df$y <- if(input$page3_axis == "Total Capacity (MW)") 
      df[["total_capacity"]] 
    else if (input$page3_axis == "Number of Power Plants")
      df[["number_of_plants"]]
    else 
      df[["total_capacity"]] / df[["number_of_plants"]]
    plot <- plot_ly(df, x = ~x, y = ~y, type = "bar", color = ~x,
                    hovertemplate = paste(
                      "%{yaxis.title.text}: %{y}<br>"
                    )) %>% 
      layout(xaxis = list(title="Energy Source"), 
             yaxis = list(title=input$page3_axis),
             title = paste(input$page3_axis, "of the", paste(input$page3_country,"'s",sep=""), "Power Plants by Energy Source"))
    plot
  })
}