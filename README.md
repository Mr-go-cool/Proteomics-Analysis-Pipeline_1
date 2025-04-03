# Proteomics-Analysis-Pipeline_1
A comprehensive R-based workflow for proteomics data analysis, including data preprocessing, protein identification, gene mapping, and KEGG pathway enrichment. Suitable for analyzing proteomic datasets across various biological conditions

# Proteomics Analysis Pipeline

## Introduction

This repository provides a comprehensive proteomics data analysis workflow implemented in R. The workflow covers the complete analytical pipeline from initial data acquisition and preprocessing to gene mapping and pathway enrichment analysis using KEGG. This pipeline is applicable for analyzing proteomic datasets across diverse biological conditions, providing researchers with a robust framework for extracting meaningful biological insights from proteomics data.

## Detailed Workflow Steps

### Step 1: Raw Data Acquisition (Web-based)
- **Database Used:** PRIDE Archive
- **Input Data:** Raw mass spectrometry (MS) files (e.g., .raw format)
- **Purpose:** Obtain initial MS data for subsequent analysis.
- **Website:** [PRIDE Archive](https://www.ebi.ac.uk/pride/archive/)

### Step 2: Raw Data Conversion (Web-based)
- **Input:** Raw MS files (.raw, .mzXML)
- **Purpose:** Convert raw files to standardized file formats (.mzML)
- **Tool Used:** MSConvert (ProteoWizard)
- **Website/Tool:** [ProteoWizard MSConvert](http://proteowizard.sourceforge.net/)

### Step 3: Protein Identification (Web-based)
- **Input:** Converted MS data files (.mzML)
- **Reference Proteome:** Selected organism (e.g., Homo sapiens)
- **Purpose:** Identify proteins and peptides within the MS data.
- **Tool Used:** DIA-NN
- **Output:** Identification result files (e.g., report.tsv)
- **Website/Tool:** [DIA-NN Software](https://github.com/vdemichev/DiaNN)

### Step 4: Data Preprocessing (R)
- **Purpose:** Data extraction, cleaning, and preparation for downstream analysis
- **Steps:**
  - Load and clean DIA-NN output.
  - Extract essential columns (Protein Names, Genes, Protein IDs, Quantities).
  - Remove missing values.
  - Save the cleaned dataset for further processing.

### Step 5: Gene Mapping (R)
- **Purpose:** Map identified proteins to corresponding gene information (Entrez ID and Ensembl ID)
- **Steps:**
  - Connect to Ensembl database via biomaRt.
  - Convert protein IDs to standardized gene IDs.
  - Merge gene IDs with the original protein data.
  - Save the mapped gene-protein dataset.

### Step 6: KEGG Pathway Enrichment Analysis (R)
- **Purpose:** Identify significantly enriched biological pathways among identified proteins
- **Steps:**
  - Conduct KEGG enrichment analysis using clusterProfiler.
  - Extract pathway information, enrichment scores, and statistical significance.
  - Merge pathway enrichment results with protein-gene mapping data.
  - Finalize and save enriched pathway dataset for biological interpretation.

---
