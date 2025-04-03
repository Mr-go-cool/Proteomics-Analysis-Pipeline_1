# Proteomics Gene Mapping (Step 5)

# Load required libraries
library(tidyverse)
library(biomaRt)

# Set your working directory (adjust as needed)
setwd("../data")

# Load preprocessed protein data
protein_df <- read.csv("./processed/cleaned_protein_data.csv", stringsAsFactors = FALSE)

# Remove duplicates by keeping the entry with the highest PG.Quantity for each gene
unique_proteins <- protein_df %>%
  group_by(Genes) %>%
  arrange(desc(PG.Quantity)) %>%
  slice(1) %>%
  ungroup()

# Connect to Ensembl database (Human)
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")

# Convert Protein IDs to Entrez and Ensembl IDs
protein_info <- getBM(
  attributes = c("uniprotswissprot", "entrezgene_id", "ensembl_gene_id"),
  filters = "uniprotswissprot",
  values = unique(unique_proteins$Protein.Ids),
  mart = ensembl
)

# Merge protein data with gene info
final_data <- merge(unique_proteins, protein_info, 
                    by.x = "Protein.Ids", by.y = "uniprotswissprot",
                    all.x = TRUE) %>%
  filter(!is.na(entrezgene_id) & !is.na(ensembl_gene_id)) %>%
  rename(Entrez_ID = entrezgene_id,
         Ensembl_ID = ensembl_gene_id)

# Save mapped data
write.csv(final_data, "./processed/proteins_gene_info.csv", row.names = FALSE)

cat("Gene mapping completed. Gene-mapped data saved in './processed/' folder.\n")
