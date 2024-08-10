install.packages("ggplot2")
library(ggplot2)

ggplot(house_reshaped, aes(x = as.numeric(year), y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(breaks = c(1980, 2000, 2020), labels = c('1980', '2000', '2020')) +
  labs(y = "Value", x = NULL, color = "Measure") +  # Set y label, remove x label
  theme_minimal() +
  theme(legend.position = "bottom", legend.direction = "horizontal")
