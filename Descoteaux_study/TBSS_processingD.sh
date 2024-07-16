#!/bin/bash

### TBSS processing documentation. See full documentation at https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/TBSS/UserGuide. TBSS is designed to process FA data. 
### Simply copy the FA images into a new folder for TBSS analysis.

# ### Extract files and rename them according to TBSS nomenclature
# python3 - <<END
# import os
# import sys
# sys.path.append('/Users/Marc-Antoine/repositories/TPIL_TBSS_analysis')
# from export_files import extract_files_from_folder_descoteaux, rename_files

# extract_files_from_folder_descoteaux('/Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results', metric='fa')
# folder_path1 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/fa/v1"
# delete_string1 = "_ses-1_"
# add_string1 = "v1"
# folder_path3 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/fa/v3"
# delete_string3 = "_ses-3_"
# add_string3 = "v3"
# folder_path5 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/fa/v5"
# delete_string5 = "_ses-5_"
# add_string5 = "v5"
# rename_files(folder_path=folder_path1, delete_string=delete_string1, add_string=add_string1)
# rename_files(folder_path=folder_path3, delete_string=delete_string3, add_string=add_string3)
# rename_files(folder_path=folder_path5, delete_string=delete_string5, add_string=add_string5)

# extract_files_from_folder_descoteaux('/Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results', metric='md')
# folder_path1 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/md/v1"
# delete_string1 = "_ses-1_"
# add_string1 = "v1"
# folder_path3 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/md/v3"
# delete_string3 = "_ses-3_"
# add_string3 = "v3"
# folder_path5 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/md/v5"
# delete_string5 = "_ses-5_"
# add_string5 = "v5"
# rename_files(folder_path=folder_path1, delete_string=delete_string1, add_string=add_string1)
# rename_files(folder_path=folder_path3, delete_string=delete_string3, add_string=add_string3)
# rename_files(folder_path=folder_path5, delete_string=delete_string5, add_string=add_string5)

# extract_files_from_folder_descoteaux('/Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results', metric='rd')
# folder_path1 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/rd/v1"
# delete_string1 = "_ses-1_"
# add_string1 = "v1"
# folder_path3 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/rd/v3"
# delete_string3 = "_ses-3_"
# add_string3 = "v3"
# folder_path5 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/rd/v5"
# delete_string5 = "_ses-5_"
# add_string5 = "v5"
# rename_files(folder_path=folder_path1, delete_string=delete_string1, add_string=add_string1)
# rename_files(folder_path=folder_path3, delete_string=delete_string3, add_string=add_string3)
# rename_files(folder_path=folder_path5, delete_string=delete_string5, add_string=add_string5)

# extract_files_from_folder_descoteaux('/Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results', metric='ad')
# folder_path1 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/ad/v1"
# delete_string1 = "_ses-1_"
# add_string1 = "v1"
# folder_path3 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/ad/v3"
# delete_string3 = "_ses-3_"
# add_string3 = "v3"
# folder_path5 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/ad/v5"
# delete_string5 = "_ses-5_"
# add_string5 = "v5"
# rename_files(folder_path=folder_path1, delete_string=delete_string1, add_string=add_string1)
# rename_files(folder_path=folder_path3, delete_string=delete_string3, add_string=add_string3)
# rename_files(folder_path=folder_path5, delete_string=delete_string5, add_string=add_string5)

# ### file de départ example:  /Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results/sub-003_ses-5/DTI_Metrics/sub-003_ses-5__fa.nii.gz
# ### File must be changed to this so that TBSS can run with my scripts:  /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/fa/v1/v1_sub-003_fa.nii.gz
# ### Do not forget to join data from different visits into a same folder depending on desired analysis. Also create a .txt file of contrast and design matrix.

# END

### Process FA
# ### Proceed with TBSS pipeline for subject between visit 1 and 3
# cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3
# tbss_1_preproc *.nii.gz
# tbss_2_reg -T
# tbss_3_postreg -S
# tbss_4_prestats 0.2
# Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.mat
# Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.con
# cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/stats
# randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.con -n 500 --T2
# ### Proceed with TBSS pipeline for subject between visit 1 and 5
# cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5
# tbss_1_preproc *.nii.gz
# tbss_2_reg -T
# tbss_3_postreg -S
# tbss_4_prestats 0.2
# Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.mat
# Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.con
# cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/stats
# randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.con -n 500 --T2
# ### Proceed with TBSS pipeline for subject between visit 3 and 5
# cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5
# tbss_1_preproc *.nii.gz
# tbss_2_reg -T
# tbss_3_postreg -S
# tbss_4_prestats 0.2
# Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.mat
# Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.con
# cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/stats
# randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.con -n 500 --T2
## Proceed with TBSS pipeline for our control subjects and D subjects for visit 1 
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.mat
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.con
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.con -n 500 --T2
## Proceed with TBSS pipeline for our control subjects and D subjects for visit 2 
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.mat
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.con
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.con -n 500 --T2
## Proceed with TBSS pipeline for our control subjects and D subjects for visit 3 
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.mat
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.con
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.con -n 500 --T2




### Process MD data
### Proceed with TBSS pipeline for subject between visit 1 and 3
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.con -n 500 --T2
### Proceed with TBSS pipeline for subject between visit 1 and 5
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.con -n 500 --T2
### Proceed with TBSS pipeline for subject between visit 3 and 5
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 1
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 2
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 3
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.con -n 500 --T2


### Process RD data
### Proceed with TBSS pipeline for subject between visit 1 and 3
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.con -n 500 --T2
### Proceed with TBSS pipeline for subject between visit 1 and 5
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.con -n 500 --T2
### Proceed with TBSS pipeline for subject between visit 3 and 5
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 1
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 2
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 3
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.con -n 500 --T2

### Process AD data
### Proceed with TBSS pipeline for subject between visit 1 and 3
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v3/design.con -n 500 --T2
### Proceed with TBSS pipeline for subject between visit 1 and 5
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1v5/design.con -n 500 --T2
### Proceed with TBSS pipeline for subject between visit 3 and 5
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3v5/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 1
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 2
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/design.con -n 500 --T2
### Proceed with TBSS pipeline for our control subjects and D subjects for visit 3
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/design.con -n 500 --T2