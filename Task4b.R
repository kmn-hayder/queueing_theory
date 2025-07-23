# Load necessary libraries
library(readxl)
library(ggplot2)
library(tidyr)

# Read and clean data
data <- read_excel("Task4b.xlsx", sheet = "Sheet1", na = c("", "-", "NA"))
data <- data.frame(lapply(data, function(x) as.numeric(as.character(x))))

# Convert to long format
data_long <- pivot_longer(data, 
                          cols = everything(),
                          names_to = "Queue",
                          values_to = "Value",
                          values_drop_na = TRUE)

# Create boxplot with explicit whisker settings
ggplot(data_long, aes(x = Queue, y = Value)) +
  stat_boxplot(
    geom = "errorbar",  # This creates the whiskers
    width = 0.3,        # Width of whisker ends
    color = "black"     # Color of whiskers
  ) +
  geom_boxplot(
    fill = "#006A4E",
    color = "black",
    alpha = 0.7,
    width = 0.5,
    outlier.color = "#006A4E",
    outlier.shape = 19,
    outlier.size = 2,
    coef = 1.5
  ) +
  labs(
    title = "Boxplots of Top 5 Queues of Current Process",
    x = NULL,
    y = "Processing Time (minutes)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.text.x = element_text(size = 7, angle = 45, hjust = 1),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.y = element_blank()
  ) +
  scale_y_continuous(expand = c(0, 0))