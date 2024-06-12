#!/bin/bash

# Script to binarize variable friedman maps
# FA Friedman results
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust1_friedman_clbp_conjunction.nii.gz -t 6.0 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust_variable_friedman_clbp_conjunction.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust1_friedman_con_conjunction.nii.gz -t 6.0 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust_variable_friedman_con_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust_variable_friedman_clbp_conjunction.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust_variable_friedman_clbp_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust_variable_friedman_con_conjunction.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust_variable_friedman_con_conjunction.nii.gz

# MD Friedman results
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust1_friedman_clbp_conjunction.nii.gz -t 6.0 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust_variable_friedman_clbp_conjunction.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust1_friedman_con_conjunction.nii.gz -t 6.0 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust_variable_friedman_con_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust_variable_friedman_clbp_conjunction.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust_variable_friedman_clbp_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust_variable_friedman_con_conjunction.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust_variable_friedman_con_conjunction.nii.gz

# RD Friedman results
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust1_friedman_clbp_conjunction.nii.gz -t 6.0 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust_variable_friedman_clbp_conjunction.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust1_friedman_con_conjunction.nii.gz -t 6.0 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust_variable_friedman_con_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust_variable_friedman_clbp_conjunction.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust_variable_friedman_clbp_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust_variable_friedman_con_conjunction.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust_variable_friedman_con_conjunction.nii.gz

# AD Friedman results
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust1_friedman_clbp_conjunction.nii.gz -t 6.0 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust_variable_friedman_clbp_conjunction.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust1_friedman_con_conjunction.nii.gz -t 6.0 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust_variable_friedman_con_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust_variable_friedman_clbp_conjunction.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust_variable_friedman_clbp_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust_variable_friedman_con_conjunction.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust_variable_friedman_con_conjunction.nii.gz

