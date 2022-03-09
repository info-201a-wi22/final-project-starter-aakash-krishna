library(shiny)
library(shinyWidgets)
library(plotly)

power_plant_data_csv <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/data/global_power_plant_database_last.csv")

introPage <- tabPanel("Introduction",
                      mainPanel(
                          h2("Purpose"),
                                                      
                          p("As the world population continues to increase at a rapid pace, so does the demand for food and power. 
                            But in order to produce more food and power, huge amounts of greenhouse gases are also generated as a by-product. 
                            Coal and gas power plants that produce most of the power in the world (especially in the US where they account for 
                            ~80% of the electricity production) also produce millions of tons of CO2, which makes up the highest portion of 
                            greenhouse gases in the atmosphere. Livestock around the world emit millions of tons of Methane per year which is 
                            said to be \"25 times more potent than CO2\" (https://www.epa.gov/gmi/importance-methane) according to the EPA. 
                            As every year that CO2 emissions continue to increase, global warming becomes a much more pressing issue. And as the 
                            present methods of renewable energy are plagued with problems such as inefficiency, un-reusable windmills, power storage, 
                            and general complexity and cost to setup, an alternative power source to generate electricity is urgently needed."),
                          
                          p("A viable power source we have identified in our research is nuclear power. While nuclear power is not very common presently, 
                            this is largely due to fear-mongering and historic failures of nuclear power plants, along with pro-coal and gas lobbying done 
                            by coal and gas power plant supporters. As coal and gas power plants are a massively profitable industry in the US and elsewhere, 
                            the adoption of a power production network based of nuclear power has been seriously undermined. And if major changes aren't made 
                            to reduce CO2 emissions, global temperatures will continue to rise unabated and continue to harm both humans and the habitats of 
                            our planet. "),
                          
                          p("Through our research, we identified major benefits to switch to nuclear power plants. Two of these are higher efficiency and more 
                            importantly, no CO2 emissions. As nuclear power used radioactive materials and water, the only gas it emits is steam 
                            (https://www.cnet.com/news/how-nuclear-power-plants-could-help-solve-climate-crisis), which is in no way harmful to the environment. 
                            And regarding the harmful radioactive waste nuclear power plants are purported to create, the little waste they do create are highly 
                            exaggerated as it is low in amount and stored in safe barrels away from human life. In order to solidify the argument on a change to 
                            nuclear power, we analyzed several data sets to learn more about CO2 emissions as well as how efficient nuclear reactors are compared 
                            to other types of power generation. "),
                          
                          p("The following are datasets we analyzed:"),
                          tags$ul(
                            tags$li("1.	Primary-energy-consumption-from-fossilfuels-nuclear-renewables - In order to understand which countries are switching to 
                                    nuclear power generation, we plotted the percent change of nuclear power for several countries over time. The data for this set 
                                    was provided by OWID."),
                            tags$li("2.	owid-co2-data - To identify which countries should prioritize nuclear power and move away from coal and gas power production, 
                                    we used this data set to see which countries have produced the most CO2 emissions over time. The data for this set was provided by OWID."),
                            tags$li("3.	global_power_plant_database_last - Lastly, we used this data set provided by OWID through a Kaggle publication to analyze the efficiency 
                                    of nuclear power plants compared to other types of power generation. ")
                          ),
                          
                          img(src='../docs/intropic1.jpg')
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
                          p("Through our research and visualizations, we found 3 key insights as to what countries 
                           have had the most nuclear power growth, what countries are leading in CO2 emissions as well 
                           as the efficiency of nuclear plants compared to other types of power generation. Firstly, 
                           through our analysis of what countries have seen the most percent change in nuclear power 
                           generation per year, we found that Russia and Brazil have been leading in their adoption 
                           of nuclear power. However, a more important insight is seen by looking at the countries 
                           with lower percent changes. USA, China, and India, which are some of the world's largest 
                           countries and are fairly advanced are growing at a much slower rate at pace along with 
                           countries that are still working on their power generation networks such as Pakistan and 
                           Mexico. Coupled with our second key insight of how China, US, and India are leaders in CO2 
                           emissions and largely overshadow many other countries in total emissions (They make up 
                           more than half of the world's total emissions!)"),
                          img(src='../docs/summary1.png'),
                          p("(https://www.epa.gov/ghgemissions/global-greenhouse-gas-emissions-data)"),
                          p("Lastly, a very important insight we found is that nuclear power is much more efficient compared 
                           to other forms of power generation (coal, gas, renewables such as solar, hydro, etc.). By 
                           aggregating power plant efficiency/capacity data from power plants around the world we found 
                           that in terms of Capacity in MW, Nuclear Power plants can reach up to 2000+ MW, the highest among 
                           the different capacities for each type of power generation plant. This is also about 1000 MW more 
                           than coal power plants. "),
                          img(src='../docs/summary2.png'),
                          p("The implications of this data are extremely important. What it indicates is that not only do we 
                           need an adoption of a nuclear power plant network to sustainably produce power, we also need 
                           coordination and cooperation amongst countries in order to achieve that network. As The largest 
                           populated countries are producing most of the emissions, there needs to be international reform 
                           and accountability measures to ensure that those who have the largest negative impacts on the planet 
                           are working towards sustainable energy practices. As was seen in our analysis, nuclear power is 
                           more than efficient enough and produces no emissions that would speed up global warming. And 
                           considering that the claim that they \"are extremely expensive and long to set up and maintain\", 
                           mostly the same could be said for building coal and gas power plants. What is necessary to 
                           understand is we incur a greater cost when we as a society let these gas and coal power plants be 
                           built, and we would be better off in the long-term by setting up safe and well-maintained nuclear 
                           power plants. ")
                        )
)

reportPage <- tabPanel("Report",
                       mainPanel(
                         h2("Abstract")
                         
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