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
from friedman_functions import tbss_extractor1, friedman_variability_img, separate_multiclass_mask, call_bash_script

def prepare_dataframe(df, visit_number):
    # Step 1: Rename columns to a simple list of integers starting from 0
    df.columns = range(df.shape[1])

    # Step 2: Transpose the dataframe
    trans_df = df.T

    # Step 3: Add a 'subject' column with integers starting from 0
    trans_df['subject'] = range(trans_df.shape[0])

    # Step 4: Insert a 'visit' column with the specified visit_number
    trans_df.insert(0, 'visit', visit_number)

    return trans_df

def dataframe_to_RData(df_v1, df_v2, df_v3, output_path):
    """
    Transforms Dataframes v1, v2, v3 with Subject in columns and voxels in rows to a format fit for I2C2 in R

    Parameters:
        - df_v1: DataFrame for visit 1
        - df_v2: DataFrame for visit 2
        - df_v3: DataFrame for visit 3
        - output_path: string, output path of .RData file
    """
    # Prepare each dataframe
    trans_df_v1 = prepare_dataframe(df_v1, 1)
    trans_df_v2 = prepare_dataframe(df_v2, 2)
    trans_df_v3 = prepare_dataframe(df_v3, 3)
    
    # Concatenate the dataframes
    df_concat = pd.concat([trans_df_v1, trans_df_v2, trans_df_v3], ignore_index=True)

    # Sort by 'subject' and 'visit'
    df_concat = df_concat.sort_values(by=['subject', 'visit']).reset_index(drop=True)

    print(df_concat) 
    df_concat = df_concat.drop(columns=['subject'])
    df_concat = df_concat.drop(columns=['visit'])
    print(df_concat)
    pyreadr.write_rdata(output_path, df_concat)



def main():
   
    # ### Extract DTI values from selected cluster FA30
    # FA_30_clbp1, FA_30_con1 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30_v1.nii.gz', visit=1)
    # FA_30_clbp2, FA_30_con2 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30_v2.nii.gz', visit=2)
    # FA_30_clbp3, FA_30_con3 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID30_v3.nii.gz', visit=3)
    # output_clbp_FA30 = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/FA30_clbp.RData"
    # output_con_FA30 = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/FA30_con.RData"
    

    # dataframe_to_RData(FA_30_clbp1, FA_30_clbp2, FA_30_clbp3, output_clbp_FA30)
    # dataframe_to_RData(FA_30_con1, FA_30_con2, FA_30_con3, output_con_FA30)

    # ## Extract DTI values from selected cluster FA31
    # FA_31_clbp1, FA_31_con1 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31_v1.nii.gz', visit=1)
    # FA_31_clbp2, FA_31_con2 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31_v2.nii.gz', visit=2)
    # FA_31_clbp3, FA_31_con3 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID31_v3.nii.gz', visit=3)
    # output_clbp_FA31 = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/FA31_clbp.RData"
    # output_con_FA31 = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/FA31_con.RData"
    

    # dataframe_to_RData(FA_31_clbp1, FA_31_clbp2, FA_31_clbp3, output_clbp_FA31)
    # dataframe_to_RData(FA_31_con1, FA_31_con2, FA_31_con3, output_con_FA31)

    # ## Extract DTI values from selected cluster FA34
    # FA_34_clbp1, FA_34_con1 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34_v1.nii.gz', visit=1)
    # FA_34_clbp2, FA_34_con2 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34_v2.nii.gz', visit=2)
    # FA_34_clbp3, FA_34_con3 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID34_v3.nii.gz', visit=3)
    # output_clbp_FA34 = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/FA34_clbp.RData"
    # output_con_FA34 = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/FA34_con.RData"
    

    # dataframe_to_RData(FA_34_clbp1, FA_34_clbp2, FA_34_clbp3, output_clbp_FA34)
    # dataframe_to_RData(FA_34_con1, FA_34_con2, FA_34_con3, output_con_FA34)

    # ## Extract DTI values from selected cluster FA35
    # FA_35_clbp1, FA_35_con1 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35_v1.nii.gz', visit=1)
    # FA_35_clbp2, FA_35_con2 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35_v2.nii.gz', visit=2)
    # FA_35_clbp3, FA_35_con3 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/FA_ID35_v3.nii.gz', visit=3)
    # output_clbp_FA35 = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/FA35_clbp.RData"
    # output_con_FA35 = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/FA35_con.RData"
    

    # dataframe_to_RData(FA_35_clbp1, FA_35_clbp2, FA_35_clbp3, output_clbp_FA35)
    # dataframe_to_RData(FA_35_con1, FA_35_con2, FA_35_con3, output_con_FA35)

    ## Extract DTI values from selected cluster AD
    AD_clbp1, AD_con1 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13_v1.nii.gz', visit=1)
    AD_clbp2, AD_con2 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13_v2.nii.gz', visit=2)
    AD_clbp3, AD_con3 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/AD_ID13_v3.nii.gz', visit=3)
    output_clbp_AD = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/AD13_clbp.RData"
    output_con_AD = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/AD13_con.RData"
    

    dataframe_to_RData(AD_clbp1, AD_clbp2, AD_clbp3, output_clbp_AD)
    dataframe_to_RData(AD_con1, AD_con2, AD_con3, output_con_AD)
    
    ## Extract DTI values from selected cluster RD
    RD_clbp1, RD_con1 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13_v1.nii.gz', visit=1)
    RD_clbp2, RD_con2 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13_v2.nii.gz', visit=2)
    RD_clbp3, RD_con3 = tbss_extractor1('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13_v3.nii.gz', visit=3)
    output_clbp_RD = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/RD13_clbp.RData"
    output_con_RD = "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/R_analysis/RD13_con.RData"
    

    dataframe_to_RData(RD_clbp1, RD_clbp2, RD_clbp3, output_clbp_RD)
    dataframe_to_RData(RD_con1, RD_con2, RD_con3, output_con_RD)
    

if __name__ == "__main__":
    main()