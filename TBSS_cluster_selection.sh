#!/bin/bash

### For FA
### Get overlap cluster files
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_overlap_mask.nii.gz -t 0.1 --oindex=/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp.nii.gz
### Manually extract clusters of interest
fslmaths -dt int /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp1.nii.gz -thr 30 -uthr 30 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp30.nii.gz
fslmaths -dt int /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp1.nii.gz -thr 32 -uthr 32 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp32.nii.gz
fslmaths -dt int /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp1.nii.gz -thr 34 -uthr 34 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp34.nii.gz
### Combine them into one folder
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp30.nii.gz -add /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp32.nii.gz -add /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_temp34.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/FA_selected_clusters.nii.gz

### For RD
### Get overlap cluster files
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_overlap_mask.nii.gz -t 0.1 --oindex=/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/RD_temp.nii.gz
### Manually extract clusters of interest
fslmaths -dt int /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/RD_temp.nii.gz -thr 15 -uthr 15 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/RD_selected_clusters.nii.gz

### For AD
### Get overlap cluster files
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_overlap_mask.nii.gz -t 0.1 --oindex=/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/AD_temp.nii.gz
### Manually extract clusters of interest
fslmaths -dt int /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/AD_temp.nii.gz -thr 17 -uthr 17 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/selected_clusters/AD_selected_clusters.nii.gz

### Obtain DTI data for three visits for selected clusters for I2C2 analysis

# For FA cluster 30
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp30.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp30_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp30.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp30_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp30.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp30_v3.nii.gz

# For FA cluster 32
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp32.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp32_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp32.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp32_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp32.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp32_v3.nii.gz

# For FA cluster 34
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp34.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp34_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp34.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp34_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_FA_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/FA_temp34.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/FA_temp34_v3.nii.gz

# For RD cluster
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/RD_selected_clusters.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/RD_selected_clusters_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/RD_selected_clusters.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/RD_selected_clusters_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_RD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/RD_selected_clusters.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/RD_selected_clusters_v3.nii.gz

# For AD cluster
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/AD_selected_clusters.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/AD_selected_clusters_v1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/AD_selected_clusters.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/AD_selected_clusters_v2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/all_AD_skeletonised.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/AD_selected_clusters.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/selected_clusters/friedman/AD_selected_clusters_v3.nii.gz