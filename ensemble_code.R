data1 <- read.csv("owid-co2-data.csv")

colnames(data1)

data1 |> dplyr::select(
country, 
year,
gdp,
co2) 

library(tidyverse)

all_variables <- c("country", "year", "gdp", "co2")


data_2 <- data1 |>
  dplyr::select(
    country, 
    year,
    gdp,
    co2,
    population) |>
  filter(!is.na(country) & !is.na(year)& !is.na(gdp) & !is.na(co2) & !is.na(population)) |>
  mutate(co2_percap = co2/population,
         gdp_percap = gdp /population)
  arrange(desc(year))
head(data_2)


library(ggplot2)


plot1 <- ggplot(data2,
                aes(x =, y = co2
                  
                )
  
)