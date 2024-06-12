from __future__ import division

# !/usr/bin/env python
# -*- coding: utf-8
#########################################################################################
#
# script pour l'analyse du squelette TBSS
#
# example: python connectivity_analysis.py -i <results>
# ---------------------------------------------------------------------------------------
# Authors: Marc Antoine
#
# Prerequis: environnement virtuel avec python, pandas, numpy, netneurotools, scilpy et matplotlib (env_tpil)
#
#########################################################################################


# Parser
#########################################################################################

import nibabel as nib
import numpy as np
import pandas as pd
from scipy import stats
import pyreadr
from TBSS_functions import tbss_extractor2, friedman_variability_img, separate_multiclass_mask, call_bash_script, dataframe_to_RData


def main():
    # ## Load in crossing fibers files
    # separate_multiclass_mask('/Volumes/PT_DATA2/Marc-Antoine/Crossing_pockets/dTDM_las.nii.gz', '/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/mask')

    # ## Process friedman files for analysis
    # call_bash_script("/Users/Marc-Antoine/Documents/tpil_network_analysis/TBSS_friedman_processing.sh")

    ## Create files of clustered significantly different voxel of the TBSS skeleton
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_clust1", input2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/FA_clust2", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/v1/FA_clust", conjunction=False)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_clust1", input2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/MD_clust2", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/v1/MD_clust", conjunction=False)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_clust1", input2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/RD_clust2", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/v1/RD_clust", conjunction=False)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_clust1", input2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1/AD_clust2", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/v1/AD_clust", conjunction=False)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust1", input2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust2", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/FA_clust", conjunction=True)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust1", input2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust2", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/MD_clust", conjunction=True)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust1", input2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust2", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/RD_clust", conjunction=True)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust1", input2="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust2", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/AD_clust", conjunction=True)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_FA", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_FA", conjunction=False)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_MD", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_MD", conjunction=False)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_RD", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_RD", conjunction=False)
    friedman_variability_img(input="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_AD", output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/results/whole_skeleton_AD", conjunction=False)

if __name__ == "__main__":
    main()