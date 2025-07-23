library(dplyr)
library(ggplot2)
library(tidyr)

# 1. Read data and clean Stage names
Task_4a <- read_excel("data.xlsx")  # Make sure this is your correct file path
colnames(Task_4a)[1] <- "Stage"
Task_4a$Stage <- trimws(Task_4a$Stage)

# 2. Convert Stage to a factor to preserve order
Task_4a$Stage <- factor(Task_4a$Stage, levels = unique(Task_4a$Stage))

# 3. Create the plot with legend
ggplot(Task_4a, aes(x = Stage, y = Average, group = 1)) +
  geom_ribbon(
    aes(ymin = Minimum, ymax = Maximum, fill = "Higher and Lower 95% Range"),
    alpha = 0.3
  ) +
  geom_line(
    aes(color = "Average Time"), 
    linewidth = 1
  ) +
  geom_point(
    aes(color = "Average Time"), 
    size = 1.2
  ) +
  scale_color_manual(
    name = "Metrics",
    values = c("Average Time" = "#2E8B57")
  ) +
  scale_fill_manual(
    name = "",
    values = c("Higher and Lower 95% Range" = "navy")
  ) +
  labs(
    title = "Cumulative Time Across Current Process",
    x = "Current Process Stage",
    y = "Time (minutes)"
  ) +
  theme_linedraw() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
    plot.margin = margin(1, 1, 1, 2, "cm"),
    legend.position = "bottom",  # Position legend at bottom
    legend.box = "horizontal",   # Arrange legend items horizontally
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9)
  ) +
  scale_y_continuous(labels = scales::comma) +
  guides(
    color = guide_legend(order = 1),  # Show line/points legend first
    fill = guide_legend(order = 2)    # Show range legend second
  )
