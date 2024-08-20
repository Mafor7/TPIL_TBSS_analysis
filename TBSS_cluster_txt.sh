#!/bin/bash

### for clbp - conT
# Store FA cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/FA_overlap_vox_tstat_clust_sum.txt

# Store MD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/MD_overlap_vox_tstat_clust_sum.txt

# Store RD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/RD_overlap_vox_tstat_clust_sum.txt

# Store AD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/AD_overlap_vox_tstat_clust_sum.txt


### for clbp - conD
# Store FA cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/FA_overlap_vox_tstat_clust_sum.txt

# Store MD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/MD_overlap_vox_tstat_clust_sum.txt

# Store RD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/RD_overlap_vox_tstat_clust_sum.txt

# Store AD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/AD_overlap_vox_tstat_clust_sum.txt


### for conT - conD
# Store FA cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/FA_overlap_vox_tstat_clust_sum.txt

# Store MD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/MD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/MD_overlap_vox_tstat_clust_sum.txt

# Store RD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/RD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/RD_overlap_vox_tstat_clust_sum.txt

# Store AD cluster size in .txt file
# CLBP - CON t > 2.5 cluster summary at visit 1
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 2
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat2.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat_clust_sum.txt
# CLBP - CON t > 2.5 cluster summary at visit 3
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat1.nii.gz -t 2.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat1_clust_sum.txt
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat2.nii.gz -t 2.5 > //Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat2_clust_sum.txt
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat1_clust_sum.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat2_clust_sum.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat1.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap1.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap1.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap_vox_tstat1.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz 
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/AD_tstat2.nii.gz -thr 2.5 -bin /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz
fslmaths /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz -mul /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap2.nii.gz
cluster -i /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap2.nii.gz -t 0.5 > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap_vox_tstat2.txt
rm /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp1.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp2.nii.gz /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap_vox_tstat1.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap_vox_tstat2.txt > /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/AD_overlap_vox_tstat_clust_sum.txt
