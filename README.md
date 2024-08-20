# TPIL_TBSS_analysis

Here is a manual to help you guide through my scripts and how I've used them for my research:

First, I started processing my images with FSL's TBSS tool in the script TBSS_processing.sh. 
This script runs TBSS analysis between clbp and control for visit 1, 2 and 3 for FA, RD, MD and AD 
and also between control v1 and v2, v1 and v3 and v2 and v3 and also between clbp v1 and v2, v1 and v3 and v2 and v3. 
Uses files in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/data to make folders in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT. 
(file_functions.py cn help to manipulate files)
Results in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT.

Second, TBSS_cluster_txt.sh will take the output files created by TBSS_processing.sh and store them as .txt files.
It will combine tstat1 (CLBP > CTL) and tstat2 (CLBP < CTL) files together for FA, RD, MD and AD.
Results in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT.
The script will also find the overlapping significant voxels between visit and store them in a .txt file for FA, RD, MD and AD.
Results in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap.

Third, the histogram.py script will use these text files to make histograms of the number of significant voxels per cluster size.
This will allow me to compare significantly different clusters between groups and time points.
Results in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results.


I also want to do the friedman test on different voxels of the TBSS skeleton. TBSS_friedman_processing.sh prepares the desired files.
It thresholds the tstat maps from the TBSS analysis, binarizes them and multiplies these files with the common skeleton mask for all visits.
It can then multiply this mask to the DTI metric according to the corresponding visit. It does this operation for all DTI metrics for every visit 
with the all TBSS clusters, overlapping clusters and whole skeleton.
TBSS_friedman_analyis.py uses the friedman_variability_img() function to extract the FA values and put them in a Dataframe to calculate 
the Friedman statistics. It then outputs the friedman statistics on the images. 
Results in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman.

TBSS_count.sh is a script that counts the number of voxels in a specific image.

figures_functions.py is a script to make plotly sunburst charts (uses /Users/Marc-Antoine/Downloads/figure_data_thesis.xlsx)

TBSS_variable_cluster.sh is a script to creates files with only the variable clusters with Friedman test
Results in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results.

TBSS_cluster_selection.sh is a script that creates files for the selected clusters
Results in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters

TBSS_CohenD.py is a script to plot histogram of selected clusters.
Uses data in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters and stores results in same folders

TBSS_R_processing prepares data for I2C2 analysis. This analysis is done with R, in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis.
Results in /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis.

Tractometry_functions.py is a script to make tractometry figures. Uses /Users/Marc-Antoine/Downloads/excels_tractometry.

