# Clinical Trial Data Analysis using SAS

This project performs a comprehensive analysis of an anonymized clinical trial dataset (`Clinical Data_Discovery_Cohort.csv`) using **SAS Base**. It includes statistical summaries, frequency distributions, patient profiles, survival event listings, graphical visualizations, and a professional PDF report. The analysis focuses on **survival time**, **demographic distributions**, and **clinical outcomes**.

---

##  Objectives

- Compute summary statistics for survival time by sex and race.
- Analyze frequency distributions of sex, race, stage, and survival status.
- Generate patient profiles and survival event listings.
- Create visualizations (bar charts and histogram) for key variables.
- Produce a professional PDF report with all results.

---

##  Tools & Technologies

- **SAS Base** – Data manipulation and statistical analysis
- **PROC IMPORT** – Import CSV dataset
- **PROC MEANS** – Generate summary statistics
- **PROC FREQ** – Frequency distributions
- **PROC REPORT** – Tabular listings
- **PROC SGPLOT** – Graphical visualizations
- **ODS PDF** – PDF report compilation

---

##  Repository Contents

| File                                 | Description                           |
| ------------------------------------ | ------------------------------------- |
| `clinical_trial_analysis.sas`        | SAS script for complete analysis      |
| `Clinical Data_Discovery_Cohort.csv` | Input dataset                         |
| `clinical_trial_report.pdf`          | PDF report with all tables and graphs |
| `sex_by_race.png`                    | Bar chart: Sex by race distribution   |
| `stage_by_survival.png`              | Bar chart: Stage by survival status   |
| `survival_time_histogram.png`        | Histogram of survival time            |
| `.gitignore`                         | Ignores SAS temporary files           |
| `LICENSE`                            | MIT License                           |

---

##  Dataset Description

The dataset `Clinical Data_Discovery_Cohort.csv` contains **30 patient records** with the following columns:

- `PatientID` – Unique identifier
- `Specimen date` – Date of specimen collection
- `Dead or Alive` – Survival status (Alive/Dead)
- `Date of Death` – Date of death (if applicable)
- `Date of Last Follow Up` – Last follow-up date
- `sex` – Patient sex (M/F)
- `race` – Patient race (B/W/A/O)
- `Stage` – Cancer stage (e.g., PT2N2MX, T2N0)
- `Event` – Survival event (1 = Death, 0 = Censored)
- `Time` – Survival time in days


---





###  Summary Statistics
- Mean, Std Dev, Min, Max, Count of survival time grouped by **sex** and **race**.

###  Frequency Tables
- Sex by race  
- Stage by survival status  
- Event count (1 = Death, 0 = Censored)

###  Patient Profiles
- Table with Patient ID, sex, race, stage, survival status, and time.

### ⚰ Survival Event Listings
- Details for patients who died (Event = 1).

###  Visualizations
- `sex_by_race.png` – Bar chart: Sex by race
- `stage_by_survival.png` – Bar chart: Stage by survival status
- `survival_time_histogram.png` – Histogram: Survival time in days



---
