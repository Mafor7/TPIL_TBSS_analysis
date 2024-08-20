from __future__ import division

# !/usr/bin/env python
# -*- coding: utf-8
#########################################################################################
#
# Fonctions pour l'analyse du squelette TBSS
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
import subprocess
import pyreadr
from scipy import stats

def tbss_extractor1(input, visit=1):
    """
    Extracts every voxel value (FA, MD, RD or AD) from the TBSS skeleton into a DataFrame

    Parameters
    ----------
    input: str, file path for input image
    output: str, filte path for output image
    visit : int, 1,2 or 3
    contrast : int, 1 (CLBP > CON) or 2 (CLBP < CON)
    conjunction : bool, to use conjunction map image 

    Returns
    -------
    df_clbp : pandas DataFrame
        DataFrame (SxN) where each column is a subject S and every row is a voxel N.
    df_con : pandas DataFrame
        DataFrame (SxN) where each column is a subject S and every row is a voxel N.
    """
    # Load the 4D image containing FA values for all subjects
    img = nib.load(input)

    # Get the data array
    fa_data = img.get_fdata()

    # Reshape the data array to have subjects in the first dimension
    fa_data_reshaped = fa_data.reshape((-1, fa_data.shape[-1]))

    # Create a DataFrame to store FA values for each subject
    df = pd.DataFrame(fa_data_reshaped, columns=[f"Subject_{i}" for i in range(fa_data.shape[-1])])
    filtered_df = df.loc[(df != 0).any(axis=1)]

    if visit == 1:
        filtered_df.drop(columns=['Subject_6', 'Subject_16','Subject_18'], inplace=True)
        df_clbp = filtered_df.iloc[:, :23]
        df_con = filtered_df.iloc[:, 23:]
    elif visit == 2:
        filtered_df.drop(columns=['Subject_6', 'Subject_26'], inplace=True)
        df_clbp = filtered_df.iloc[:, :23]
        df_con = filtered_df.iloc[:, 23:]
    elif visit == 3:
        filtered_df.drop(columns=['Subject_25'], inplace=True)
        df_clbp = filtered_df.iloc[:, :23]
        df_con = filtered_df.iloc[:, 23:]  
    else:
        raise ValueError("Invalid visit specified. Allowed visits: 1, 2 or 3")

    return df_clbp, df_con

def tbss_extractor2(visit=1, contrast=1, conjunction=False):
    """
    Extracts every voxel value (FA, MD, RD or AD) from the TBSS skeleton into a DataFrame

    Parameters
    ----------
    visit : int, 1,2 or 3
    contrast : int, 1 (CLBP > CON) or 2 (CLBP < CON)
    conjunction : bool, to use conjunction map image 

    Returns
    -------
    df_clbp : pandas DataFrame
        DataFrame (SxN) where each column is a subject S and every row is a voxel N.
    df_con : pandas DataFrame
        DataFrame (SxN) where each column is a subject S and every row is a voxel N.
    """
    # Load the 4D image containing FA values for all subjects
    if conjunction == True:
        img = nib.load("/Volumes/PT_DATA2/Marc-Antoine/TBSS/results/clustered/v" + str(visit) + "/FA_tstat" + str(contrast) + "_v" + str(visit) + "_conjunction.nii.gz")
    else:
        img = nib.load("/Volumes/PT_DATA2/Marc-Antoine/TBSS/results/clustered/v1/FA_tstat" + str(contrast) + "_v" + str(visit) + ".nii.gz")

    # Get the data array
    fa_data = img.get_fdata()

    # Reshape the data array to have subjects in the first dimension
    fa_data_reshaped = fa_data.reshape((-1, fa_data.shape[-1]))

    # Create a DataFrame to store FA values for each subject
    df = pd.DataFrame(fa_data_reshaped, columns=[f"Subject_{i}" for i in range(fa_data.shape[-1])])
    filtered_df = df.loc[(df != 0).any(axis=1)]

    if visit == 1:
        filtered_df.drop(columns=['Subject_2', 'Subject_6', 'Subject_16','Subject_18'], inplace=True)
        df_clbp = filtered_df.iloc[:, :23]
        df_con = filtered_df.iloc[:, 23:]
        if conjunction == True:
            df_clbp.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/clbp/FA_tstat' + str(contrast) + '_v' + str(visit) + '_conjunction.csv')
            df_con.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/con/FA_tstat' + str(contrast) + '_v' + str(visit) + '_conjunction.csv')
        else:
            df_clbp.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/clbp/FA_tstat' + str(contrast) + '_v' + str(visit) + '.csv')
            df_con.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/con/FA_tstat' + str(contrast) + '_v' + str(visit) + '.csv')
    elif visit == 2:
        filtered_df.drop(columns=['Subject_5', 'Subject_25'], inplace=True)
        df_clbp = filtered_df.iloc[:, :23]
        df_con = filtered_df.iloc[:, 23:]
        if conjunction == True:
            df_clbp.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/clbp/FA_tstat' + str(contrast) + '_v' + str(visit) + '_conjunction.csv')
            df_con.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/con/FA_tstat' + str(contrast) + '_v' + str(visit) + '_conjunction.csv')
        else:
            df_clbp.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/clbp/FA_tstat' + str(contrast) + '_v' + str(visit) + '.csv')
            df_con.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/con/FA_tstat' + str(contrast) + '_v' + str(visit) + '.csv')
    elif visit == 3:
        filtered_df.drop(columns=['Subject_24'], inplace=True)
        df_clbp = filtered_df.iloc[:, :23]
        df_con = filtered_df.iloc[:, 23:]
        if conjunction == True:
            df_clbp.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/clbp/FA_tstat' + str(contrast) + '_v' + str(visit) + '_conjunction.csv')
            df_con.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/con/FA_tstat' + str(contrast) + '_v' + str(visit) + '_conjunction.csv')
        else:
            df_clbp.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/clbp/FA_tstat' + str(contrast) + '_v' + str(visit) + '.csv')
            df_con.to_csv('/Users/Marc-Antoine/Documents/tpil_network_analysis/results/results_tbss/FA/con/FA_tstat' + str(contrast) + '_v' + str(visit) + '.csv')
    else:
        raise ValueError("Invalid visit specified. Allowed visits: 1, 2 or 3")

    return df_clbp, df_con

def friedman(tbss_v1, tbss_v2, tbss_v3):
    """
    Calculates friedman test (non-parametric repeated measures ANOVA) to measure variability
    of tbss results at different time points

    Parameters
    ----------
    tbss_v1 : (S, N) pandas DataFrame
        DataFrame containing TBSS values for every subject S and every voxel N for version 1.
    tbss_v2 : (S, N) pandas DataFrame
        DataFrame containing TBSS values for every subject S and every voxel N for version 2.
    tbss_v3 : (S, N) pandas DataFrame
        DataFrame containing TBSS values for every subject S and every voxel N for version 3.

    Returns
    -------
    df_results : pandas DataFrame
        DataFrame of chi-square statistic and p-value for each ROI.
    """
    # Create an empty DataFrame to store Friedman test results for each voxel
    chi_stats = pd.DataFrame(index=tbss_v1.index, columns=['Friedman_Stat'])
    p_values = pd.DataFrame(index=tbss_v1.index, columns=['Friedman_P_Value'])

    # Iterate over each row (voxel) in the DataFrames
    for index, row in tbss_v1.iterrows():
        # Get the FA values for this voxel across all visits
        fa_values_visit1 = row.values
        fa_values_visit2 = tbss_v2.loc[index].values
        fa_values_visit3 = tbss_v3.loc[index].values
        
        # Perform the Friedman test for this voxel
        chi_stat, p_value = stats.friedmanchisquare(fa_values_visit1, fa_values_visit2, fa_values_visit3)
        
        # Store the chi-sqaure stat and p-value in the DataFrame
        p_values.at[index, 'Friedman_P_Value'] = p_value
        chi_stats.at[index, 'Friedman_Stat'] = chi_stat

    return chi_stats, p_values

def associate_friedman_statistic_with_voxels(chi_stats_df, original_img):
    """
    Associates Friedman test statistic values with corresponding voxels in the original 4D volume.

    Parameters:
        - chi_stats_df: pandas DataFrame containing the Friedman test statistics for each voxel.
        - original_img: nibabel Nifti1Image object representing the original 4D volume.

    Returns:
        - friedman_img: nibabel Nifti1Image object representing the 3D volume with Friedman test statistics.
    """
    # Get the data array from the original image
    original_data = original_img.get_fdata()

    # Create an empty array to store Friedman test statistic values
    friedman_data = np.zeros(original_data.shape[:-1])

    # Iterate over each voxel
    for index, row in chi_stats_df.iterrows():
        # Get the voxel index
        voxel_index = np.unravel_index(index, friedman_data.shape)
        
        # Get the Friedman test statistic value for this voxel
        friedman_statistic = row['Friedman_Stat']
        
        # Assign the Friedman test statistic value to the corresponding voxel
        friedman_data[voxel_index] = friedman_statistic

    # Create a new nibabel image with the Friedman test statistic values
    friedman_img = nib.Nifti1Image(friedman_data, original_img.affine)

    return friedman_img

def friedman_variability_img(input, output, input2=None, conjunction=False):
    """
    Measures the variability of every voxel in a tbss skeleton.

    Parameters:
        - input: str, must be the file with the tstat value for CON < CLBP except for the ending _v1.nii.gz. for ex: /Volumes/PT_DATA2/Marc-Antoine/TBSS/results/clustered/v1/FA_tstat1
        - output: str, must be file location. for ex: /Users/Marc-Antoine/Documents/tpil_tbss_analysis/results_tbss/FA/FA_tstat1
        - input2: str or None, optional, must be the file with the tstat value for CON > CLBP except for the ending _v1.nii.gz. for ex: /Volumes/PT_DATA2/Marc-Antoine/TBSS/results/clustered/v1/FA_tstat2
        - conjunction : bool, to use conjunction map image 

    Returns:
        - friedman_img: nibabel Nifti1Image object representing the 3D volume with Friedman test statistics.
    """
    # Helper function to load data
    def load_data(input, conjunction, suffix):
        if conjunction:
            return tbss_extractor1(f"{input}_v1{suffix}", visit=1), \
                   tbss_extractor1(f"{input}_v2{suffix}", visit=2), \
                   tbss_extractor1(f"{input}_v3{suffix}", visit=3)
        else:
            return tbss_extractor1(f"{input}_v1{suffix}", visit=1), \
                   tbss_extractor1(f"{input}_v2{suffix}", visit=2), \
                   tbss_extractor1(f"{input}_v3{suffix}", visit=3)

    # Load data for input
    (fa_values1_v1_clbp, fa_values1_v1_con), (fa_values1_v2_clbp, fa_values1_v2_con), (fa_values1_v3_clbp, fa_values1_v3_con) = load_data(input, conjunction, ".nii.gz")

    # Initialize combined DataFrames with input data
    fa_values_v1_clbp = fa_values1_v1_clbp.copy()
    fa_values_v2_clbp = fa_values1_v2_clbp.copy()
    fa_values_v3_clbp = fa_values1_v3_clbp.copy()
    fa_values_v1_con = fa_values1_v1_con.copy()
    fa_values_v2_con = fa_values1_v2_con.copy()
    fa_values_v3_con = fa_values1_v3_con.copy()
    
    # Load and combine data for input2 if provided
    if input2:
        (fa_values2_v1_clbp, fa_values2_v1_con), (fa_values2_v2_clbp, fa_values2_v2_con), (fa_values2_v3_clbp, fa_values2_v3_con) = load_data(input2, conjunction, ".nii.gz")
        fa_values_v1_clbp = pd.concat([fa_values_v1_clbp, fa_values2_v1_clbp])
        fa_values_v2_clbp = pd.concat([fa_values_v2_clbp, fa_values2_v2_clbp])
        fa_values_v3_clbp = pd.concat([fa_values_v3_clbp, fa_values2_v3_clbp])
        fa_values_v1_con = pd.concat([fa_values_v1_con, fa_values2_v1_con])
        fa_values_v2_con = pd.concat([fa_values_v2_con, fa_values2_v2_con])
        fa_values_v3_con = pd.concat([fa_values_v3_con, fa_values2_v3_con])

    # Run Friedman test
    friedman_test_clbp, _ = friedman(fa_values_v1_clbp, fa_values_v2_clbp, fa_values_v3_clbp)
    friedman_test_con, _ = friedman(fa_values_v1_con, fa_values_v2_con, fa_values_v3_con)
    friedman_test_clbp.to_csv(f"{output}_friedman_clbp.csv")
    friedman_test_con.to_csv(f"{output}_friedman_con.csv")
    
    # Load original image
    original_img = nib.load("/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/stats/all_FA_skeletonised.nii.gz")
    friedman_img_clbp = associate_friedman_statistic_with_voxels(friedman_test_clbp, original_img)
    friedman_img_con = associate_friedman_statistic_with_voxels(friedman_test_con, original_img)

    if conjunction:
        nib.save(friedman_img_clbp, f"{output}_friedman_clbp.nii.gz")
        nib.save(friedman_img_con, f"{output}_friedman_con.nii.gz")
    else:
        nib.save(friedman_img_clbp, f"{output}_friedman_clbp.nii.gz")
        nib.save(friedman_img_con, f"{output}_friedman_con.nii.gz")


def separate_multiclass_mask(input_mask_path, output_prefix):
    """
    Measures the variaility of every voxel in a tbss skeleton

    Parameters:
        - input_mask_path: nibabel Nifti1Image object representing a multiclass map
        - output_prefix: string, output prefix of the resulting file

    Returns:
        - binary_mask_img: nibabel Nifti1Image object representing a binary 3D map
    """
    # Load the multiclass mask
    multiclass_mask = nib.load(input_mask_path)
    mask_data = multiclass_mask.get_fdata()

    # Get unique values in the mask
    unique_values = np.unique(mask_data)

    # Iterate over unique values and create binary masks
    for value in unique_values:
        # Skip background value (typically 0)
        if value == 0:
            continue

        # Create binary mask for the current value
        binary_mask = np.where(mask_data == value, 1, 0)

        # Save the binary mask
        binary_mask_img = nib.Nifti1Image(binary_mask, affine=multiclass_mask.affine)
        output_path = f"{output_prefix}/crossing_fibers_binary_mask_{int(value)}.nii.gz"
        nib.save(binary_mask_img, output_path)

def call_bash_script(script_path):
    """
    Execute bash script in a python file.

    Parameters:
        - script_path: str, bash script file path
    """
    try:
        # Run the Bash script
        subprocess.run(["bash", script_path], check=True)
        print("Bash script executed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error executing Bash script: {e}")


