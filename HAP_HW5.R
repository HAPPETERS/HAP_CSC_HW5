library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)

load("C:/Users/user/Downloads/house_prices.rda")

ggplot(house_prices, aes(x = date, y = house_price_index)) +
  geom_line() +
  facet_wrap(~state) +
  scale_x_continuous(breaks = c(as.Date("1980-01-01"), as.Date("2000-01-01"), as.Date("2020-01-01")),
                     labels = c("80", "00", "20")) +
  labs(title = "House Price Index Trend by State",
       x = "Year",
       y = "House Price Index")

house_reshaped <- house_prices %>%
  gather(key = measure, value = value, -c(house_price_index, unemploy_perc, date, state))

ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~state) +
  scale_x_continuous(breaks = c(as.Date("1980-01-01"), as.Date("2000-01-01"), as.Date("2020-01-01")),
                     labels = c("80", "00", "20")) +
  labs(title = "House Price Index and Unemployment Percentage Trend by State",
       x = "Year",
       y = "Value") +
  theme(legend.title = element_blank())

ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~state) +
  scale_x_continuous(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")),
                     labels = c("80", "00", "20")) +
  labs(title = "House Price Index and Unemployment Percentage by State",
       x = "Year",
       y = "Value") +
  theme(legend.title = element_blank())
