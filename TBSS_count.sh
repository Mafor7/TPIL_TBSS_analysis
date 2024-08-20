#!/bin/bash

### Input image file paths
## count voxel in skeletons
skeleton_mask_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/mean_FA_skeleton_mask.nii.gz"
skeleton_mask_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats/mean_FA_skeleton_mask.nii.gz"
skeleton_mask_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats/mean_FA_skeleton_mask.nii.gz"
skeleton_mask_all="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/skeleton_mask_all.nii.gz"

## Count number of voxels for tstat 2.5
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat1_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat2_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat1_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat2_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat1_v3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat2_v3.nii.gz

fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat1_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat2_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat1_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat2_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat1_v3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat2_v3.nii.gz

fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat1_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat2_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat1_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat2_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat1_v3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat2_v3.nii.gz

fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat1_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat2_v1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat1_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat2_v2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat1_v3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat2_v3.nii.gz

FAtstat1_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat1_v1.nii.gz"
FAtstat2_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat2_v1.nii.gz"
FAtstat1_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat1_v2.nii.gz"
FAtstat2_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat2_v2.nii.gz"
FAtstat1_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat1_v3.nii.gz"
FAtstat2_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/FA_tstat2_v3.nii.gz"
MDtstat1_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat1_v1.nii.gz"
MDtstat2_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat2_v1.nii.gz"
MDtstat1_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat1_v2.nii.gz"
MDtstat2_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat2_v2.nii.gz"
MDtstat1_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat1_v3.nii.gz"
MDtstat2_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/MD_tstat2_v3.nii.gz"
RDtstat1_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat1_v1.nii.gz"
RDtstat2_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat2_v1.nii.gz"
RDtstat1_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat1_v2.nii.gz"
RDtstat2_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat2_v2.nii.gz"
RDtstat1_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat1_v3.nii.gz"
RDtstat2_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/RD_tstat2_v3.nii.gz"
ADtstat1_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat1_v1.nii.gz"
ADtstat2_v1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat2_v1.nii.gz"
ADtstat1_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat1_v2.nii.gz"
ADtstat2_v2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat2_v2.nii.gz"
ADtstat1_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat1_v3.nii.gz"
ADtstat2_v3="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/AD_tstat2_v3.nii.gz"

## Count number of voxels for overlap (ADJUST THRESHOLD TO 0.1)
FA_overlap1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap1_mask.nii.gz"
FA_overlap2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/FA_overlap2_mask.nii.gz"
MD_overlap1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap1_mask.nii.gz"
MD_overlap2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/MD_overlap2_mask.nii.gz"
RD_overlap1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap1_mask.nii.gz"
RD_overlap2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/RD_overlap2_mask.nii.gz"
AD_overlap1="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap1_mask.nii.gz"
AD_overlap2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/mask/AD_overlap2_mask.nii.gz"
## Count number of significant voxels per DTI metric for the friedman test (ADJUST THRESHOLD TO 5.991)
FA_fried_overlap_clbp="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_clbp.nii.gz"
FA_fried_overlap_con="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap_friedman_con.nii.gz"
MD_fried_overlap_clbp="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_clbp.nii.gz"
MD_fried_overlap_con="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap_friedman_con.nii.gz"
RD_fried_overlap_clbp="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_clbp.nii.gz"
RD_fried_overlap_con="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap_friedman_con.nii.gz"
AD_fried_overlap_clbp="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_clbp.nii.gz"
AD_fried_overlap_con="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap_friedman_con.nii.gz"

FA_fried_whole_clbp="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_FA_friedman_clbp.nii.gz"
FA_fried_whole_con="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_FA_friedman_con.nii.gz"
MD_fried_whole_clbp="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_MD_friedman_clbp.nii.gz"
MD_fried_whole_con="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_MD_friedman_con.nii.gz"
RD_fried_whole_clbp="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_RD_friedman_clbp.nii.gz"
RD_fried_whole_con="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_RD_friedman_con.nii.gz"
AD_fried_whole_clbp="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_AD_friedman_clbp.nii.gz"
AD_fried_whole_con="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_AD_friedman_con.nii.gz"

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
# count_voxels "$skeleton_mask_v1"
# count_voxels "$skeleton_mask_v2"
# count_voxels "$skeleton_mask_v3"
count_voxels "$skeleton_mask_all"


count_voxels "$FA_overlap1"
count_voxels "$FA_overlap2"
count_voxels "$MD_overlap1"
count_voxels "$MD_overlap2"
count_voxels "$RD_overlap1"
count_voxels "$RD_overlap2"
count_voxels "$AD_overlap1"
count_voxels "$AD_overlap2"

count_voxels "$FAtstat1_v1"
count_voxels "$FAtstat2_v1"
count_voxels "$FAtstat1_v2"
count_voxels "$FAtstat2_v2"
count_voxels "$FAtstat1_v3"
count_voxels "$FAtstat2_v3"
count_voxels "$MDtstat1_v1"
count_voxels "$MDtstat2_v1"
count_voxels "$MDtstat1_v2"
count_voxels "$MDtstat2_v2"
count_voxels "$MDtstat1_v3"
count_voxels "$MDtstat2_v3"
count_voxels "$RDtstat1_v1"
count_voxels "$RDtstat2_v1"
count_voxels "$RDtstat1_v2"
count_voxels "$RDtstat2_v2"
count_voxels "$RDtstat1_v3"
count_voxels "$RDtstat2_v3"
count_voxels "$ADtstat1_v1"
count_voxels "$ADtstat2_v1"
count_voxels "$ADtstat1_v2"
count_voxels "$ADtstat2_v2"
count_voxels "$ADtstat1_v3"
count_voxels "$ADtstat2_v3"

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
