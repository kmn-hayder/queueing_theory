library(dplyr)
library(ggplot2)

# Read both datasets
data_1 <- read.csv("S1.csv") %>% mutate(Scenario = "Scenario 1")
data_2 <- read.csv("S2.csv") %>% mutate(Scenario = "Scenario 2")

# Combine stage order manually using file order (not union)
# Keep both data frame stage orders exactly as-is
all_stages <- unique(c(data_1$Stages, data_2$Stages))

# Create an ordered factor with all stages in the original file order
data_1$Stages <- factor(data_1$Stages, levels = all_stages)
data_2$Stages <- factor(data_2$Stages, levels = all_stages)

# Ensure missing rows are preserved and NA stays in position
data_1_full <- data.frame(Stages = all_stages) %>%
  left_join(data_1, by = "Stages") %>%
  mutate(Scenario = "Scenario 1")

data_2_full <- data.frame(Stages = all_stages) %>%
  left_join(data_2, by = "Stages") %>%
  mutate(Scenario = "Scenario 2")

# Combine both
combined_data <- bind_rows(data_1_full, data_2_full)

# Set factor levels again after bind
combined_data$Stages <- factor(combined_data$Stages, levels = all_stages)
combined_data$Scenario <- factor(combined_data$Scenario, levels = c("Scenario 1", "Scenario 2"))

# Use APA-compliant muted colors
my_colors <- c("Scenario 1" = "#4F81BD", "Scenario 2" = "#999999")

# Plot
ggplot(combined_data, aes(x = Stages)) +
  geom_ribbon(
    aes(ymin = X5thPercentile, ymax = X95thPercentile, fill = Scenario, group = Scenario),
    alpha = 0.2,
    na.rm = FALSE
  ) +
  geom_line(
    aes(y = Average, color = Scenario, group = Scenario),
    size = 1.2,
    na.rm = FALSE
  ) +
  geom_point(
    aes(y = Average, color = Scenario),
    size = 2,
    na.rm = FALSE
  ) +
  scale_color_manual(values = my_colors) +
  scale_fill_manual(values = my_colors) +
  scale_y_continuous(limits = c(0, 20000)) +
  labs(
    title = "Cumulative Time Across Each Stage: Scenario 1 vs Scenario 2",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "Shaded areas show 5th and 95th percentile distributions. Calculated from timestamps extracted using Simul8 spreadsheets.\n In scenario 2, Data Input, Transport to Lab and their queues are shown for comparability. These data points are empty.",
    color = "Scenario",
    fill = "Scenario"
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.caption = element_text(hjust = 0)
  )
