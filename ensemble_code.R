data1 <- read.csv("owid-co2-data.csv")

colnames(data1)

data1 |> dplyr::select(
country, 
year,
gdp,
co2) 

library(tidyverse)
library(ggplot2)

all_variables <- c("country", "year", "gdp", "co2")


data_2 <- data1 |>
  dplyr::select(
    country, 
    year,
    gdp,
    co2,
    population) |>
  filter(!is.na(country) & !is.na(year)& !is.na(gdp) & !is.na(co2) & !is.na(population)) |>
  mutate(co2_percap = co2/population*1000000,
         gdp_percap = (gdp /1000) /population) |>
  filter(year >=1980) |>
  filter(year <=2018)
head(data_2)


data_canada <- data_2 |> 
  filter(country == "Canada")


plot1 <- ggplot(data_canada,
                aes(x = gdp_percap, y = co2_percap))+
         geom_line()+
         labs(x = "GDP per capita ($1000)",
              y = "CO2 per capita (g)",
              title = "Canada")
plot1

data_China_US <- data_2 |> filter(country == "China" | country == "United States")
plot2 <- ggplot(data_China_US,
                aes(x = gdp_percap, y = co2_percap, color = country))+
         geom_line()+
         labs(x = "GDP per capita ($1000)",
              y = "CO2 per capita (g)",
              title = "China&US", color = "Country")
plot2

data_part_country <- data_2 |> 
  filter(country == "Canada" | country == "France" | country == "Germany" | 
           country == "Italy" | country == "Japan" |
           country == "United Kingdom")

plot_part_countries <-  ggplot(data_part_country
                               , aes(x =gdp_percap, y = co2_percap, color = country))+
  geom_line()+
  geom_point()
plot_part_countries 

plot_each_country <- ggplot(data_part_country, aes(x =gdp_percap, y = co2_percap, color = country))+
  geom_line() +
  geom_point() +
  labs(title =  "country" , x = "GDP per capita ($1000)",
       y = "CO2 per capita (g)") +
  facet_wrap(~ country, ncol = 3) 

print(plot_each_country)

  