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

