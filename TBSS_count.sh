#!/bin/bash

### Input image file paths
## count voxel in skeletons
skeleton_mask_v1="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats/mean_FA_skeleton_mask.nii.gz"
skeleton_mask_v2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats/mean_FA_skeleton_mask.nii.gz"
skeleton_mask_v3="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats/mean_FA_skeleton_mask.nii.gz"
skeleton_mask_all="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/skeleton_mask_all.nii.gz"

## Count number of voxels for overlap (ADJUST THRESHOLD TO 0.1)
FA_overlap1="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat1_overlap_mask.nii.gz"
FA_overlap2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/FA_tstat2_overlap_mask.nii.gz"
MD_overlap1="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat1_overlap_mask.nii.gz"
MD_overlap2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/MD_tstat2_overlap_mask.nii.gz"
RD_overlap1="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat1_overlap_mask.nii.gz"
RD_overlap2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/RD_tstat2_overlap_mask.nii.gz"
AD_overlap1="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat1_overlap_mask.nii.gz"
AD_overlap2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask/AD_tstat2_overlap_mask.nii.gz"
## Count number of significant voxels per DTI metric for the friedman test (ADJUST THRESHOLD TO 5.991)
FA_fried_overlap_clbp="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust_friedman_clbp_conjunction.nii.gz"
FA_fried_overlap_con="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust_friedman_con_conjunction.nii.gz"
MD_fried_overlap_clbp="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust_friedman_clbp_conjunction.nii.gz"
MD_fried_overlap_con="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust_friedman_con_conjunction.nii.gz"
RD_fried_overlap_clbp="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust_friedman_clbp_conjunction.nii.gz"
RD_fried_overlap_con="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust_friedman_con_conjunction.nii.gz"
AD_fried_overlap_clbp="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust_friedman_clbp_conjunction.nii.gz"
AD_fried_overlap_con="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust_friedman_con_conjunction.nii.gz"

FA_fried_whole_clbp="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_FA_friedman_clbp.nii.gz"
FA_fried_whole_con="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_FA_friedman_con.nii.gz"
MD_fried_whole_clbp="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_MD_friedman_clbp.nii.gz"
MD_fried_whole_con="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_MD_friedman_con.nii.gz"
RD_fried_whole_clbp="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_RD_friedman_clbp.nii.gz"
RD_fried_whole_con="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_RD_friedman_con.nii.gz"
AD_fried_whole_clbp="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_AD_friedman_clbp.nii.gz"
AD_fried_whole_con="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_AD_friedman_con.nii.gz"

# Threshold value
threshold=0.1

# Function to count the number of voxels above a fixed threshold
count_voxels() {
    local input_image="$1"
    local output_file="$2"
    
    # Apply the threshold and binarize the image
    fslmaths "$input_image" -thr $threshold -bin "$output_file"
    
    # Count the number of voxels above the threshold
    local num_voxels_thresh=$(fslstats "$output_file" -V | awk '{print $1}')
    
    echo "Number of voxels above threshold ($threshold) for $input_image: $num_voxels_thresh"
}

### Display results 
count_voxels "$skeleton_mask_v1"
count_voxels "$skeleton_mask_v2"
count_voxels "$skeleton_mask_v3"
count_voxels "$skeleton_mask_all"


count_voxels "$FA_overlap1"
count_voxels "$FA_overlap2"
count_voxels "$MD_overlap1"
count_voxels "$MD_overlap2"
count_voxels "$RD_overlap1"
count_voxels "$RD_overlap2"
count_voxels "$AD_overlap1"
count_voxels "$AD_overlap2"


# count_voxels "$FA_fried_overlap_clbp"
# count_voxels "$FA_fried_overlap_con"
# count_voxels "$MD_fried_overlap_clbp"
# count_voxels "$MD_fried_overlap_con"
# count_voxels "$RD_fried_overlap_clbp"
# count_voxels "$RD_fried_overlap_con"
# count_voxels "$AD_fried_overlap_clbp"
# count_voxels "$AD_fried_overlap_con"

# count_voxels "$FA_fried_whole_clbp"
# count_voxels "$FA_fried_whole_con"
# count_voxels "$MD_fried_whole_clbp"
# count_voxels "$MD_fried_whole_con"
# count_voxels "$RD_fried_whole_clbp"
# count_voxels "$RD_fried_whole_con"
# count_voxels "$AD_fried_whole_clbp"
# count_voxels "$AD_fried_whole_con"
