data1 <- read.csv("owid-co2-data.csv")

colnames(data1)

data1 |> dplyr::select(
country, 
year,
gdp,
co2,
)


