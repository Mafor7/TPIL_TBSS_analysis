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

import os

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

# Example usage:
folder_path = "/Volumes/PT_DATA2/Marc-Antoine/myTBSS/friedman/v1"
old_string = "tstat"
new_string = "clust"

rename_files(folder_path=folder_path, old_string=old_string, new_string=new_string)
