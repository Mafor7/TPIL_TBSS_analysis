#!/bin/bash

# Script to binarize variable friedman maps
# FA Friedman results
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_clbp.nii.gz -t 6.0 -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_clbp_variable.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_con.nii.gz -t 6.0 -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_con_variable.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_clbp_variable.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_clbp_variable.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_con_variable.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_con_variable.nii.gz

# MD Friedman results
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_clbp.nii.gz -t 6.0 -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_clbp_variable.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_con.nii.gz -t 6.0 -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_con_variable.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_clbp_variable.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_clbp_variable.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_con_variable.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_con_variable.nii.gz

# RD Friedman results
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_clbp.nii.gz -t 6.0 -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_clbp_variable.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_con.nii.gz -t 6.0 -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_con_variable.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_clbp_variable.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_clbp_variable.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_con_variable.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_con_variable.nii.gz

# AD Friedman results
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_clbp.nii.gz -t 6.0 -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_clbp_variable.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_con.nii.gz -t 6.0 -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_con_variable.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_clbp_variable.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_clbp_variable.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_con_variable.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_con_variable.nii.gz
