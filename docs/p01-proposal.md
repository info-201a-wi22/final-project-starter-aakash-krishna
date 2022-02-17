# Analysis of Nuclear Energy

## Code Name
No Emissions

## Authors
Zohaib Javed:	zjaved@uw.edu \
Aakash Krishna:	ak8271@uw.edu \
Christopher Li:	qiaol4@uw.edu \
Ajay Pai:	ajaypai@uw.edu

## Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Date
February 4, Winter 2022

## Abstract
Our main question is if nuclear energy can be a viable alternative energy source. This question is important because major changes in power generation are needed to reduce emissions and slow climate change. To address this question, we will analyze data about greenhouse gas emissions as well as global energy production and consumption.

## Keywords
nuclear energy; climate change; greenhouse gas

## Proposal
### 1.0 Introduction
According to [*NASA*](https://climate.nasa.gov/effects/),

> The effects of human-caused global warming are happening now, are irreversible on the timescale of people alive today, and will worsen in the decades to come.

In the last few years, due to global warming, we’ve seen longer, more intense heat waves and droughts as well as an increase in the number, duration, and intensity of tropical storms. With the climate deteriorating, it is imperative that we seek out alternative and renewable forms of energy. Popular examples of renewable energy are wind, hydroelectric and solar energy. That being said, in this project we intend to analyze the viability of nuclear energy as an effective deterrent to climate change.

### 2.0 Design Situation
We all know that the natural resource is the basic condition of our lives. However, human beings have never stopped acquiring natural resources since our birth. In agricultural society, people mainly rely on natural resources such as land, sunshine and water to survive. In the industrial society, people dig out the mineral resources buried underground and put them into industrial production as raw materials and fuels. At the same time, they also increase the development and utilization of other natural resources.

When the speed of human acquisition of natural resources exceeds the speed of supply, regeneration and proliferation of natural resources, the problem of shortage of natural resources will appear. According to the article [*Global production distribution of non-renewable energy resources 2008-2018*](https://www.statista.com/statistics/263232/global-production-of-non-renewable-energy-resources/#statisticContainer) published by N. Sönnichsen, Dec 22, 2021, which shows the distribution of selected energy carriers as a share of non-renewable energy production worldwide from 2007 to 2018. We can see that petroleum, hard coal and natural gas take up more than 90%.

Besides the problem of depletion, overloaded use of non-renewable resources could also cause serious environmental problems. For example, one impact of using non-renewable energy sources is the emission of greenhouse gases, in particular carbon dioxide and methane, which contribute to climate change, according to the article [*Harmful Effects of Non-Renewable Resources on the Environment*](https://greentumble.com/harmful-effects-of-non-renewable-resources-on-the-environment/) published by Greentumble in Feb 23, 2017:

> Coal is considered the worst emitter of carbon dioxide. In the US, CO2 emissions from the electric power sector calculated in 2015 indicate that 71 percent were attributable to coal. While for example natural gas produced around 28 percent of carbon dioxide emissions. Indeed, natural gas emits a lot less carbon dioxide, specifically 50 to 60 percent less compared to coal, and it also emits 15 to 20 percent fewer heat-trapping gases compared to gasoline when used to power a vehicle.However, that does not mean that natural gas can help mitigate climate change, as drilling and extracting natural gas from wells results in the leakage of methane, which is a much more potent greenhouse gas – it is 34 times stronger than CO2 in terms of its potential for trapping heat.

The concerns about greenhouse gas emissions and climate change are cross-cutting, and the main resources humans are using is limited. Therefore,  it is necessary to look at alternative energy, our group's focus being on nuclear energy.

First, the uranium is the main resource used in nuclear power generation. This element might be the key factor to the sustainable development in the future.

> “As new power reactors come online and others are retired, proper supply and management of uranium will be a critical factor in energy supply in the coming decades,” said Adrienne Hanly, uranium resources specialist at the IAEA. “Uraniumbased fuel is expected to remain a basic, reliable source for low-carbon nuclear power. How we utilize this fuel will greatly depend on the development of new technologies and strategies for sustainable resource management.”

Nuclear power also causes less damage to the climate. A journalist Daniel Van Boom says this in his article [*How Nuclear Power Plants Could Help Solve the Climate Crisis*](https://www.cnet.com/news/how-nuclear-power-plants-could-help-solve-climate-crisis/) on Nov. 16, 2021.

> Though the word evokes images of landscapes pulverized by atomic calamity -- Hiroshima, Chernobyl, Fukushima -- proponents like Detering and his colleague Eric Dawson point out that nuclear power produces huge amounts of electricity while emitting next to no carbon.This separates it from fossil fuels, which are consistent but dirty, and renewables, which are clean but weather dependent. Contrary to their apocalyptic reputation, nuclear power plants are relatively safe. Coal power is estimated to kill around 350 times as many people per terawatt-hour of energy produced, mostly from air pollution, compared to nuclear power.

Overall, nuclear energy seems to be an alternative energy that could be largely used in the future. However, there are definitely disadvantages, and our group will perform research and analyze data, trying to figure out if it is possible to popularize the use of nuclear energy.

### 3.0 Research Questions
We ask these questions in hopes of gaining a better understanding of the viability of nuclear energy as an effective deterrent to climate change.
1. _**How prevalent is nuclear energy in the world right now?**_ \
Question 1’s goal is to inform the rest of our analysis by creating the necessary context about the world’s current nuclear energy production. We will answer this by looking at data on each country’s nuclear energy production, the number of power plants in each country, etc...
2. _**How does nuclear energy contribute to climate change?**_ \
Question 2’s goal is to question the extent at which nuclear energy benefits or harms the climate. We will answer this by looking at data on greenhouse gas emissions from nuclear power plants as well as comparing climate data and nuclear power plant data.
3. _**How do nuclear power plants affect human population?**_ \
Question 3’s goal is to question the extent at which nuclear energy benefits or harms people. We will answer this by looking at data related to health incidents around nuclear power plants as well as population density around power plants.
4. _**How does nuclear energy compare to other forms of alternative energy?**_ \
Question 4’s goal is to determine if other forms of alternative energy (solar, wind, etc…) are more or less viable than nuclear energy. One way we will answer this is by comparing the energy production of each form of energy.

### 4.0 The Dataset
For our project, we have identified several datasets that we can employ to help answer some of our research questions.

#### Datasets 1 and 2

Our first two datasets come from this Kaggle link: [*Renewable vs Nuclear Energy generation (1965-)*](https://www.kaggle.com/donjoeml/energy-consumption-and-generation-in-the-globe?select=Primary-energy-consumption-from-fossilfuels-nuclear-renewables.csv)

There are several datasets in this link and they come from a well-respected and well-known scientific publication that specializes in data analysis. This publication is known as **Our World In Data**. Researchers Hannah Ritchie and Max Roser have compiled data from the following sources to create these datasets:

* Energy consumption (primary energy, energy mix and energy intensity): this data is sourced from a combination of two sources—the BP Statistical Review of World Energy and SHIFT Data Portal.
* Electricity consumption (electricity consumption, and electricity mix): this data is sourced from a combination of two sources—the BP Statistical Review of World Energy and EMBER – Global Electricity Dashboard.
* Other variables: this data is collected from a variety of sources (United Nations, World Bank, Gapminder, Maddison Project Database, etc.). More information is available in our codebook.

Two specific datasets we plan to use from this Kaggle link are the **“Primary-energy-consumption-from-fossilfuels-nuclear-renewables”** and the **“global_power_plant_database_last”** dataset. **The first dataset contains 6 columns and about 4000+ rows of data concerning countries’ energy production by type**. The columns include information such as the country name, code, year, and nuclear/renewable/energy consumption as a percent for each country. **The second dataset includes more than 10000 rows and 6+ columns regarding power plant locations around the world**. The columns contain information on country names, power plant names, type of power plant (gas, renewable, nuclear), and the year it was commissioned, etc.

Again, OWID collected the data for these datasets through reputable sources such as the UN and the BP Review of World Energy. This helps to maintain data validity and ensure the data was collected appropriately.

**These first two datasets will help answer our research questions regarding the prevalence of nuclear reactors globally.**

#### Dataset 3

Our next dataset also comes from OWID through one of their public github repositories [*CO2 Data*](https://github.com/owid/co2-data). **This dataset (owid-co2-data) contains over 20,000 rows and over 20 columns. The columns in this dataset contain information on different countries’ CO2 emissions** throughout the years, country GDP, as well as CO2 emissions by type of energy production, among other columns. The data in this source was compiled from the following sources:

* CO2 emissions: this data is sourced from the Global Carbon Project. The Global Carbon Project typically releases a new update of CO2 emissions annually.
* Greenhouse gas emissions (including methane, and nitrous oxide): this data is sourced from the CAIT Climate Data Explorer, and downloaded from the Climate Watch Portal.
* Energy (primary energy, energy mix and energy intensity): this data is sourced from a combination of two sources. The BP Statistical Review of World Energy is published annually, but it does not provide data on primary energy consumption for all countries. For countries absent from this dataset, we calculate primary energy by multiplying the World Bank, World Development Indicators metric Energy use per capita by total population figures. The World Bank sources this metric from the IEA.
* Other variables: this data is collected from a variety of sources (United Nations, World Bank, Gapminder, Maddison Project Database, etc.). More information is available in our codebook.

With this dataset’s extensive amount of data on CO2 emissions by energy production type, **we can understand how nuclear energy stacks up against different types of energy production in terms of their effect on climate change and greenhouse gas emissions**. Specifically, this will help answer research questions 2 and 3.

#### Dataset 4

For our last dataset, we have information regarding population exposure to nuclear reactors. The dataset was found on Kaggle at this link: [*population exposure to nuclear reactors*](https://www.kaggle.com/liananapalkova/nuclear-power-plants). **This data set (energy-pop-exposure-nuclear-plants-locations_plants) includes approximately 300 rows and 40+ columns**. Some of the features that this dataset include are region, country name, and plant location. There are also 30+ columns that detail the general/urban/rural population exposure to nuclear plants with certain vicinities throughout the years.

The data for this data set was sourced through a “global dataset developed by Declan Butler of Nature News and the Power Reactor Information System (PRIS), an up-to-date database of nuclear reactors maintained by the International Atomic Energy Agency (IAEA)”. The dataset is very credible as it was originally published by the **NASA Socioeconomic Data and Applications Center (SEDAC)**.

**This data set will help us answer research question 4 on how nuclear power plants can affect human population** because by knowing the estimated population within certain distances of nuclear reactors, we can better quantify the potential hazard a nuclear reactor site could pose to the public.


### 5.0 Expected Implications
Our questions could have drastically different consequences depending on their answers. Regardless of what is discovered, these questions affect anyone working in an energy-related field, especially those working with traditional energy sources such as coal or petroleum. If our results seem to indicate that nuclear energy is viable as an alternative, other energy sectors may not want to promote it and vice versa. The general public seems to be undecided on whether they have a positive or negative opinion about nuclear energy, and our findings may sway the general consensus in one direction or the other. Policymakers are more inclined towards the energy solution that would lead to them earning the most money, so if nuclear energy is proven to be a profitable and viable field, governments around the world would be more likely to invest in nuclear energy solutions.

### 6.0 Limitations
Some potential limitations include:
  * It is difficult to directly link nuclear energy to the production of certain gases because it is always possible that these gases are being/not being generated by other sources of energy as opposed to nuclear energy as it is extremely unlikely for there to be a location where no other energy is being generated. The most that can be inferred from any data in this regard is correlation, but not causation.
  * It is difficult to objectively say one form of generating energy is "more viable" than another. We will consider multiple factors such as effects on environment and energy generated, but declaring any form of energy to be overall better than another is a challenging task, and one in which it is difficult to remain entirely neutral.

## Acknowledgements

## References

N. Sönnichsen, *Global production distribution of non-renewable energy resources 2008-2018*, Dec 22, 2021

Daniel Van Boom, *How Nuclear Power Plants Could Help Solve the Climate Crisis*, Nov. 16, 2021

*Harmful Effects of Non-Renewable Resources on the Environment* Feb 23, 2017, Greentumble

“The Effects of Climate Change.” NASA, NASA, 26 Aug. 2021

## Appendix A: Questions
