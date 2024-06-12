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
from TBSS_functions import tbss_extractor1, friedman_variability_img, separate_multiclass_mask, call_bash_script, dataframe_to_RData

def main():
    # ## extract AD values for the whole TBSS skeleton
    # filename1_clbp, filename1_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_AD_v1.nii.gz', visit=1)
    # filename2_clbp, filename2_con= tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_AD_v2.nii.gz', visit=2)
    # filename3_clbp, filename3_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_AD_v3.nii.gz', visit=3)
    # output_clbp = "/Users/Marc-Antoine/Documents/R_analysis/whole_skeleton_AD_clbp.RData"
    # output_con = "/Users/Marc-Antoine/Documents/R_analysis/whole_skeleton_AD_con.RData"
    
    # dataframe_to_RData(filename1_clbp, filename2_clbp, filename3_clbp, output_clbp)
    # dataframe_to_RData(filename1_con, filename2_con, filename3_con, output_con)

    # ## extract FA values for the whole TBSS skeleton
    # filename1_clbp, filename1_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_FA_v1.nii.gz', visit=1)
    # filename2_clbp, filename2_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_FA_v2.nii.gz', visit=2)
    # filename3_clbp, filename3_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_FA_v3.nii.gz', visit=3)
    # output_clbp = "/Users/Marc-Antoine/Documents/R_analysis/whole_skeleton_FA_clbp.RData"
    # output_con= "/Users/Marc-Antoine/Documents/R_analysis/whole_skeleton_FA_con.RData"

    # dataframe_to_RData(filename1_clbp, filename2_clbp, filename3_clbp, output_clbp)
    # dataframe_to_RData(filename1_con, filename2_con, filename3_con, output_con)

    # ## extract RD values for the whole TBSS skeleton
    # filename1_clbp, filename1_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_RD_v1.nii.gz', visit=1)
    # filename2_clbp,filename2_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_RD_v2.nii.gz', visit=2)
    # filename3_clbp, filename3_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_RD_v3.nii.gz', visit=3)
    # output_clbp = "/Users/Marc-Antoine/Documents/R_analysis/whole_skeleton_RD_clbp.RData"
    # output_con = "/Users/Marc-Antoine/Documents/R_analysis/whole_skeleton_RD_con.RData"
    
    # dataframe_to_RData(filename1_clbp, filename2_clbp, filename3_clbp, output_clbp)
    # dataframe_to_RData(filename1_con, filename2_con, filename3_con, output_con)

    # ## extract MD values for the whole TBSS skeleton
    # filename1_clbp, filename1_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_MD_v1.nii.gz', visit=1)
    # filename2_clbp, filename2_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_MD_v2.nii.gz', visit=2)
    # filename3_clbp, filename3_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/whole_skeleton_MD_v3.nii.gz', visit=3)
    # output_clbp = "/Users/Marc-Antoine/Documents/R_analysis/whole_skeleton_MD_clbp.RData"
    # output_con = "/Users/Marc-Antoine/Documents/R_analysis/whole_skeleton_MD_con.RData"
    
    # dataframe_to_RData(filename1_clbp, filename2_clbp, filename3_clbp, output_clbp)
    # dataframe_to_RData(filename1_con, filename2_con, filename3_con, output_con)

    ## extract AD values for conjunction clusters
    filename11_clbp, filename11_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust1_v1_conjunction.nii.gz', visit=1)
    filename12_clbp, filename12_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust2_v1_conjunction.nii.gz', visit=1)
    filename21_clbp, filename21_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust1_v2_conjunction.nii.gz', visit=2)
    filename22_clbp, filename22_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust2_v2_conjunction.nii.gz', visit=2)
    filename31_clbp, filename31_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust1_v3_conjunction.nii.gz', visit=3)
    filename32_clbp, filename32_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/AD_clust2_v3_conjunction.nii.gz', visit=3)
    filename1_clbp = pd.concat([filename11_clbp, filename12_clbp])
    filename2_clbp = pd.concat([filename21_clbp, filename22_clbp])
    filename3_clbp = pd.concat([filename31_clbp, filename32_clbp])
    filename1_con = pd.concat([filename11_con, filename12_con])
    filename2_con = pd.concat([filename21_con, filename22_con])
    filename3_con = pd.concat([filename31_con, filename32_con])
    output_clbp = "/Users/Marc-Antoine/Documents/R_analysis/conjunction_cluster_AD_clbp.RData"
    output_con = "/Users/Marc-Antoine/Documents/R_analysis/conjunction_cluster_AD_con.RData"

    dataframe_to_RData(filename1_clbp, filename2_clbp, filename3_clbp, output_clbp)
    dataframe_to_RData(filename1_con, filename2_con, filename3_con, output_con)

    # ## extract FA values for conjunction clusters
    # filename11_clbp, filename11_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust1_v1_conjunction.nii.gz', visit=1)
    # filename12_clbp, filename12_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust2_v1_conjunction.nii.gz', visit=1)
    # filename21_clbp, filename21_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust1_v2_conjunction.nii.gz', visit=2)
    # filename22_clbp, filename22_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust2_v2_conjunction.nii.gz', visit=2)
    # filename31_clbp, filename31_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust1_v3_conjunction.nii.gz', visit=3)
    # filename32_clbp, filename32_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/FA_clust2_v3_conjunction.nii.gz', visit=3)
    # filename1_clbp = pd.concat([filename11_clbp, filename12_clbp])
    # filename2_clbp = pd.concat([filename21_clbp, filename22_clbp])
    # filename3_clbp = pd.concat([filename31_clbp, filename32_clbp])
    # filename1_con = pd.concat([filename11_con, filename12_con])
    # filename2_con = pd.concat([filename21_con, filename22_con])
    # filename3_con = pd.concat([filename31_con, filename32_con])
    # output_clbp = "/Users/Marc-Antoine/Documents/R_analysis/conjunction_cluster_FA_clbp.RData"
    # output_con = "/Users/Marc-Antoine/Documents/R_analysis/conjunction_cluster_FA_con.RData"

    # dataframe_to_RData(filename1_clbp, filename2_clbp, filename3_clbp, output_clbp)
    # dataframe_to_RData(filename1_con, filename2_con, filename3_con, output_con)

    # ## extract MD values for conjunction clusters
    # filename11_clbp, filename11_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust1_v1_conjunction.nii.gz', visit=1)
    # filename12_clbp, filename12_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust2_v1_conjunction.nii.gz', visit=1)
    # filename21_clbp, filename21_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust1_v2_conjunction.nii.gz', visit=2)
    # filename22_clbp, filename22_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust2_v2_conjunction.nii.gz', visit=2)
    # filename31_clbp, filename31_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust1_v3_conjunction.nii.gz', visit=3)
    # filename32_clbp, filename32_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/MD_clust2_v3_conjunction.nii.gz', visit=3)
    # filename1_clbp = pd.concat([filename11_clbp, filename12_clbp])
    # filename2_clbp = pd.concat([filename21_clbp, filename22_clbp])
    # filename3_clbp = pd.concat([filename31_clbp, filename32_clbp])
    # filename1_con = pd.concat([filename11_con, filename12_con])
    # filename2_con = pd.concat([filename21_con, filename22_con])
    # filename3_con = pd.concat([filename31_con, filename32_con])
    # output_clbp = "/Users/Marc-Antoine/Documents/R_analysis/conjunction_cluster_MD_clbp.RData"
    # output_con = "/Users/Marc-Antoine/Documents/R_analysis/conjunction_cluster_MD_con.RData"

    # dataframe_to_RData(filename1_clbp, filename2_clbp, filename3_clbp, output_clbp)
    # dataframe_to_RData(filename1_con, filename2_con, filename3_con, output_con)

    # ## extract RD values for conjunction clusters
    # filename11_clbp, filename11_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust1_v1_conjunction.nii.gz', visit=1)
    # filename12_clbp, filename12_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust2_v1_conjunction.nii.gz', visit=1)
    # filename21_clbp, filename21_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust1_v2_conjunction.nii.gz', visit=2)
    # filename22_clbp, filename22_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust2_v2_conjunction.nii.gz', visit=2)
    # filename31_clbp, filename31_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust1_v3_conjunction.nii.gz', visit=3)
    # filename32_clbp, filename32_con = tbss_extractor1('/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/RD_clust2_v3_conjunction.nii.gz', visit=3)
    # filename1_clbp = pd.concat([filename11_clbp, filename12_clbp])
    # filename2_clbp = pd.concat([filename21_clbp, filename22_clbp])
    # filename3_clbp = pd.concat([filename31_clbp, filename32_clbp])
    # filename1_con = pd.concat([filename11_con, filename12_con])
    # filename2_con = pd.concat([filename21_con, filename22_con])
    # filename3_con = pd.concat([filename31_con, filename32_con])
    # output_clbp = "/Users/Marc-Antoine/Documents/R_analysis/conjunction_cluster_RD_clbp.RData"
    # output_con = "/Users/Marc-Antoine/Documents/R_analysis/conjunction_cluster_RD_con.RData"

    # dataframe_to_RData(filename1_clbp, filename2_clbp, filename3_clbp, output_clbp)
    # dataframe_to_RData(filename1_con, filename2_con, filename3_con, output_con)

if __name__ == "__main__":
    main()