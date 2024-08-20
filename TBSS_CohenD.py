import nibabel as nib
import numpy as np
import os
import matplotlib.pyplot as plt

def cohort_separator(file_path, output_file_path, subjects=20):
    # Load the 4D image
    img = nib.load(file_path)
    data = img.get_fdata()

    # Separate the first n volumes and the rest
    first_volumes = data[..., :subjects]
    rest_volumes = data[..., subjects:]

    # Flatten the volumes to get all voxel values
    first_voxel_values = first_volumes.flatten()
    rest_voxel_values = rest_volumes.flatten()

    # Remove zero values
    non_zero_first = first_voxel_values[first_voxel_values != 0]
    non_zero_rest = rest_voxel_values[rest_voxel_values != 0]

    # Create output directory if it doesn't exist
    os.makedirs(output_file_path, exist_ok=True)

    # Save non-zero voxel values to .txt files
    non_zero_first_path = os.path.join(output_file_path, 'non_zero_first.txt')
    non_zero_rest_path = os.path.join(output_file_path, 'non_zero_rest.txt')

    np.savetxt(non_zero_first_path, non_zero_first)
    np.savetxt(non_zero_rest_path, non_zero_rest)

    print(f'Non-zero voxel values for the first {subjects} volumes saved to {non_zero_first_path}')
    print(f'Non-zero voxel values for the rest of the volumes saved to {non_zero_rest_path}')

    # Calculate Cohen's D for effect size
    mean_first = np.mean(non_zero_first)
    mean_rest = np.mean(non_zero_rest)
    std_first = np.std(non_zero_first, ddof=1)
    std_rest = np.std(non_zero_rest, ddof=1)
    cohen_d = (mean_first - mean_rest) / np.sqrt((std_first ** 2 + std_rest ** 2) / 2)

    print(f'Cohen\'s D: {cohen_d}')

    # Set global font size
    plt.rcParams.update({'font.size': 20})

    # Plot histograms of non-zero voxel values
    plt.figure(figsize=(12, 6))

    plt.hist(non_zero_first, bins=50, color='blue', alpha=0.7, label=f'CLBP Cohort')
    plt.axvline(mean_first, color='red', linestyle='dashed', linewidth=2, label=f'Mean CLBP Cohort: {mean_first:.4f}')
    plt.hist(non_zero_rest, bins=50, color='green', alpha=0.7, label='Control Cohort')
    plt.axvline(mean_rest, color='red', linestyle='dashed', linewidth=2, label=f'Mean Control Cohort: {mean_rest:.4f}')

    plt.title(f'Histogram of Voxel RD Values\nfor the Left Part of the Occipital Corpus Callosum Cluster')
    plt.xlabel('Voxel Value')
    plt.ylabel('Frequency')
    # plt.xlim(0, 1) ### For FA values only
    plt.legend(loc='upper right')

    # Add Cohen's D to the plot
    plt.text(0.95, 0.70, f'Cohen\'s D: {cohen_d:.4f}', horizontalalignment='right', verticalalignment='top', transform=plt.gca().transAxes, fontsize=18, bbox=dict(facecolor='white', alpha=0.8))

    plt.tight_layout()
    plt.savefig(os.path.join(output_file_path, 'voxel_value_histograms.png'))
    plt.show()

    print(f'Histograms saved as voxel_value_histograms.png in the {output_file_path} directory')



cohort_separator('/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13_v1.nii.gz', '/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/selected_clusters/RD_ID13_v1', subjects=26)

