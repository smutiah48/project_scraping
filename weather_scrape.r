# weather_scraper.R

# Install necessary packages if they are not already installed
if (!requireNamespace("rvest", quietly = TRUE)) {
  install.packages("rvest")
}
if (!requireNamespace("mongolite", quietly = TRUE)) {
  install.packages("mongolite")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("stringi", quietly = TRUE)) {
  install.packages("stringi")
}

# Load the necessary packages
library(rvest)
library(dplyr)
library(mongolite)

# URL of the weather page for indonesia
url <- "https://weather.com/id-ID/weather/hourbyhour/l/25f6de39d79106bac19bb073f0cb38574b3981fe81b5297cc3ebfa353eaaf60b"

# Read the HTML content from the webpage
webpage <- read_html(url)

# Extract specific weather data
location <- webpage %>%
  html_nodes(".LocationPageTitle--PresentationName--1AMA6") %>%  # Update this selector
  html_text() %>%
  .[1]

day <- webpage %>%
  html_nodes(".HourlyForecast--longDate--J_Pdh") %>%  # Update this selector
  html_text() %>%
  .[1]

  time <- webpage %>%
  html_nodes(".HourlyForecast--timestamp--Q8WkZ") %>%  # Update this selector
  html_text() %>%
  .[1]

temperature <- webpage %>%
  html_nodes(".DetailsSummary--tempValue--jEiXE") %>%  # Update this selector
  html_text() %>%
  .[1]

weather <- webpage %>%
  html_nodes(".DetailsSummary--extendedData--307Ax") %>%  # Update this selector
  html_text() %>%
  .[1]

description <- webpage %>%
  html_nodes(".HourlyForecast--insightText--E3rgG") %>%  # Update this selector
  html_text() %>%
  .[1]

humidity <- webpage %>%
  html_nodes(".DetailsTable--value--2YD0-") %>%  # Update this selector
  html_text() %>%
  .[1]

wind <- webpage %>%
    html_nodes(".Wind--windWrapper--3Ly7c") %>%  # Update this selector
    html_text() %>%
    .[1]  # Append wind with the second and third elements

#clean koma data
location <- gsub(",","",location)
day <- gsub(",","",day)
# Print the scraped data
cat("Location:", location, "\n")
cat("Day:", day, "\n")
cat("Time:", time, "\n")
cat("Temperature:", temperature, "\n")
cat("Weather:", weather, "\n")
cat("Description:", description, "\n")
cat("Humidity:", humidity, "\n")
cat("Wind:", wind, "\n")

weather_data <- data.frame(
  Location = location,
  Day = day,
  Time = time,
  Temperature = temperature,
  Weather = weather,
  Description = description,
  Humidity = humidity,
  Wind = wind,
  stringsAsFactors = FALSE
)
# MONGODB
message('Input Data to MongoDB Atlas')

# Membuat koneksi ke MongoDB Atlas
atlas_conn <- mongo(
  collection = Sys.getenv("ATLAS_COLLECTION"),
  db = Sys.getenv("ATLAS_DB"),
  url = Sys.getenv("ATLAS_URL")
)


# Memasukkan data ke MongoDB Atlas
atlas_conn$insert(weather_data)

# Menutup koneksi setelah selesai
rm(atlas_conn)
