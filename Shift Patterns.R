  install.packages("tidyr")
  library(tidyr)
  install.packages("ggplot2")
  library(ggplot2)
  install.packages("dplyr")
  library(dplyr)
  
  # Load data (adjust filename)
  df <- read.csv("QueueTimes.csv")
  
  # Convert from wide to long for ggplot
  df_long <- pivot_longer(df, 
                          cols = c(QCSI, QDataInput, QSamPrep, Qextraction, Qvalidation),
                          names_to = "Stage", values_to = "Duration")
  
  # Rename Stage factor levels for better legend labels
  df_long$Stage <- factor(df_long$Stage,
                          levels = c("QCSI", "QDataInput", "QSamPrep", "Qextraction", "Qvalidation"),
                          labels = c("CSI Queue", "Data Input Queue", "Sample Prep Queue", "Extraction Queue", "Validation Queue"))
  
  # Bin URN and calculate median duration per bin and stage
  df_binned <- df_long %>%
    mutate(URN_num = as.numeric(as.character(URN)),
           URN_bin = cut(URN_num, breaks = seq(min(URN_num), max(URN_num), by = 50))) %>%
    group_by(Stage, URN_bin) %>%
    summarise(mean_duration = mean(Duration, na.rm = TRUE), .groups = "drop")
  
  
  # Plot with updated legend labels
  ggplot(df_binned, aes(x = URN_bin, y = mean_duration, color = Stage, group = Stage)) +
    geom_line(size = 1) +
    labs(title = "Mean Queue Duration by Entry Time",
         x = "Entry Time in System (0 minutes to the left end of axis)",
         y = "Mean Queue Duration (minutes)",
         color = "Process Stage") +  # Legend title
    scale_color_manual(values = c(
      "CSI Queue" = "#4C72B0",        # Muted Blue
      "Data Input Queue" = "#55A868", # Muted Green
      "Sample Prep Queue" = "#C44E52",# Muted Red
      "Extraction Queue" = "#8172B3", # Muted Purple
      "Validation Queue" = "#CCB974"  # Muted Gold/Brown
    )) +
    theme_classic() +
    theme(axis.text.x = element_blank())
  
