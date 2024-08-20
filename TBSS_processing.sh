#!/bin/bash

### TBSS processing documentation. See full documentation at https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/TBSS/UserGuide. TBSS is designed to process FA data. 
### Simply copy the FA images into a new folder for TBSS analysis.

### select directory with TBSS files for clbp vs conT
### Ex: cd /mnt/d/Marc-Antoine/TBSS/v1
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1

### This step preprocesses the FA images and stores them into a new directory FA
tbss_1_preproc *.nii.gz

### This step runs nonlinear registration of all FA images into a 1x1x1mm standard space. Use the -T flag to use the FMRIB58_FA
### standard-space image as the target in TBSS. This involves carrying out just one registration per subject and generally gives good alignment results. 
tbss_2_reg -T

### The next step applies the nonlinear transforms found in the previous stage to all subjects to bring them into standard space. next these are all 
### merged into a single 4D image file called all_FA, created in a new subdirectory called stats. Next, the mean of all FA images is created, called mean_FA, 
### and this is then fed into the FA skeletonisation program to create mean_FA_skeleton. The -S flag uses the MNI152 space as standard space
tbss_3_postreg -S

### This step thresholds the mean skeleton image to 0.2. It then creates a 4D image file containing the (projected) skeletonised FA data. It is this file 
### that you will feed into voxelwise statistics in the next section (all_FA_skeletonised.nii.gz).
tbss_4_prestats 0.2

### The next section details how to run voxelwise statistic on the skeletonised FA data. It will give you the FA differences between CON and CLBP.
########################################################################

# Create design matrix: design.txt
# Check order with cd FA; imglob *_FA.*
# Ex: 7 patients, 8 controls
# 1 0
# 1 0
# 1 0
# 1 0
# 1 0
# 1 0
# 1 0
# 0 1
# 0 1
# 0 1
# 0 1
# 0 1
# 0 1
# 0 1
# 0 1

# Create design contrast: contrast.txt
# Ex: if Group A = CLBP and Group B = CON
# 1 -1      # C1 A > B
# -1 1      # C2 B > A
# 1 0      # Mean A
# 0 1      # Mean B
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.con

cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats

randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.con -n 500 --T2

# Where:
# -i : input skeletonized FA data for all subjects (4D NIFTI format)
# -o : Output directory where results will be saved
# -d : Design matrix
# -t : Contrast file
# -n : Number of permutations
# --T2 : Threshold-Free Cluster Enhancement option

### tbss_tstat1 = CLBP > CON
### tbss_tstat2 = CON > CLBP

########################################################################

### The next section shows how to runs TBSS on Non-FA images. Apply the original nonlinear registration to the L2 data, merge all subjects' warped L2 data into a 4D file stats/all_L2, project this onto the original mean FA skeleton 
### (using the original FA data to find the projection vectors), resulting in the 4D projected data stats/all_L2_skeletonised

### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/design.con -n 500 --T2

### Proceed with same methodology for visit 2 
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.con
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats
randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.con -n 500 --T2
### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/design.con -n 500 --T2

### Proceed with same methodology for visit 3 
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.con
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.con -n 500 --T2
### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/design.con -n 500 --T2

########################################################################
### select directory with TBSS files for clbp vs conD

### Proceed with same methodology for visit 1 
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.con
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/stats
randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.con -n 500 --T2
### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v1/design.con -n 500 --T2

### Proceed with same methodology for visit 2 
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.con
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/stats
randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.con -n 500 --T2
### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v2/design.con -n 500 --T2

### Proceed with same methodology for visit 3 
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.con
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.con -n 500 --T2
### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conD/v3/design.con -n 500 --T2

########################################################################
### select directory with TBSS files for conT vs conD

### Proceed with same methodology for visit 1 
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.con
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/stats
randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.con -n 500 --T2
### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v1/design.con -n 500 --T2

### Proceed with same methodology for visit 2 
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.con
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/stats
randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.con -n 500 --T2
### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v2/design.con -n 500 --T2

### Proceed with same methodology for visit 3 
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.mat
Text2Vest /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/contrast.txt /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.con
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.con -n 500 --T2
### Process MD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3
tbss_non_FA md
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/md -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.con -n 500 --T2

### Process RD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3
tbss_non_FA rd
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/rd -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.con -n 500 --T2

### Process AD data
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3
tbss_non_FA ad
cd /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/ad -m mean_FA_skeleton_mask.nii.gz -d /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.mat -t /Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/conT_conD/v3/design.con -n 500 --T2



