# GettingAndCleaningData_Assignment
This repo contains my assignment for the Getting And Cleaning Data course from Coursera.

The data analysed was generated in an experiment where volunteers performed differente activities while carrying a smartphone in their waist. In this way, data from the smartphone accelerometers and gyroscopes was captured for analysis.

The job to be done in this analysis was to collect all this data, put it in a single tidy (following Hadley Wickham definition) data-frame, with readable names.

After that the data was group-by activities (6 in total) and subjects, and with those groups was done the calculation of the average value of the variables from the experiments.

That been said, this repo contains the following files:
-   this very readable readme.md.
-   run.analysis.R: this is the R script that does all the work, from loading the txt files, to merging and editing it, untill the very end when the data is summarized in a nice and tidy way. Running the analysis it will write a txt file named "Step5_tidy.txt", which contains the summarized data with the average values for the groups "Acitivities" and "SubjectID".
-   a codebook.md describing the variables.
