#!/bin/bash

# Store FA cluster size in .txt file
# CON - COND t > 2.5 cluster summary at visit 1
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/FA_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/FA_tstat_clust_sum.txt
# CON - COND t > 2.5 cluster summary at visit 2
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/FA_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/FA_tstat_clust_sum.txt
# CON - COND t > 2.5 cluster summary at visit 3
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/FA_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/FA_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap1.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap1.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap2.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap2.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap_vox_tstat1.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap_vox_tstat2.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/FA_overlap_vox_tstat_clust_sum.txt

# Store MD cluster size in .txt file
# CON - COND t > 2.5 cluster summary at visit 1
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/MD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/MD_tstat_clust_sum.txt
# CON - COND t > 2.5 cluster summary at visit 2
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/MD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/MD_tstat_clust_sum.txt
# CON - COND t > 2.5 cluster summary at visit 1
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/MD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/MD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap1.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap1.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap2.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap2.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap_vox_tstat1.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap_vox_tstat2.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/MD_overlap_vox_tstat_clust_sum.txt

# Store RD cluster size in .txt file
# CON - COND t > 2.5 cluster summary at visit 1
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/RD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/RD_tstat_clust_sum.txt
# CON - COND t > 2.5 cluster summary at visit 2
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/RD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/RD_tstat_clust_sum.txt
# CON - COND t > 2.5 cluster summary at visit 1
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/RD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/RD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap1.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap1.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap2.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap2.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap_vox_tstat1.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap_vox_tstat2.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/RD_overlap_vox_tstat_clust_sum.txt

# Store AD cluster size in .txt file
# CON - COND t > 2.5 cluster summary at visit 1
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/AD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/AD_tstat_clust_sum.txt
# CON - COND t > 2.5 cluster summary at visit 2
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/AD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/AD_tstat_clust_sum.txt
# CON - COND t > 2.5 cluster summary at visit 1
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/AD_tstat1_clust_sum.txt
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/AD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap1.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap1.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap2.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap2.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/temp3.nii.gz
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap_vox_tstat1.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap_vox_tstat2.txt > /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/overlap/AD_overlap_vox_tstat_clust_sum.txt