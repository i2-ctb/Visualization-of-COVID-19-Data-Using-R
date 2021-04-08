#############################################################################################################
#############################################################################################################

# Let us start by loading the packages we will need for this project - 

library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)
library(maps)
library(egg)


#############################################################################################################

### Graph 1 : A simple line chart using the time series data from JHU 

# Reading the data

data = read.csv("./data/coronavirus.csv", header = TRUE)

# Extracting data for deaths in USA using tidyverse
data_usa_death = filter(data, country == "US" & type == "death")

# Converting the date column from type character to date
data_usa_death$date = mdy (data_usa_death$date)

# Summarizing the data by month using tidyverse

data_usa_death_by_month = data_usa_death %>% group_by(month=floor_date(date,unit = "month")) %>% summarize(deaths=sum(cases))

# plotting the line chart

ggplot(data_usa_death_by_month, aes(x=month,y=deaths))+ geom_line()

#############################################################################################################

# Graph 2 : COVID-19 deaths in USA from Jan 2020 to Feb 2021

### Data prep
# Reading the data
data = read.csv("./data/coronavirus.csv", header = TRUE)

# Extracting data for deaths in USA using tidyverse
data_usa_death = filter(data, country == "US" & type == "death")

# Converting the date column from type character to date
data_usa_death$date = mdy (data_usa_death$date)

# Summarizing the data by month using tidyverse
data_usa_death_by_month = data_usa_death %>% group_by(month=floor_date(date,unit = "month")) %>% summarize(deaths=sum(cases))

## Revisiting graph 1 - COVID-19 deaths in USA from Jan 2020 to Feb 2021

ggplot(data_usa_death_by_month, aes(x=month,y =deaths))+geom_line(color="red", size=1.5)+scale_x_date(date_breaks = "months" , date_labels = "%b-%y")+ggtitle("COVID-19 deaths in USA from Jan 2020 to Feb 2021")+geom_label(label = data_usa_death_by_month$deaths, colour = "black", fill = "lightgray", cex=3.5)+ theme_bw()



#############################################################################################################