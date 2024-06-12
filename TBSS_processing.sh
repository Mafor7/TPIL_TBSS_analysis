#!/bin/bash

### TBSS processing documentation. See full documentation at https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/TBSS/UserGuide. TBSS is designed to process FA data. 
### Simply copy the FA images into a new folder for TBSS analysis.

### select directory with TBSS files
### Ex: cd /mnt/d/Marc-Antoine/TBSS/v1
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1

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
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.mat
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.con

cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats

randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.con -n 500 --T2

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
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.con -n 500 --T2

### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.con -n 500 --T2

### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v1/design.con -n 500 --T2

########################################################################

### Proceed with same methodology for visit 2 
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.mat
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.con
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.con -n 500 --T2
### Process MD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.con -n 500 --T2
### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.con -n 500 --T2
### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v2/design.con -n 500 --T2

### Proceed with same methodology for visit 3 
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.mat
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.con
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.con -n 500 --T2
### Process MD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.con -n 500 --T2
### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.con -n 500 --T2
### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/v3/design.con -n 500 --T2

########################################################################

### The next section runs TBSS on the control group between visits of the same group 

### Proceed with same methodology for control subjects between visit 1 and 2
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process MD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v2/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2

### Proceed with same methodology for control subjects between visit 1 and 3
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process MD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v1v3/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2

### Proceed with same methodology for control subjects between visit 2 and 3
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process MD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2
### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/v2v3/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/control/design.con -n 500 --T2

### Proceed with same methodology for clbp subjects between visit 1 and 2
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat
Text2Vest /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/contrast.txt /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process MD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v2/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2

### Proceed with same methodology for clbp subjects between visit 1 and 3
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process MD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v1v3/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2

### Proceed with same methodology for clbp subjects between visit 2 and 3
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3
tbss_1_preproc *.nii.gz
tbss_2_reg -T
tbss_3_postreg -S
tbss_4_prestats 0.2
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/stats
randomise -i all_FA_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/FA -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process MD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3
tbss_non_FA MD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/stats
randomise -i all_MD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/MD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process RD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3
tbss_non_FA RD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/stats
randomise -i all_RD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/RD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
### Process AD data
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3
tbss_non_FA AD
cd /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/stats
randomise -i all_AD_skeletonised.nii.gz -o /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/v2v3/AD -m mean_FA_skeleton_mask.nii.gz -d /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.mat -t /Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/clbp/design.con -n 500 --T2
