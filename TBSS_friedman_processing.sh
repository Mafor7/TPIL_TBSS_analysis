#!/bin/bash

### This script is used to filter out DTI metrics not in the overlapping skeleton of the three visits. For reproducibility analysis (friedman)
# multiply skeleton mask from all visits to get common skeleton mask
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/mean_FA_skeleton_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/mean_FA_skeleton_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/mean_FA_skeleton_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz

# Do the same operations but with the whole skeleton files

### Create whole skeleton FA files with skeleton_mask_all
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_FA_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_FA_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_FA_v3.nii.gz

### Create whole skeleton MD files with skeleton_mask_all
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_MD_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_MD_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_MD_v3.nii.gz

### Create whole skeleton RD files with skeleton_mask_all
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_RD_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_RD_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_RD_v3.nii.gz

### Create whole skeleton AD files with skeleton_mask_all
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_AD_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_AD_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_AD_v3.nii.gz

# Do the same operations but for the overlap of tstat files
### for FA
### obtain cluster from visit 1 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v1_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v1_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v1_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v1_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v1_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v1_mask.nii.gz
### obtain cluster from visit 2 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v2_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v2_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v2_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v2_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v2_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v2_mask.nii.gz
### obtain cluster from visit 3 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v3_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v3_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v3_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v3_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v3_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v3_mask.nii.gz

# make masks of overlap files
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v2_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_overlap_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v2_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_overlap_mask.nii.gz

# apply masks to FA maps from all visit
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust1_v1_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust2_v1_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust1_v2_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust2_v2_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust1_v3_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust2_v3_conjunction.nii.gz

### for MD
### obtain cluster from visit 1 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v1_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v1_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v1_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v1_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v1_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v1_mask.nii.gz
### obtain cluster from visit 2 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v2_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v2_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v2_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v2_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v2_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v2_mask.nii.gz
### obtain cluster from visit 3 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v3_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v3_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v3_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v3_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v3_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v3_mask.nii.gz

# make masks of overlap files
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v2_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_overlap_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v2_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_overlap_mask.nii.gz
# apply masks to MD maps from all visit
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust1_v1_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust2_v1_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust1_v2_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust2_v2_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust1_v3_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust2_v3_conjunction.nii.gz

### for RD
### obtain cluster from visit 1 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v1_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v1_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v1_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v1_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v1_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v1_mask.nii.gz
### obtain cluster from visit 2 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v2_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v2_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v2_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v2_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v2_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v2_mask.nii.gz
### obtain cluster from visit 3 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v3_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v3_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v3_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v3_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v3_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v3_mask.nii.gz

# make masks of overlap files
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v2_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_overlap_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v2_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_overlap_mask.nii.gz
# apply masks to RD maps from all visit
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust1_v1_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust2_v1_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust1_v2_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust2_v2_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust1_v3_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust2_v3_conjunction.nii.gz

### for AD
### obtain cluster from visit 1 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v1_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v1_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v1_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v1_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v1_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v1_mask.nii.gz
### obtain cluster from visit 2 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v2_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v2_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v2_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v2_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v2_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v2_mask.nii.gz
### obtain cluster from visit 3 and binarize them to make mask
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat1.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_tstat1_clust.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat2.nii.gz -t 2.5 -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_tstat2_clust.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_tstat1_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v3_maski.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_tstat2_clust.nii.gz -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v3_maski.nii.gz
# make masks applicable to all visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v3_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v3_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v3_maski.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v3_mask.nii.gz

# make masks of overlap files
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v2_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_overlap_mask.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v2_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_overlap_mask.nii.gz
# apply masks to AD maps from all visit
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust1_v1_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust2_v1_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust1_v2_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust2_v2_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust1_v3_conjunction.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_overlap_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust2_v3_conjunction.nii.gz

##############################


# ### This next section is to obtain DTI metric values on clusters at different visit. These results were not used nor analyzed.

# # apply masks to FA maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v1_mask.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v1_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v1_maski.nii.gz

# # Do this for the other DTI metrics
# ### For MD
# # apply masks to MD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v1_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v1_maski.nii.gz

# ### For RD
# # apply masks to RD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v1_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v1_maski.nii.gz

# ### For AD
# # apply masks to AD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v1_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v1_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v1_maski.nii.gz

# # apply masks to FA maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/FA_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v2_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v2_maski.nii.gz

# # Do this for the other DTI metrics
# ### For MD
# # apply masks to MD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/MD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v2_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v2_maski.nii.gz

# ### For RD
# # apply masks to RD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/RD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v2_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v2_maski.nii.gz

# ### For AD
# # apply masks to AD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v2_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v2/AD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v2_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v2_maski.nii.gz


# # apply masks to FA maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/FA_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_v3_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_v3_maski.nii.gz

# # Do this for the other DTI metrics
# ### For MD
# # apply masks to MD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_MD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/MD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_v3_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_v3_maski.nii.gz

# ### For RD
# # apply masks to RD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/RD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_v3_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_v3_maski.nii.gz

# ### For AD
# # apply masks to AD maps from all visits
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_clust1_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_clust2_v1.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_clust1_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_clust2_v2.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_clust1_v3.nii.gz
# fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v3_mask.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v3/AD_clust2_v3.nii.gz
# rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_v3_maski.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_v3_maski.nii.gz
