# Load required libraries
library(dplyr)
library(ggplot2)

# Read and label the two datasets
data_s3 <- read.csv("S3.csv") %>% mutate(Scenario = "Scenario 3")
data_s4 <- read.csv("S4.csv") %>% mutate(Scenario = "Scenario 4")

# Combine the two datasets
combined_data <- bind_rows(data_s3, data_s4)

# Set factor levels for Stages based on unique order across both datasets
all_stages <- unique(combined_data$Stages)
combined_data$Stages <- factor(combined_data$Stages, levels = all_stages)

# Define APA-compliant colors for Scenario 3 and Scenario 4
my_colors <- c("Scenario 3" = "#4F81BD",    # muted blue
               "Scenario 4" = "#999999")    # medium gray

# Plot Scenario 3 vs Scenario 4
ggplot(combined_data, aes(x = Stages, group = Scenario)) +
  geom_ribbon(aes(ymin = X5thPercentile, ymax = X95thPercentile, fill = Scenario), alpha = 0.2) +
  geom_line(aes(y = Average, color = Scenario), size = 1.2) +
  geom_point(aes(y = Average, color = Scenario), size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage: Scenario 3 vs Scenario 4",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "Shaded areas show 5th and 95th percentile distributions. Calculated from timestamps extracted using Simul8 spreadsheets.",
    color = "Scenario",
    fill = "Scenario"
  ) +
  scale_color_manual(values = my_colors) +
  scale_fill_manual(values = my_colors) +
  scale_y_continuous(limits = c(0, 20000)) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))
