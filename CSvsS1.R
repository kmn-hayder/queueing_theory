# Load required libraries
library(dplyr)
library(ggplot2)

# Read and label the two datasets
data_current <- read.csv("cs.csv") %>% mutate(Scenario = "Current")
data_1 <- read.csv("S1.csv") %>% mutate(Scenario = "Scenario 1")

# Combine the two datasets
combined_data <- bind_rows(data_current, data_1)

# Set factor levels for Stages based on unique order across both datasets
all_stages <- unique(combined_data$Stages)
combined_data$Stages <- factor(combined_data$Stages, levels = all_stages)

# Define APA-compliant colors: muted blue and gray
my_colors <- c("Current" = "#4F81BD",    # muted blue
               "Scenario 1" = "#999999") # medium gray

# Plot Current vs Scenario 1
ggplot(combined_data, aes(x = Stages, group = Scenario)) +
  geom_ribbon(aes(ymin = X5thPercentile, ymax = X95thPercentile, fill = Scenario), alpha = 0.2) +
  geom_line(aes(y = Average, color = Scenario), size = 1.2) +
  geom_point(aes(y = Average, color = Scenario), size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage: Current vs Scenario 1",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "Shaded areas show 5th and 95th percentile distributions. Calculated from timestamps extracted using Simul8 spreadsheets.\n Queue for Courier and Courier added for comparability with other scenarios. These data points are empty.",
    color = "Scenario",
    fill = "Scenario"
  ) +
  scale_color_manual(values = my_colors) +
  scale_fill_manual(values = my_colors) +
  scale_y_continuous(limits = c(0, 20000)) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))