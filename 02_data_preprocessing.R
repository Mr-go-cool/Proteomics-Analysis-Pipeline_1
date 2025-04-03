# Proteomics Data Preprocessing (Step 4)

# Load required libraries
library(tidyverse)

# Set your working directory (adjust as needed)
setwd("../data")

# Load DIA-NN output file
data <- read.delim("./raw/report.tsv", header = TRUE, sep = "\t")

# Extract relevant columns and remove missing values
proteins_cleaned <- data %>%
  select(Protein.Names, Genes, Protein.Ids, PG.Quantity) %>%
  na.omit()

# Save the cleaned data to processed folder
write.csv(proteins_cleaned, "./processed/cleaned_protein_data.csv", row.names = FALSE)

cat("Data preprocessing completed. Cleaned data saved in './processed/' folder.\n")
