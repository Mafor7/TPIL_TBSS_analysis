#!/bin/bash

### TBSS processing documentation. See full documentation at https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/TBSS/UserGuide. TBSS is designed to process FA data. 
### Simply copy the FA images into a new folder for TBSS analysis.

### Extract files and rename them according to TBSS nomenclature
python3 - <<END
import os
import sys
sys.path.append('/Users/Marc-Antoine/repositories/TPIL_TBSS_analysis')
from export_files import extract_files_from_folder_descoteaux, rename_files

extract_files_from_folder_descoteaux('/Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results', metric='fa')
folder_path1 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/fa/v1"
delete_string1 = "_ses-1_"
add_string1 = "v1"
folder_path3 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/fa/v3"
delete_string3 = "_ses-3_"
add_string3 = "v3"
folder_path5 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/fa/v5"
delete_string5 = "_ses-5_"
add_string5 = "v5"
rename_files(folder_path=folder_path1, delete_string=delete_string1, add_string=add_string1)
rename_files(folder_path=folder_path3, delete_string=delete_string3, add_string=add_string3)
rename_files(folder_path=folder_path5, delete_string=delete_string5, add_string=add_string5)

extract_files_from_folder_descoteaux('/Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results', metric='md')
folder_path1 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/md/v1"
delete_string1 = "_ses-1_"
add_string1 = "v1"
folder_path3 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/md/v3"
delete_string3 = "_ses-3_"
add_string3 = "v3"
folder_path5 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/md/v5"
delete_string5 = "_ses-5_"
add_string5 = "v5"
rename_files(folder_path=folder_path1, delete_string=delete_string1, add_string=add_string1)
rename_files(folder_path=folder_path3, delete_string=delete_string3, add_string=add_string3)
rename_files(folder_path=folder_path5, delete_string=delete_string5, add_string=add_string5)

extract_files_from_folder_descoteaux('/Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results', metric='rd')
folder_path1 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/rd/v1"
delete_string1 = "_ses-1_"
add_string1 = "v1"
folder_path3 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/rd/v3"
delete_string3 = "_ses-3_"
add_string3 = "v3"
folder_path5 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/rd/v5"
delete_string5 = "_ses-5_"
add_string5 = "v5"
rename_files(folder_path=folder_path1, delete_string=delete_string1, add_string=add_string1)
rename_files(folder_path=folder_path3, delete_string=delete_string3, add_string=add_string3)
rename_files(folder_path=folder_path5, delete_string=delete_string5, add_string=add_string5)

extract_files_from_folder_descoteaux('/Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results', metric='ad')
folder_path1 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/ad/v1"
delete_string1 = "_ses-1_"
add_string1 = "v1"
folder_path3 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/ad/v3"
delete_string3 = "_ses-3_"
add_string3 = "v3"
folder_path5 = "/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/ad/v5"
delete_string5 = "_ses-5_"
add_string5 = "v5"
rename_files(folder_path=folder_path1, delete_string=delete_string1, add_string=add_string1)
rename_files(folder_path=folder_path3, delete_string=delete_string3, add_string=add_string3)
rename_files(folder_path=folder_path5, delete_string=delete_string5, add_string=add_string5)

### file de départ example:  /Volumes/LaCie_PT/202406_myeloinferno_tractoflow_results/sub-003_ses-5/DTI_Metrics/sub-003_ses-5__fa.nii.gz
### File must be changed to this so that TBSS can run with my scripts:  /Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/fa/v1/v1_sub-003_fa.nii.gz

END