library(ggplot2)
library(dplyr)
QCSI <- read.csv("QCSI.csv")
QSamPrep <- read.csv("QSamPrep.csv")
QExtraction <- read.csv("QExtraction.csv")
QValidation <- read.csv("QValidation.csv")

QCSI$Scenario <- as.factor(QCSI$Scenario)
QSamPrep$Scenario <- as.factor(QSamPrep$Scenario)
QExtraction$Scenario <- as.factor(QExtraction$Scenario)
QValidation$Scenario <- as.factor(QValidation$Scenario)

QCSI$`QueueTime` <- as.numeric(QCSI$`QueueTime`)
QSamPrep$`QueueTime` <- as.numeric(QSamPrep$`QueueTime`)
QExtraction$`QueueTime` <- as.numeric(QExtraction$`QueueTime`)
QValidation$`QueueTime` <- as.numeric(QValidation$`QueueTime`)

plot_queue_time <- function(df, title) {
  df$Scenario <- factor(df$Scenario, levels = unique(df$Scenario))
  queue_list <- split(df$QueueTime, df$Scenario)
  
  boxplot(queue_list,
          main = title,
          ylab = "Queue Time (Minutes)",
          col = "#C3E6CB",
          border = "#006A4E",
          outpch = 1,
          outcol = "#006A4E",
          las = 2,
          cex.axis = 0.8,
          cex.lab = 1.1,
          cex.main = 1.3)
}

plot_queue_time(QCSI, "Queue Time - CSI Visit")
plot_queue_time(QSamPrep, "Queue Time - Sample Preparation")
plot_queue_time(QExtraction, "Queue Time - DNA Extraction")
plot_queue_time(QValidation, "Queue Time - Validation")

