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
from TPIL_TBSS_24072024.friedman_functions import tbss_extractor2, friedman_variability_img, separate_multiclass_mask, call_bash_script


def main():

    friedman_variability_img(input="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/FA_overlap1", input2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/FA_overlap2", output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/FA_overlap", conjunction=True)
    friedman_variability_img(input="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/MD_overlap1", input2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/MD_overlap2", output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/MD_overlap", conjunction=True)
    friedman_variability_img(input="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/RD_overlap1", input2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/RD_overlap2", output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/RD_overlap", conjunction=True)
    friedman_variability_img(input="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/AD_overlap1", input2="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/AD_overlap2", output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/AD_overlap", conjunction=True)
    friedman_variability_img(input="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_FA", output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_FA", conjunction=False)
    friedman_variability_img(input="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_MD", output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_MD", conjunction=False)
    friedman_variability_img(input="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_RD", output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_RD", conjunction=False)
    friedman_variability_img(input="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/whole_skeleton_AD", output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/friedman/results/whole_skeleton_AD", conjunction=False)

if __name__ == "__main__":
    main()