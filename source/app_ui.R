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
                          tags$ol(
                            tags$li("Primary-energy-consumption-from-fossilfuels-nuclear-renewables - In order to understand which countries are switching to 
                                    nuclear power generation, we plotted the percent change of nuclear power for several countries over time. The data for this set 
                                    was provided by OWID."),
                            tags$li("owid-co2-data - To identify which countries should prioritize nuclear power and move away from coal and gas power production, 
                                    we used this data set to see which countries have produced the most CO2 emissions over time. The data for this set was provided by OWID."),
                            tags$li("global_power_plant_database_last - Lastly, we used this data set provided by OWID through a Kaggle publication to analyze the efficiency 
                                    of nuclear power plants compared to other types of power generation. ")
                          ),
                          
                          img(src='https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/docs/intropic1.jpg')
                      )
)

interPage1 <- tabPanel("Interactive Page 1",
                       sidebarLayout(
                         sidebarPanel(
                           h2("Widgets"),
                           sliderInput("page1_year", label = "Year", min = 1965,
                                       max = 2019, value = c(1965, 2019)),
                           selectInput("page1_country", "Entity", c("World", "Brazil", "China", "India", "Mexico",
                                                                    "Pakistan", "Russia", "United States",
                                                                    "Mexico", "Japan"), selected = "World"),
                         ),
                         mainPanel(
                           h2("Chart"),
                           plotlyOutput("page1_chart", height = "600px"),
                           h4("Reasoning"),
                           p("In order to understand how the usage of nuclear energy has changed in the last 50 
                             years, we utilized data from the Kaggle dataset studying methods of primary 
                             energy consumption."),
                           p("After plotting this data, we discovered that")
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
                            p("In order to better understand the actual impact of each countriesâ€™ CO2 emissions on total emissions, we 
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
                          img(src='https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/docs/summary1.png'),
                          p("(https://www.epa.gov/ghgemissions/global-greenhouse-gas-emissions-data)"),
                          p("Lastly, a very important insight we found is that nuclear power is much more efficient compared 
                           to other forms of power generation (coal, gas, renewables such as solar, hydro, etc.). By 
                           aggregating power plant efficiency/capacity data from power plants around the world we found 
                           that in terms of Capacity in MW, Nuclear Power plants can reach up to 2000+ MW, the highest among 
                           the different capacities for each type of power generation plant. This is also about 1000 MW more 
                           than coal power plants. "),
                          img(src='https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-aakash-krishna/main/docs/summary2.png'),
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
                         h2("Title: Analysis of Nuclear Energy"),
                         h2("Authors: Aakash Krishna, Ajay Pai, Zohaib Javed"),
                         h2("Date: 3-9-22"),
                         h2("Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
                         h2("Keywords: nuclear energy; climate change; greenhouse gas; alternative energy source"),
                         
                         h3("Abstract"),
                         p("With the threat of climate change seemingly looming over us constantly, it becomes more and more important by the day to find solutions to reduce the amount of greenhouse gases that contribute to rising temperatures. One of the main contributing greenhouse gases is CO2. As CO2 makes up a large part of greenhouse gases that are causing rising temperatures, reducing its content in the atmosphere would help to offset the adverse effects of climate change. In order to identify a reliable alternative energy source that would both have sufficient energy output and low emissions, we analyzed several data set. Through our analysis, we observed largest CO2 emissions by country, efficiency of nuclear power plants, as well as current prevalence of nuclear energy in the world today. "),
                         
                         h3("Introduction"),
                         p("Due to rising temperatures in recent decades, many geological and ecological disasters have been occurring with higher frequencies. These rising temperatures are a consequence of large amounts of greenhouses gases being trapped in the atmosphere. Of these gases, CO2 has been a large determinant in trapping more heat from the sun, resulting in global warming. Much of the CO2 emitted into our atmosphere is caused by power generation from coal and natural gas factories. If global warming is to be slowed, let alone stopped, it is imperative that low CO2 emitting alternative power source is adopted. "),
                         
                         h3("Design Situation"),
                         p("It is an unchangeable fact the consuming and converting natural resources is the basic condition of our lives. However, human beings have never stopped acquiring natural resources. Instead of focusing on sustainable practices, we have for a long time focused only on consumption. In  past agricultural societies people mainly relied on natural resources such as land, sunshine and water to survive. However, with the advent of the Industrial revolution, extracting the mineral resources buried underground and putting them through industrial processes to create new materials and energy has become the norm. At the same time, this industrialization has also increased the development and utilization of other natural resources. However, with these normalized industrial practices have also brought about negative consequences."),

                         p("When the speed of human acquisition of natural resources exceeds the speed of supply, regeneration and proliferation of natural resources, the problem of shortage of natural resources will appear. According to the article [*Global production distribution of non-renewable energy resources 2008-2018*](https://www.statista.com/statistics/263232/global-production-of-non-renewable-energy-resources/#statisticContainer) published by N. Sönnichsen, Dec 22, 2021, which shows the distribution of selected energy carriers as a share of non-renewable energy production worldwide from 2007 to 2018. We can see that petroleum, hard coal and natural gas take up more than 90%."),

                         p("Besides the problem of depletion, overloaded use of non-renewable resources could also cause serious environmental problems. For example, one impact of using non-renewable energy sources is the emission of greenhouse gases, in particular carbon dioxide and methane, which contribute to climate change, according to the article [*Harmful Effects of Non-Renewable Resources on the Environment*](https://greentumble.com/harmful-effects-of-non-renewable-resources-on-the-environment/) published by Greentumble in Feb 23, 2017:"),

                         p("> Coal is considered the worst emitter of carbon dioxide. In the US, CO2 emissions from the electric power sector calculated in 2015 indicate that 71 percent were attributable to coal. While for example natural gas produced around 28 percent of carbon dioxide emissions. Indeed, natural gas emits a lot less carbon dioxide, specifically 50 to 60 percent less compared to coal, and it also emits 15 to 20 percent fewer heat-trapping gases compared to gasoline when used to power a vehicle.However, that does not mean that natural gas can help mitigate climate change, as drilling and extracting natural gas from wells results in the leakage of methane, which is a much more potent greenhouse gas - it is 34 times stronger than CO2 in terms of its potential for trapping heat."),

                         p("The concerns about greenhouse gas emissions and climate change are cross-cutting, and the main resources humans are using is limited. Therefore,  it is necessary to look at alternative energy, our group's focus being on nuclear energy."),

                         p("First, the uranium is the main resource used in nuclear power generation. This element might be the key factor to the sustainable development in the future."),

                         p("> \"As new power reactors come online and others are retired, proper supply and management of uranium will be a critical factor in energy supply in the coming decades,\" said Adrienne Hanly, uranium resources specialist at the IAEA. \"Uraniumbased fuel is expected to remain a basic, reliable source for low-carbon nuclear power. How we utilize this fuel will greatly depend on the development of new technologies and strategies for sustainable resource management.\""),
                          
                         p("Nuclear power also causes less damage to the climate. A journalist Daniel Van Boom says this in his article [*How Nuclear Power Plants Could Help Solve the Climate Crisis*](https://www.cnet.com/news/how-nuclear-power-plants-could-help-solve-climate-crisis/) on Nov. 16, 2021."),
                         
                         p("> Though the word evokes images of landscapes pulverized by atomic calamity -- Hiroshima, Chernobyl, Fukushima -- proponents like Detering and his colleague Eric Dawson point out that nuclear power produces huge amounts of electricity while emitting next to no carbon.This separates it from fossil fuels, which are consistent but dirty, and renewables, which are clean but weather dependent. Contrary to their apocalyptic reputation, nuclear power plants are relatively safe. Coal power is estimated to kill around 350 times as many people per terawatt-hour of energy produced, mostly from air pollution, compared to nuclear power."),

                         p("Overall, nuclear energy seems to be an alternative energy that could be largely used in the future mainly due to its near zero CO2 emissions. Through our analysis we also found how Nuclear Energy can be very efficient compared to other sources of energy."),
                         
                         h3("Research Questions"),
                         p("We ask these questions in hopes of gaining a better understanding of the viability of nuclear energy as an effective deterrent to climate change."),
                         
                         tags$ol(
                           tags$li("How prevalent is nuclear energy in the world right now? Question 1's goal is to inform the rest of our analysis by creating the necessary context about the world's current nuclear energy production. We will answer this by looking at data on each country's nuclear energy production, the number of power plants in each country, etc..."),
                           tags$li("How does nuclear energy contribute to climate change? Question 2's goal is to question the extent at which nuclear energy benefits or harms the climate. We will answer this by looking at data on greenhouse gas emissions from nuclear power plants as well as comparing climate data and nuclear power plant data."),
                           tags$li("How does nuclear energy compare to other forms of alternative energy? Question 4's goal is to determine if other forms of alternative energy (solar, wind, etc.) are more or less viable than nuclear energy. One way we will answer this is by comparing the energy production of each form of energy."),
                         ),
                  
                         h3("Datasets"),
                         tags$ol(
                            tags$li("Our first chart utilized the Primary-energy-consumption-from-fossilfuels-nuclear-renewables data set. Using this data set we plotted nuclear energy output over several decades of different countries and found the top 10 countries that generated the most nuclear energy. As we used the percent change in nuclear energy, we found that the among the top countries, the US, Russia, and Indonesia have seen large growth in the amount of energy provided by nuclear power plants. The data set was narrowed down to 3 columns and several thousand rows in order to show the appropriate data. "),
                            tags$li("Our second chart utilized the owid co2 data set. This extensive data set had more than 15k+ rows as well as more than 20 columns. We chose 3 columns to show appropriate data and plot Co2 emissions for country by year. Specifically we used the co2 (co2 emitted in million metric tons), year, and country columns. In order to show an appropriate range, we filtered the dataset to countries with populations over 100 million. This ensured that a large multitude of countries that had near zero/low co2 emissions weren't included. "),
                            tags$li("For our last chart, we used the global_power_plant_database_last csv. This data set had more than 15+ columns and upwards of 20k rows. We looked at the primary fuel source and country column in order to determine aggregate counts of different type of energy plants.")
                         ),
                         
                         h3("Findings"),
                         p("We asked the following questions in hopes of gaining a better understanding of the viability of nuclear energy as an effective deterrent to climate change.:"),
                         tags$ol(
                           tags$li("How prevalent is nuclear energy in the world right now? Question 1's goal is to inform the rest of our analysis by creating the necessary context about the world's current nuclear energy production. In analyzing our data set, we chose to graph the highest percent change of nuclear power for many different countries over a time frame of ~60 years. What we found was that Brazil and Russia had had the most growth in creating more energy from their nuclear power plants. What was interesting was that even though Russia and Brazil did have high growth, countries that produce large amounts of CO2, such as China, India, and the US had relatively low growth. We found many other countries to also have low growth, but they also don't have much CO2 emissions, so their nuclear energy produced isn't as necessary. "),
                           tags$li("Where is the most CO2 emission happening?  Question 2's goal: In order to be able to effectively undermine the effects of global warming by building nuclear power plants that have zero CO2 emissions, it is necessary to understand which countries have the largest CO2 emissions into the atmosphere. By plotting CO2 emissions of highly populated countries over time, we found that China, India, and Russia are the largest emitters of CO2. This is especially important as it allows us to know where the most effective locations would be to curb climate change as rapidly as possible. By decreasing the CO2 emissions of the worlds leading emitters, we can bring the amount of greenhouse gases in the atmosphere while using an efficient power source. "),
                           tags$li("How does nuclear energy compare to other forms of alternative energy? Question 4's goal is to determine if other forms of alternative energy (solar, wind, etc.) are more or less viable than nuclear energy. One way we will answer this is by comparing the energy production of each form of power plant. Lastly, we used a data set which contained thousands of power plants located around the world. We aggregated each type of power plant and their respective power capacity. We found that the average nuclear powerplant dominates all other power plants with a 2000 MW capacity compared to the average capacity of coal power plants at about ~800 MW. Considering the fact that nuclear power plants don't have any greenhouse gas emissions, this provides a huge advantage to the typical power production plants we have today whether they are renewable or non-renewable. ")
                         )
                         
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