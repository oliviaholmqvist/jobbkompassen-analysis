# Jobbkompassen – Conversion Funnel Analysis

library(dplyr)

# Simulated example structure
# events <- read.csv("events.csv")

# Example conversion logic
conversion_data <- events %>%
  group_by(session_id) %>%
  summarise(
    viewed_ad = any(event_type == "VIEW_AD"),
    applied = any(event_type == "APPLY")
  )

view_sessions <- conversion_data %>%
  filter(viewed_ad == TRUE)

conversion_rate <- mean(view_sessions$applied) * 100

cat("Conversion rate from VIEW_AD to APPLY:", round(conversion_rate, 2), "%\n")
