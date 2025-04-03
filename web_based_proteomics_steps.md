# Web-based Proteomics Analysis Steps (Steps 1, 2, and 3)

This document explains the initial web-based steps for proteomics analysis prior to using the R pipeline.

---

## Step 1: Raw Data Acquisition

**Database:** PRIDE Archive  
**Input Files:** Raw Mass Spectrometry (.raw) files

### Procedure:
1. Visit [PRIDE Archive](https://www.ebi.ac.uk/pride/archive/).
2. Search for datasets relevant to your biological condition or organism.
3. Download the `.raw` mass spectrometry files.

---

## Step 2: Raw Data Conversion to .mzML

**Tool:** ProteoWizard MSConvert  
**Input Files:** `.raw` files  
**Output Files:** `.mzML` files

### Procedure:
1. Download and install [ProteoWizard MSConvert](http://proteowizard.sourceforge.net/).
2. Open MSConvert GUI:
   - Select input files (.raw).
   - Select output format `.mzML`.
   - Choose your desired settings (typically default is fine).
3. Click `Start` to convert files.
4. Collect converted `.mzML` files.

---

## Step 3: Protein Identification using DIA-NN

**Tool:** DIA-NN  
**Input Files:** `.mzML` files  
**Output Files:** Identification results (`report.tsv`)

### Procedure:
1. Download DIA-NN from [official DIA-NN repository](https://github.com/vdemichev/DiaNN).
2. Install DIA-NN software and open the graphical interface.
3. Load `.mzML` files into DIA-NN.
4. Select appropriate reference proteome database (e.g., human).
5. Run DIA-NN to identify proteins and peptides.
6. Save generated results (`report.tsv`) for subsequent R-based analysis.

---

## Next Steps:
Proceed with the R-based analysis pipeline (Steps 4-6) using the output files from DIA-NN (`report.tsv`).
