install.packages("tidyr")
install.packages("ggplot2")
library(tidyr)
library(ggplot2)

load("C:/Users/user/Downloads/house_prices.rda")

house_prices$date <- as.Date(house_prices$date)
house_prices$year <- format(house_prices$date, "%Y")

house_reshaped <- house_prices %>%
  gather(key = "measure", value = "value", house_price_index, unemploy_perc)
head(house_reshaped)

ggplot(house_prices, aes(x = year, y = house_price_index)) +
  geom_line(color = "red") +
  facet_wrap(~ state) +
  scale_x_continuous(breaks = c(1980, 2000, 2020), labels = c('1980', '2000', '2020')) +
  labs(y = "House Price Index", x = NULL) +  # Set y label, remove x label
  theme_minimal()

ggplot(house_prices, aes(x = date, y = house_price_perc, color = state)) +
  geom_line() +
  labs(y = "House Price Perc", x = NULL) +  # Set y label, remove x label
  theme_minimal() +
  theme(legend.position = "bottom", legend.direction = "horizontal")
       
       