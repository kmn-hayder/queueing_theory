library(dplyr)
library(ggplot2)
library(tidyr)  # Needed for pivot_longer

# 1. Read data and clean Stage names
Task_4a <- read_excel("data.xlsx")  # Make sure this is your correct file path
colnames(Task_4a)[1] <- "Stage"
Task_4a$Stage <- trimws(Task_4a$Stage)  # Good practice even if you think there's no whitespace

# 2. Convert Stage to a factor to preserve order
Task_4a$Stage <- factor(Task_4a$Stage, levels = unique(Task_4a$Stage))

# 3. Create the plot
ggplot(Task_4a, aes(x = Stage, y = Average, group = 1)) +
  geom_line(linewidth = 1, color = "#2E8B57") +
  geom_point(size = 1.2, color = "#2E8B57") +
  geom_ribbon(
    aes(ymin = Minimum, ymax = Maximum),
    fill = "navy",
    alpha = 0.3  # Transparency (0-1)
  ) +
  labs(
    title = "Cummulative Time Across Current Process",
    x = "Current Process Stage",
    y = "Time (minutes)"
  ) +
  theme_linedraw() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
    plot.margin = margin(1, 1, 1, 2, "cm")
  ) +
  scale_y_continuous(labels = scales::comma)
