library(ggplot2)
library(dplyr)

read_scenario <- function(file, scenario_name) {
  df <- read.csv(file)
  df$Scenario <- scenario_name
  df$Stages <- factor(df$Stages, levels = unique(df$Stages))
  return(df)
}

df_list <- list(
  read_scenario("cs.csv", "Current"),    # Current scenario added here
  read_scenario("S1.csv", "Scenario 1"),
  read_scenario("S2.csv", "Scenario 2"),
  read_scenario("S3.csv", "Scenario 3"),
  read_scenario("S4.csv", "Scenario 4"),
  read_scenario("S5.csv", "Scenario 5")
)

all_data <- bind_rows(df_list)

# Updated APA color palette with Current scenario (added a nice gray)
apa_colors <- c("Current"    = "#7F7F7F",  # gray for current
                "Scenario 1" = "#0072B2",
                "Scenario 2" = "#D55E00",
                "Scenario 3" = "#009E73",
                "Scenario 4" = "#CC0000",
                "Scenario 5" = "#882E72")

ggplot(all_data, aes(x = Stages, y = Average, color = Scenario, group = Scenario)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage by Scenario",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "Data from Simul8 spreadsheets. \nProcesses or Queues have been kept consistent by imputing"
  ) +
  theme_classic() +
  scale_y_continuous(limits = c(0, 20000)) +
  scale_color_manual(values = apa_colors) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.caption = element_text(hjust = 0)
  )
