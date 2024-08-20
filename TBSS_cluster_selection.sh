#!/bin/bash

### For FA
### Get overlap cluster files
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_overlap2.nii.gz -t 0.1 --oindex=/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_temp.nii.gz
### Manually extract clusters of interest
fslmaths -dt int /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_temp.nii.gz -thr 30 -uthr 30 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30.nii.gz
fslmaths -dt int /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_temp.nii.gz -thr 31 -uthr 31 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31.nii.gz
fslmaths -dt int /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_temp.nii.gz -thr 34 -uthr 34 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34.nii.gz
fslmaths -dt int /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_temp.nii.gz -thr 35 -uthr 35 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35.nii.gz


### For RD
### Get overlap cluster files
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/RD_overlap1.nii.gz -t 0.1 --oindex=/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/RD_temp.nii.gz
### Manually extract clusters of interest
fslmaths -dt int /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/RD_temp.nii.gz -thr 13 -uthr 13 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13.nii.gz

### For AD
### Get overlap cluster files
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/AD_overlap1.nii.gz -t 0.1 --oindex=/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/AD_temp.nii.gz
### Manually extract clusters of interest
fslmaths -dt int /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/AD_temp.nii.gz -thr 13 -uthr 13 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13.nii.gz

### Obtain DTI data for three visits for selected clusters for I2C2 analysis

# For FA cluster 30
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30_v3.nii.gz

# For FA cluster 31
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31_v3.nii.gz

# For FA cluster 34
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34_v3.nii.gz

# For FA cluster 35 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_FA_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35_v3.nii.gz

# For RD cluster
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_RD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13_v3.nii.gz

# For AD cluster
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/all_AD_skeletonised.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13_v3.nii.gz

