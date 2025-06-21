/* Step 1: Import the CSV dataset (unchanged from previous) */
proc import datafile="/home/u63934122/Parag/Clinical Data_Discovery_Cohort.csv"
    out=clinical_data
    dbms=csv
    replace;
    getnames=yes;
run;

/* Step 2: Data Cleaning and Preparation (unchanged from previous) */
data clinical_data_cleaned;
    set clinical_data;
    specimen_date = input(specimen_date, mmddyy10.);
    date_of_death = input(date_of_death, mmddyy10.);
    date_of_last_follow_up = input(date_of_last_follow_up, mmddyy10.);
    sex = upcase(sex);
    race = upcase(race);
    stage = upcase(stage);
    format specimen_date date_of_death date_of_last_follow_up mmddyy10.;
run;

/* Step 3: Validate Data for PROC FREQ */
proc contents data=clinical_data_cleaned;
    title "Variable Details for clinical_data_cleaned";
run;

proc print data=clinical_data_cleaned (obs=5);
    title "First 5 Observations of clinical_data_cleaned";
run;

/* Step 4: Frequency Analysis using PROC FREQ */
proc freq data=clinical_data_cleaned;
    tables sex*race / nocol norow nopercent;
    title "Frequency Distribution of Sex by Race";
run;

proc freq data=clinical_data_cleaned;
    tables stage*'Dead or Alive'n / nocol norow nopercent;
    title "Frequency of Stage by Survival Status";
run;

proc freq data=clinical_data_cleaned;
    tables event / nocol norow nopercent;
    title "Frequency of Survival Events (1=Death, 0=Censored)";
run;

/* Rest of the code (unchanged, included for context) */
proc means data=clinical_data_cleaned n mean std min max;
    var time;
    class SEX RACE;
    title "Summary Statistics for Survival Time by Sex and Race";
    output out=time_stats;
run;

proc report data=clinical_data_cleaned nowd;
    column patientid sex race stage 'Dead or Alive'n time;
    define patientid / display "Patient ID";
    define sex / display "Sex";
    define race / display "Race";
    define stage / display "Stage";
    define 'Dead or Alive'n / display "Survival Status";
    define time / display "Survival Time (Days)";
    title "Patient Profiles";
run;

proc report data=clinical_data_cleaned nowd;
    column patientid specimen_date date_of_death date_of_last_follow_up event time;
    define patientid / display "Patient ID";
    define specimen_date / display "Specimen Date";
    define date_of_death / display "Date of Death";
    define date_of_last_follow_up / display "Last Follow-Up Date";
    define event / display "Event (1=Death, 0=Censored)";
    define time / display "Survival Time (Days)";
    title "Survival Event Listings";
    where event = 1;
run;




/* Step 8: Graphical Analysis using PROC SGPLOT */
/* Set output to PNG files for GitHub */

proc sgplot data=clinical_data_cleaned;
    vbar sex / group=race groupdisplay=cluster;
    xaxis label="Sex";
    yaxis label="Count";
    title "Distribution of Sex by Race";
run;

/* Bar chart for Stage by Survival Status */

proc sgplot data=clinical_data_cleaned;
    vbar stage / group='Dead or Alive'n groupdisplay=cluster;
    xaxis label="Cancer Stage" fitpolicy=rotate;
    yaxis label="Count";
    title "Distribution of Stage by Survival Status";
run;

/* Histogram for Survival Time */
proc sgplot data=clinical_data_cleaned;
    histogram time / binwidth=500;
    xaxis label="Survival Time (Days)";
    yaxis label="Count";
    title "Histogram of Survival Time";
run;