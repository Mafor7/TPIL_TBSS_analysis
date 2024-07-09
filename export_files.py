from __future__ import division

# !/usr/bin/env python
# -*- coding: utf-8
#########################################################################################
#
# script pour l'organisation de fichiers de connectivité structurelle
#
# example: python connectivity_analysis.py -i <results>
# ---------------------------------------------------------------------------------------
# Authors: Marc Antoine
#
#########################################################################################

import os
import shutil

def extract_files_from_folder(folder_path, condition='clbp', metric='md'):
   
    destination_folder = f'/Volumes/PT_DATA2/Marc-Antoine/myTBSS/{metric}'  # Replace this with the actual path to your destination folder
     # Create the destination folder if it doesn't exist
    os.makedirs(destination_folder, exist_ok=True)

    root = folder_path
    for dir in os.listdir(folder_path):
        for filename in os.listdir(os.path.join(root, dir, 'DTI_metrics')):
            if filename.endswith(f'{metric}.nii.gz'):                                
                source_file = os.path.join(root, dir, 'DTI_metrics', filename)
                
                # Replacing 'md' with 'fa' in the destination filename
                destination_filename = filename.replace(f'{metric}', 'fa')             ### Need to specify metric

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
                    version_folder = os.path.join(destination_folder, version)
                    os.makedirs(version_folder, exist_ok=True)
                    
                    destination_file = os.path.join(version_folder, f"{condition}_{destination_filename}")
                    print(f"Copying file: {source_file} to {destination_file}")
                    shutil.copy(source_file, destination_file)

def extract_files_from_folder_descoteaux(folder_path, metric='md'):
    destination_folder = f'/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/{metric}'  # Replace this with the actual path to your destination folder
    # Create the destination folder if it doesn't exist
    os.makedirs(destination_folder, exist_ok=True)

    root = folder_path
    for dir in os.listdir(folder_path):
        subfolder_path = os.path.join(root, dir)
        if os.path.isdir(subfolder_path):
            dti_metrics_path = os.path.join(subfolder_path, 'DTI_Metrics')
            if os.path.exists(dti_metrics_path):
                for filename in os.listdir(dti_metrics_path):
                    if filename.endswith(f'{metric}.nii.gz'):
                        source_file = os.path.join(dti_metrics_path, filename)

                        # Replacing 'md' with 'fa' in the destination filename
                        destination_filename = filename.replace(f'{metric}', 'fa')  # Specify the metric

                        # Extracting v1, v2, or v3 from the filename
                        version = None
                        if 'ses-1' in filename:
                            version = 'v1'
                        elif 'ses-3' in filename:
                            version = 'v3'
                        elif 'ses-5' in filename:
                            version = 'v5'
                        
                        # Creating a subfolder based on the version if it doesn't exist
                        if version:
                            version_folder = os.path.join(destination_folder, version)
                            os.makedirs(version_folder, exist_ok=True)
                            
                            destination_file = os.path.join(version_folder, destination_filename)
                            print(f"Copying file: {source_file} to {destination_file}")
                            shutil.copy(source_file, destination_file)


def rename_files(folder_path, delete_string=None, old_string=None, new_string=None, add_string=None):
    """
    Rename files within the specified folder by deleting a string, replacing an old string with a new one,
    and adding a string to the beginning of the file names.

    Args:
        folder_path (str): The path to the folder containing the files.
        delete_string (str): The string to delete from the file names.
        old_string (str): The string to be replaced.
        new_string (str): The string to replace old_string.
        add_string (str): The string to add to the beginning of the file names.
    """
    # Get a list of files in the folder
    files = os.listdir(folder_path)

    # Iterate through each file
    for file_name in files:
        # Make a copy of the original filename
        new_file_name = file_name
        # Perform deletion if delete_string is provided
        if delete_string:
            new_file_name = new_file_name.replace(delete_string, '')
        else:
            print(f"'{delete_string}' not found in '{file_name}'")
        # Perform replacement if old_string and new_string are provided
        if old_string and new_string:
            new_file_name = new_file_name.replace(old_string, new_string)
        # Add the new string to the beginning of the file name
        if add_string:
            new_file_name = f"{add_string}_{new_file_name}"
        # Construct the old and new paths
        old_path = os.path.join(folder_path, file_name)
        new_path = os.path.join(folder_path, new_file_name)
        # Rename the file
        os.rename(old_path, new_path)
        print(f"Renamed {file_name} to {new_file_name}")
