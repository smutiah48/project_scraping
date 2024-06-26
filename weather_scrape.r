# weather_scraper.R

# Install necessary packages if they are not already installed
if (!requireNamespace("rvest", quietly = TRUE)) {
  install.packages("rvest")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("stringi", quietly = TRUE)) {
  install.packages("stringi")
}
if (!requireNamespace("mongolite", quietly = TRUE)) {
  install.packages("mongolite")
}
# if (!requireNamespace("dotenv", quietly = TRUE)) {
#   install.packages("dotenv")
# }

# Load the necessary packages
library(rvest)
library(dplyr)
library(mongolite)
# library(dotenv)

# URL of the weather page for indonesia
url <- "https://weather.com/id-ID/weather/hourbyhour/l/25f6de39d79106bac19bb073f0cb38574b3981fe81b5297cc3ebfa353eaaf60b"

# Read the HTML content from the webpage
webpage <- read_html(url)

# Extract specific weather data
location <- webpage %>%
  html_nodes(".LocationPageTitle--PresentationName--1AMA6") %>% # Update this selector
  html_text() %>%
  .[1]

day <- webpage %>%
  html_nodes(".HourlyForecast--longDate--J_Pdh") %>% # Update this selector
  html_text() %>%
  .[1]

time <- webpage %>%
  html_nodes(".HourlyForecast--timestamp--Q8WkZ") %>% # Update this selector
  html_text() %>%
  .[1]

temperature <- webpage %>%
  html_nodes(".DetailsSummary--tempValue--jEiXE") %>% # Update this selector
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

# Clean the data
location <- gsub(",", "", location)
day <- gsub(",", "", day)
temperature <- gsub(",", "", temperature)
weather <- gsub(",", "", weather)
description <- gsub(",", "", description)
humidity <- gsub(",", "", humidity)
wind <- gsub(",", "", wind)

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

# Load the .env file
# dotenv::load_dot_env(".env")

# MONGODB
message("Starting MongoDB Connection...")

# Function to attempt connecting to the MongoDB collection and count documents
retry_mongo_connection <- function(collection_name, db, uri, max_retries = 5, wait_time = 5) {
  attempt <- 1
  while (attempt <= max_retries) {
    try(
      {
        # Create a connection to the MongoDB database
        conn <- mongo(
          collection = collection_name,
          db = db,
          url = uri
        )

        # Count the documents in the collection
        doc_count <- conn$count()

        if (doc_count > 0) {
          message("Connection successful, found ", doc_count, " documents in collection.")
          return(conn)
        } else {
          message("Connection successful, but no documents found in collection.")
          return(conn)
        }
      },
      silent = FALSE
    )

    # If we reach here, it means the count was zero or an error occurred
    message("Attempt ", attempt, " failed. Retrying in ", wait_time, " seconds...")
    Sys.sleep(wait_time)
    attempt <- attempt + 1
  }

  stop("Max retries reached. Unable to connect to MongoDB collection or no documents found.")
}

# Attempt to connect to MongoDB
conn <- retry_mongo_connection(
  Sys.getenv("ATLAS_COLLECTION"),
  Sys.getenv("ATLAS_DB"),
  Sys.getenv("ATLAS_URL")
)

# Insert the weather_data into the MongoDB collection
if (!is.null(conn)) {
  conn$insert(weather_data)
  message("Data inserted successfully.")

  # Close the connection
  conn$disconnect()
} else {
  message("Error: MongoDB connection is NULL. Data not inserted.")
}
