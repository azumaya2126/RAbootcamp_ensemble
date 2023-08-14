owid_co2_data

colnames(owid_co2_data)

owid_co2_data |> dplyr::select(
country, 
year,
gdp,
co2,
)
