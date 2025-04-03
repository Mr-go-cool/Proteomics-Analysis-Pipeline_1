# KEGG Pathway Enrichment Analysis (Step 6)

# Load required libraries
library(tidyverse)
library(clusterProfiler)
library(tidyr)

# Set your working directory (adjust as needed)
setwd("../data")

# Load gene-mapped protein data
final_data <- read.csv("./processed/proteins_gene_info.csv", stringsAsFactors = FALSE)

# Perform KEGG pathway enrichment analysis
kegg_results <- enrichKEGG(
  gene = final_data$Entrez_ID,
  organism = "hsa",
  keyType = "kegg"
)

# Extract pathway information and calculate enrichment scores
kegg_df <- as.data.frame(kegg_results) %>%
  select(ID, Description, geneID, pvalue, p.adjust, GeneRatio) %>%
  mutate(Enrichment_Score = sapply(strsplit(GeneRatio, "/"),
                                   function(x) as.numeric(x[1]) / as.numeric(x[2]))) %>%
  separate_rows(geneID, sep = "/") %>%
  rename(Pathway_ID = ID,
         Pathway_Name = Description,
         Entrez_ID = geneID,
         P_Value = pvalue,
         Adjusted_P_Value = p.adjust)

# Merge pathway enrichment results with original protein-gene data
final_results <- merge(final_data, kegg_df, by = "Entrez_ID", all.x = TRUE) %>%
  select(Protein.Ids, Protein.Names, Genes, PG.Quantity, Entrez_ID, Ensembl_ID,
         Pathway_ID, Pathway_Name, Enrichment_Score) %>%
  distinct()

# Save final enriched dataset
write.csv(final_results, "../results/proteins_KEGG_enrichment.csv", row.names = FALSE)

cat("KEGG pathway enrichment analysis completed. Results saved in '../results/' folder.\n")
