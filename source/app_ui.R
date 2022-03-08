library(shiny)
library(shinyWidgets)
library(plotly)

power_plant_data_csv <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/data/global_power_plant_database_last.csv")

introPage <- tabPanel("Introduction",
                      mainPanel(
                        h2("Purpose"),
                        p("Lorem Ipsum")
                      )
)

interPage1 <- tabPanel("Interactive Page 1",
                       sidebarLayout(
                         sidebarPanel(
                           h2("Widgets"),
                         ),
                         mainPanel(
                           h2("Chart")
                         )
                       )
)

interPage2 <- tabPanel("Interactive Page 2",
                        sidebarLayout(
                          sidebarPanel(
                            h2("Widgets"),
                            sliderInput("page2_year", label = "Year", min = 1950, 
                                       max = 2020, value = c(1950, 2020)),
                            selectInput("page2_country", "Country", c("World", "United States", "China", "India", "Russia", 
                                                                      "Mongolia", "New Caledonia", "Qatar", "Trinidad and Tobago", 
                                                                      "Indonesia", "Brazil", "Mexico", "Pakistan", 
                                                                      "Nigeria", "Bangladesh"), selected = "World"),
                            selectInput("page2_axis", "Value", c("CO2", "CO2 Per Capita"), selected = "CO2"),
                           
                          ),
                          mainPanel(
                            h2("Chart"),
                            plotlyOutput("page2_chart", height = "600px"),
                            h4("Reasoning"),
                            p("In order to better understand the actual impact of each countries’ CO2 emissions on total emissions, we 
                              utilized data from the Owid CO2 Emissions dataset."),
                            p("After plotting the CO2 emissions of each country in the 
                              subset by year, we found that out of a reported ~30 billion metric tons, the top 4 countries (China, 
                              the US, India, and Russia) produce ~50% of the total global carbon emissions. This indicates that in 
                              order to effectively reduce climate change, a large-scale adoptsion of nuclear energy is more needed in  
                              highly populated countries which have high power consumption needs.")
                          )
                        )
)

interPage3 <- tabPanel("Interactive Page 3",
                       sidebarLayout(
                         sidebarPanel(
                           h2("Widgets"),
                           selectInput("page3_country", "Country", c("World", "United States of America", "China", "India", "Russia", 
                                                                     "Mongolia", "Qatar", "Trinidad and Tobago", 
                                                                     "Indonesia", "Brazil", "Mexico", "Pakistan", 
                                                                     "Nigeria", "Bangladesh"), selected = "World"),
                           pickerInput("page3_sources","Energy Sources", 
                                       choices=unique(power_plant_data_csv$primary_fuel), options = list(`actions-box` = TRUE),
                                       multiple = T, selected = c("Coal", "Gas", "Geothermal", "Hydro", 
                                                                  "Nuclear", "Oil", "Other", "Solar", 
                                                                  "Wave and Tidal", "Wind")),
                           selectInput("page3_axis", "Value", c("Average Power Plant Capacity (MW)", "Total Capacity (MW)", 
                                                                "Number of Power Plants"), 
                                       selected = "Average Power Plant Capacity")
                         ),
                         mainPanel(
                           h2("Chart"),
                           plotlyOutput("page3_chart", height = "600px"),
                           h4("Reasoning"),
                           p("For the purpose of comparing the efficiency of various power sources in generating energy, we used 
                             a Kaggle data set detailing power plants around the world with the type and amount of energy they produce."),
                           p("The results showed that nuclear energy is easily the most efficient form of energy generation, more than 
                             doubling the average capacity of its closest competitor, coal, and reaching more than 100 times the power 
                             generating capacity of solar energy. This shows that efforts made towards developing safe nuclear plants 
                             would help countries generate much more power in the long run as opposed to current solutions.")
                         )
                       )
)

summaryPage <- tabPanel("Takeaways",
                        mainPanel(
                          h2("Summary"),
                          p("Lorem Ipsum")
                        )
)

reportPage <- tabPanel("Report",
                       mainPanel(
                         h2("Abstract"),
                         p("Lorem Ipsum")
                       )
)

ui <- navbarPage("Analysis of Nuclear Energy",
                 introPage,
                 interPage1,
                 interPage2,
                 interPage3,
                 summaryPage,
                 reportPage
)