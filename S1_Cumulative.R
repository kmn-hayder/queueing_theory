# Load required libraries
library(ggplot2)

# Load the data
data <- read.csv("cs.csv")

# Use the order in the CSV file
data$Stages <- factor(data$Stages, levels = data$Stages)

# Plot
ggplot(data, aes(x = Stages)) +
  geom_ribbon(aes(ymin = `X5thPercentile`, ymax = `X95thPercentile`, group = 1), 
              fill = "lightsteelblue", alpha = 0.4) +
  
  geom_line(aes(y = Average, group = 1), color = "darkcyan", size = 1.2) +
  geom_point(aes(y = Average), color = "darkcyan", size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage in Current Scenario",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "The area shows 5th and 95th percentile of the distribution for each stage. Calculated from timestamps extracted using Simul8 spreadsheets."
  ) +
  theme_classic() +
  scale_y_continuous(limits = c(0, 20000)) +  # <-- fix y-axis scale here
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))


####SCENARIO 1############
# Load the data
data <- read.csv("S1.csv")

# Use the order in the CSV file
data$Stages <- factor(data$Stages, levels = data$Stages)

# Plot
ggplot(data, aes(x = Stages)) +
  geom_ribbon(aes(ymin = `X5thPercentile`, ymax = `X95thPercentile`, group = 1), 
              fill = "lightsteelblue", alpha = 0.4) +
  
  geom_line(aes(y = Average, group = 1), color = "darkcyan", size = 1.2) +
  geom_point(aes(y = Average), color = "darkcyan", size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage in Scenario 1",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "The area shows 5th and 95th percentile of the distribution for each stage. Calculated from timestamps extracted using Simul8 spreadsheets."
  ) +
  theme_classic() +
  scale_y_continuous(limits = c(0, 20000)) +  # <-- fix y-axis scale here
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))


####SCENARIO 2############
# Load the data
data <- read.csv("S2.csv")

# Use the order in the CSV file
data$Stages <- factor(data$Stages, levels = data$Stages)

# Plot
ggplot(data, aes(x = Stages)) +
  geom_ribbon(aes(ymin = `X5thPercentile`, ymax = `X95thPercentile`, group = 1), 
              fill = "lightsteelblue", alpha = 0.4) +
  
  geom_line(aes(y = Average, group = 1), color = "darkcyan", size = 1.2) +
  geom_point(aes(y = Average), color = "darkcyan", size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage in Scenario 2",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "The area shows 5th and 95th percentile of the distribution for each stage. Calculated from timestamps extracted using Simul8 spreadsheets."
  ) +
  theme_classic() +
  scale_y_continuous(limits = c(0, 20000)) +  # <-- fix y-axis scale here
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))

####SCENARIO 3############
# Load the data
data <- read.csv("S3.csv")

# Use the order in the CSV file
data$Stages <- factor(data$Stages, levels = data$Stages)

# Plot
ggplot(data, aes(x = Stages)) +
  geom_ribbon(aes(ymin = `X5thPercentile`, ymax = `X95thPercentile`, group = 1), 
              fill = "lightsteelblue", alpha = 0.4) +
  
  geom_line(aes(y = Average, group = 1), color = "darkcyan", size = 1.2) +
  geom_point(aes(y = Average), color = "darkcyan", size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage in Scenario 3",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "The area shows 5th and 95th percentile of the distribution for each stage. Calculated from timestamps extracted using Simul8 spreadsheets."
  ) +
  theme_classic() +
  scale_y_continuous(limits = c(0, 20000)) +  # <-- fix y-axis scale here
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))

####SCENARIO 3############
# Load the data
data <- read.csv("S3.csv")

# Use the order in the CSV file
data$Stages <- factor(data$Stages, levels = data$Stages)

# Plot
ggplot(data, aes(x = Stages)) +
  geom_ribbon(aes(ymin = `X5thPercentile`, ymax = `X95thPercentile`, group = 1), 
              fill = "lightsteelblue", alpha = 0.4) +
  
  geom_line(aes(y = Average, group = 1), color = "darkcyan", size = 1.2) +
  geom_point(aes(y = Average), color = "darkcyan", size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage in Scenario 3",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "The area shows 5th and 95th percentile of the distribution for each stage. Calculated from timestamps extracted using Simul8 spreadsheets."
  ) +
  theme_classic() +
  scale_y_continuous(limits = c(0, 20000)) +  # <-- fix y-axis scale here
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))

####SCENARIO 4############
# Load the data
data <- read.csv("S4.csv")

# Use the order in the CSV file
data$Stages <- factor(data$Stages, levels = data$Stages)

# Plot
ggplot(data, aes(x = Stages)) +
  geom_ribbon(aes(ymin = `X5thPercentile`, ymax = `X95thPercentile`, group = 1), 
              fill = "lightsteelblue", alpha = 0.4) +
  
  geom_line(aes(y = Average, group = 1), color = "darkcyan", size = 1.2) +
  geom_point(aes(y = Average), color = "darkcyan", size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage in Scenario 4",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "The area shows 5th and 95th percentile of the distribution for each stage. Calculated from timestamps extracted using Simul8 spreadsheets."
  ) +
  theme_classic() +
  scale_y_continuous(limits = c(0, 20000)) +  # <-- fix y-axis scale here
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))

####SCENARIO 5############
# Load the data
data <- read.csv("S5.csv")

# Use the order in the CSV file
data$Stages <- factor(data$Stages, levels = data$Stages)

# Plot
ggplot(data, aes(x = Stages)) +
  geom_ribbon(aes(ymin = `X5thPercentile`, ymax = `X95thPercentile`, group = 1), 
              fill = "lightsteelblue", alpha = 0.4) +
  
  geom_line(aes(y = Average, group = 1), color = "darkcyan", size = 1.2) +
  geom_point(aes(y = Average), color = "darkcyan", size = 2) +
  labs(
    title = "Cumulative Time Across Each Stage in Scenario 5",
    x = "Process Stage",
    y = "Cumulative Time (Minutes)",
    caption = "The area shows 5th and 95th percentile of the distribution for each stage. Calculated from timestamps extracted using Simul8 spreadsheets."
  ) +
  theme_classic() +
  scale_y_continuous(limits = c(0, 20000)) +  # <-- fix y-axis scale here
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.caption = element_text(hjust = 0))
