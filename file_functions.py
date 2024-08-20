from __future__ import division

# !/usr/bin/env python
# -*- coding: utf-8
#########################################################################################
#
# script pour formattge des fichiers DTI pour analyse TBSS
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

import os
import shutil

def extract_files_from_folder(folder_path, clbp_subjects, control_subjects, metric='md'):
    base_destination_folder = '/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/data'  # Replace this with the actual base path to your destination folder

    # Create the clbp and control subfolders if they don't exist
    clbp_folder = os.path.join(base_destination_folder, 'clbp', metric)
    control_folder = os.path.join(base_destination_folder, 'control', metric)
    os.makedirs(clbp_folder, exist_ok=True)
    os.makedirs(control_folder, exist_ok=True)

    root = folder_path
    for dir in os.listdir(folder_path):
        subject_name = dir.split('_')[0]  # Extract the subject name
        subject_path = os.path.join(root, dir, 'DTI_Metrics')
        if os.path.isdir(subject_path):
            for filename in os.listdir(subject_path):
                if filename.endswith(f'{metric}.nii.gz'):
                    source_file = os.path.join(subject_path, filename)
                    
                    # Determine the destination subfolder and prefix based on the subject name
                    if subject_name in clbp_subjects:
                        subfolder = clbp_folder
                        prefix = 'clbp'
                    elif subject_name in control_subjects:
                        subfolder = control_folder
                        prefix = 'control'
                    else:
                        continue  # Skip if the subject name is not in either list

                    # Extracting v1, v2, or v3 from the filename
                    version = None
                    if 'v1' in filename:
                        version = 'v1'
                    elif 'v2' in filename:
                        version = 'v2'
                    elif 'v3' in filename:
                        version = 'v3'

                    # Creating a subfolder based on the version if it doesn't exist
                    if version:
                        version_folder = os.path.join(subfolder, version)
                        os.makedirs(version_folder, exist_ok=True)
                        
                        # Construct the destination filename
                        destination_filename = f"{prefix}_{filename.replace(f'{metric}', 'fa')}"
                        destination_file = os.path.join(version_folder, destination_filename)
                        print(f"Copying file: {source_file} to {destination_file}")
                        shutil.copy(source_file, destination_file)

def main():

    clbp_subjects = {'sub-007', 'sub-010', 'sub-012', 'sub-013', 'sub-014', 'sub-016', 'sub-017', 'sub-019', 'sub-027', 'sub-030', 'sub-031', 'sub-032',
                      'sub-034', 'sub-035', 'sub-036', 'sub-037', 'sub-038', 'sub-039', 'sub-042', 'sub-047', 'sub-049', 'sub-050', 'sub-055', 'sub-056', 'sub-063', 'sub-064'}
    control_subjects = {'sub-002', 'sub-004', 'sub-006', 'sub-015', 'sub-021', 'sub-022', 'sub-023', 'sub-024', 'sub-025', 'sub-029', 'sub-040', 'sub-041',
                         'sub-046', 'sub-048', 'sub-051', 'sub-052', 'sub-053', 'sub-054', 'sub-057', 'sub-058', 'sub-059', 'sub-060', 'sub-061', 'sub-062', 'sub-065'}
    extract_files_from_folder('/Volumes/TPIL_data5/2024-05-02_tractoflow_results/results', clbp_subjects=clbp_subjects, control_subjects=control_subjects, metric='fa')
    extract_files_from_folder('/Volumes/TPIL_data5/2024-05-02_tractoflow_results/results', clbp_subjects=clbp_subjects, control_subjects=control_subjects, metric='md')
    extract_files_from_folder('/Volumes/TPIL_data5/2024-05-02_tractoflow_results/results', clbp_subjects=clbp_subjects, control_subjects=control_subjects, metric='rd')
    extract_files_from_folder('/Volumes/TPIL_data5/2024-05-02_tractoflow_results/results', clbp_subjects=clbp_subjects, control_subjects=control_subjects, metric='ad')

if __name__ == "__main__":
    main()