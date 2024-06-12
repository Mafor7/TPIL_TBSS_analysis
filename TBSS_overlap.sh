#!/bin/bash

# Call files to calculate overlap:
skeleton1="/Volumes/PT_DATA2/Marc-Antoine/TBSS/data/v1/stats/mean_FA_skeleton_mask.nii.gz"
skeleton2="/Volumes/PT_DATA2/Marc-Antoine/TBSS/data/v2/stats/mean_FA_skeleton_mask.nii.gz"
skeleton3="/Volumes/PT_DATA2/Marc-Antoine/TBSS/data/v3/stats/mean_FA_skeleton_mask.nii.gz"

crossing_fibers1="/Volumes/PT_DATA2/Marc-Antoine/TBSS/mask/crossing_fibers_binary_mask_1.nii.gz"
crossing_fibers2="/Volumes/PT_DATA2/Marc-Antoine/TBSS/mask/crossing_fibers_binary_mask_2.nii.gz"
crossing_fibers3="/Volumes/PT_DATA2/Marc-Antoine/TBSS/mask/crossing_fibers_binary_mask_3.nii.gz"
crossing_fibers4="/Volumes/PT_DATA2/Marc-Antoine/TBSS/mask/crossing_fibers_binary_mask_4.nii.gz"

overlap="/Volumes/PT_DATA2/Marc-Antoine/TBSS/mask/FA/skeleton_mask_all.nii.gz"

# Count the number of overlapping voxels for each skeleton
overlap_voxels_skeleton1=$(fslstats "$overlap" -k "$skeleton1" -V | awk '{print $1}')
overlap_voxels_skeleton2=$(fslstats "$overlap" -k "$skeleton2" -V | awk '{print $1}')
overlap_voxels_skeleton3=$(fslstats "$overlap" -k "$skeleton3" -V | awk '{print $1}')

# Count the total number of voxels for each skeleton
total_voxels_skeleton1=$(fslstats "$skeleton1" -V | awk '{print $1}')
total_voxels_skeleton2=$(fslstats "$skeleton2" -V | awk '{print $1}')
total_voxels_skeleton3=$(fslstats "$skeleton3" -V | awk '{print $1}')

# Compute the ratio of overlapping voxels per total voxels for each skeleton
ratio_skeleton1=$(echo "scale=4; $overlap_voxels_skeleton1 / $total_voxels_skeleton1" | bc)
ratio_skeleton2=$(echo "scale=4; $overlap_voxels_skeleton2 / $total_voxels_skeleton2" | bc)
ratio_skeleton3=$(echo "scale=4; $overlap_voxels_skeleton3 / $total_voxels_skeleton3" | bc)

echo "Ratio of overlapping voxels to total voxels for Skeleton v1: $ratio_skeleton1"
echo "Ratio of overlapping voxels to total voxels for Skeleton v2: $ratio_skeleton2"
echo "Ratio of overlapping voxels to total voxels for Skeleton v3: $ratio_skeleton3"

# Count the number of overlapping voxels for each NuFO
overlap_voxels_crossing_fibers1=$(fslstats "$overlap" -k "$crossing_fibers1" -V | awk '{print $1}')
overlap_voxels_crossing_fibers2=$(fslstats "$overlap" -k "$crossing_fibers2" -V | awk '{print $1}')
overlap_voxels_crossing_fibers3=$(fslstats "$overlap" -k "$crossing_fibers3" -V | awk '{print $1}')
overlap_voxels_crossing_fibers4=$(fslstats "$overlap" -k "$crossing_fibers4" -V | awk '{print $1}')

# Count the total number of voxels of overlap skeleton
total_voxels_overlap=$(fslstats "$overlap" -V | awk '{print $1}')

# Compute the ratio of overlapping voxels for each NuFO per total voxels of the overlap skeleton
ratio_crossing_fibers1=$(echo "scale=4; $overlap_voxels_crossing_fibers1 / $total_voxels_overlap" | bc)
ratio_crossing_fibers2=$(echo "scale=4; $overlap_voxels_crossing_fibers2 / $total_voxels_overlap" | bc)
ratio_crossing_fibers3=$(echo "scale=4; $overlap_voxels_crossing_fibers3 / $total_voxels_overlap" | bc)
ratio_crossing_fibers4=$(echo "scale=4; $overlap_voxels_crossing_fibers4 / $total_voxels_overlap" | bc)

echo "Ratio of NuFO=1 voxels to total voxels for overlap Skeleton : $ratio_crossing_fibers1"
echo "Ratio of NuFO=2 voxels to total voxels for overlap Skeleton : $ratio_crossing_fibers2"
echo "Ratio of NuFO=3 voxels to total voxels for overlap Skeleton : $ratio_crossing_fibers3"
echo "Ratio of NuFO=4 voxels to total voxels for overlap Skeleton : $ratio_crossing_fibers4"

