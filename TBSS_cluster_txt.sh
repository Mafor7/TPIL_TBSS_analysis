#!/bin/bash

# # Store FA cluster size in .txt file
# # CLBP - CON t > 2.5 cluster summary at visit 1
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat_clust_sum.txt
# # CLBP - CON t > 2.5 cluster summary at visit 2
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat_clust_sum.txt
# # CLBP - CON t > 2.5 cluster summary at visit 3
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat_clust_sum.txt
# # CON1 - CON2 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat_clust_sum.txt
# # CON1 - CON3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat_clust_sum.txt
# # CON2 - CON3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat_clust_sum.txt
# # CLBP1 - CLBP2 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat_clust_sum.txt
# # CLBP1 - CLBP3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat_clust_sum.txt
# # CLBP2 - CLBP3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap1.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap1.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap2.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap2.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_vox_tstat1.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_vox_tstat2.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_vox_tstat_clust_sum.txt

fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap1_con.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap1_con.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_con_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap2_con.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap2_con.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_con_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 

fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap1_clbp.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap1_clbp.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_clbp_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap2_clbp.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap2_clbp.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/FA_overlap_clbp_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 


# # Store MD cluster size in .txt file
# # CLBP - CON t > 2.5 cluster summary at visit 1
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat_clust_sum.txt
# # CLBP - CON t > 2.5 cluster summary at visit 2
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat_clust_sum.txt
# # CLBP - CON t > 2.5 cluster summary at visit 3
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat_clust_sum.txt
# # CON1 - CON2 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat_clust_sum.txt
# # CON1 - CON3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat_clust_sum.txt
# # CON2 - CON3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat_clust_sum.txt
# # CLBP1 - CLBP2 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat_clust_sum.txt
# # CLBP1 - CLBP3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat_clust_sum.txt
# # CLBP2 - CLBP3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap1.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap1.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap2.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap2.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_vox_tstat1.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_vox_tstat2.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_vox_tstat_clust_sum.txt

fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap1_con.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap1_con.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_con_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap2_con.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap2_con.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_con_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 

fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap1_clbp.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap1_clbp.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_clbp_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap2_clbp.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap2_clbp.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/MD_overlap_clbp_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 


# # Store RD cluster size in .txt file
# # CLBP - CON t > 2.5 cluster summary at visit 1
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat_clust_sum.txt
# # CLBP - CON t > 2.5 cluster summary at visit 2
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat_clust_sum.txt
# # CLBP - CON t > 2.5 cluster summary at visit 3
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat_clust_sum.txt
# # CON1 - CON2 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat_clust_sum.txt
# # CON1 - CON3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat_clust_sum.txt
# # CON2 - CON3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat_clust_sum.txt
# # CLBP1 - CLBP2 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat_clust_sum.txt
# # CLBP1 - CLBP3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat_clust_sum.txt
# # CLBP2 - CLBP3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap1.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap1.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap2.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap2.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_vox_tstat1.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_vox_tstat2.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_vox_tstat_clust_sum.txt

fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap1_con.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap1_con.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_con_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap2_con.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap2_con.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_con_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 

fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap1_clbp.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap1_clbp.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_clbp_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap2_clbp.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap2_clbp.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/RD_overlap_clbp_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 


# # Store AD cluster size in .txt file
# # CLBP - CON t > 2.5 cluster summary at visit 1
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat_clust_sum.txt
# # CLBP - CON t > 2.5 cluster summary at visit 2
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat_clust_sum.txt
# # CLBP - CON t > 2.5 cluster summary at visit 3
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat_clust_sum.txt
# # CON1 - CON2 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat_clust_sum.txt
# # CON1 - CON3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat_clust_sum.txt
# # CON2 - CON3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat_clust_sum.txt
# # CLBP1 - CLBP2 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat_clust_sum.txt
# # CLBP1 - CLBP3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat_clust_sum.txt
# # CLBP2 - CLBP3 t > 2.5 cluster summary
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat1.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat1_clust_sum.txt
# cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat2.nii.gz -t 2.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat2_clust_sum.txt
# awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat1_clust_sum.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat2_clust_sum.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat_clust_sum.txt
# Overlap between visits
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap1.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap1.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap2.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap2.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz 
awk 'NR==FNR || FNR>1' /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_vox_tstat1.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_vox_tstat2.txt > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_vox_tstat_clust_sum.txt

fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap1_con.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap1_con.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_con_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap1_con.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap2_con.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap2_con.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_con_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap2_con.nii.gz

fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat1.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap1_clbp.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap1_clbp.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_clbp_vox_tstat1.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap1_clbp.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD_tstat2.nii.gz -thr 2.5 -bin /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz
fslmaths /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz -mul /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap2_clbp.nii.gz
cluster -i /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap2_clbp.nii.gz -t 0.5 > /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap_clbp_vox_tstat2.txt
rm /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp1.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp2.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/temp3.nii.gz /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/AD_overlap2_clbp.nii.gz
