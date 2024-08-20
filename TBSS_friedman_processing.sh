#!/bin/bash

### This script is used to filter out DTI metrics not in the overlapping skeleton of the three visits. For reproducibility analysis (friedman)
# multiply skeleton mask from all visits to get common skeleton mask
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/mean_FA_skeleton_mask.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/mean_FA_skeleton_mask.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/mean_FA_skeleton_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz

### Create whole skeleton FA files with skeleton_mask_all
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_FA_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_FA_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_FA_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_FA_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_FA_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_FA_v3.nii.gz

### Create whole skeleton MD files with skeleton_mask_all
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_MD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_MD_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_MD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_MD_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_MD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_MD_v3.nii.gz

### Create whole skeleton RD files with skeleton_mask_all
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_RD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_RD_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_RD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_RD_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_RD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_RD_v3.nii.gz

### Create whole skeleton AD files with skeleton_mask_all
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_AD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_AD_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_AD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_AD_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_AD_skeletonised.nii.gz -mul //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_AD_v3.nii.gz


# Do the same operations but for the overlap of tstat files
### for FA
# binarize overlapping clusters
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_overlap1.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap1_mask.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_overlap2.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap2_mask.nii.gz
# apply masks to FA maps from all visit
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/FA_overlap1_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/FA_overlap2_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/FA_overlap1_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/FA_overlap2_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/FA_overlap1_v3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/FA_overlap2_v3.nii.gz

### for MD
# binarize overlapping clusters
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/MD_overlap1.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap1_mask.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/MD_overlap2.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap2_mask.nii.gz
# apply masks to MD maps from all visit
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_MD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/MD_overlap1_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_MD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/MD_overlap2_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_MD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/MD_overlap1_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_MD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/MD_overlap2_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_MD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/MD_overlap1_v3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_MD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/MD_overlap2_v3.nii.gz

### for RD
# binarize overlapping clusters
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/RD_overlap1.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap1_mask.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/RD_overlap2.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap2_mask.nii.gz
# apply masks to RD maps from all visit
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/RD_overlap1_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/RD_overlap2_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/RD_overlap1_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/RD_overlap2_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/RD_overlap1_v3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/RD_overlap2_v3.nii.gz

### for AD
# binarize overlapping clusters
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/AD_overlap1.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap1_mask.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/AD_overlap2.nii.gz -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap2_mask.nii.gz
# apply masks to AD maps from all visit
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/AD_overlap1_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/AD_overlap2_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/AD_overlap1_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/AD_overlap2_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap1_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/AD_overlap1_v3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap2_mask.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/AD_overlap2_v3.nii.gz
