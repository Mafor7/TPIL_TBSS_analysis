import nibabel as nib
import numpy as np
import os
import matplotlib.pyplot as plt

def cohort_separator(file_path, output_file_path, subjects=20):
    # Load the 4D image
    file_path = file_path
    img = nib.load(file_path)
    data = img.get_fdata()

    # Separate the first n volumes and the rest
    first_volumes = data[..., :subjects]
    rest_volumes = data[..., subjects:]

    # Calculate the mean image for both subsets
    mean_first = np.mean(first_volumes, axis=-1)
    mean_rest = np.mean(rest_volumes, axis=-1)

    # Create new NIfTI images for the mean images
    mean_first_img = nib.Nifti1Image(mean_first, img.affine, img.header)
    mean_rest_img = nib.Nifti1Image(mean_rest, img.affine, img.header)

    # Save the mean images to files
    output_dir = output_file_path
    os.makedirs(output_dir, exist_ok=True)

    mean_first_path = os.path.join(output_dir, 'mean_conT.nii.gz')
    mean_rest_path = os.path.join(output_dir, 'mean_conD.nii.gz')

    nib.save(mean_first_img, mean_first_path)
    nib.save(mean_rest_img, mean_rest_path)

    print(f'Mean image for the first {subjects} volumes saved to {mean_first_path}')
    print(f'Mean image for the rest of the volumes saved to {mean_rest_path}')

    # Save non-zero voxel values to .txt files
    non_zero_first = mean_first[mean_first != 0]
    non_zero_rest = mean_rest[mean_rest != 0]

    # Calculate the mean value of all voxels in the mean images
    mean_value_first = np.mean(non_zero_first)
    mean_value_rest = np.mean(non_zero_rest)

    # Print the mean values of all voxels in the mean images
    print(f'Mean value of all voxels in the first {subjects} volumes mean image: {mean_value_first}')
    print(f'Mean value of all voxels in the rest of the volumes mean image: {mean_value_rest}')

    non_zero_first_path = os.path.join(output_dir, 'mean_conT.txt')
    non_zero_rest_path = os.path.join(output_dir, 'mean_conD.txt')

    np.savetxt(non_zero_first_path, non_zero_first)
    np.savetxt(non_zero_rest_path, non_zero_rest)

    print(f'Non-zero voxel values for the first {subjects} volumes mean image saved to {non_zero_first_path}')
    print(f'Non-zero voxel values for the rest of the volumes mean image saved to {non_zero_rest_path}')

    # Plot histograms of non-zero voxel values
    plt.figure(figsize=(12, 6))

    plt.subplot(1, 2, 1)
    plt.hist(non_zero_first, bins=50, color='blue', alpha=0.7)
    plt.axvline(mean_value_first, color='red', linestyle='dashed', linewidth=2)
    plt.title(f'Histogram of FA Voxel Values\nConT Volumes')
    plt.xlabel('Voxel Value')
    plt.ylabel('Frequency')
    plt.xlim(0, 1)

    plt.subplot(1, 2, 2)
    plt.hist(non_zero_rest, bins=50, color='green', alpha=0.7)
    plt.axvline(mean_value_rest, color='red', linestyle='dashed', linewidth=2)
    plt.title('Histogram of FA Voxel Values\nConD Volumes')
    plt.xlabel('Voxel Value')
    plt.ylabel('Frequency')
    plt.xlim(0, 1)

    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, 'voxel_value_histograms.png'))
    plt.show()

    print(f'Histograms saved as voxel_value_histograms.png in the {output_dir} directory')

# cohort_separator('/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v1/stats/all_FA_skeletonised.nii.gz', '/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v1', subjects=24)
# cohort_separator('/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v2/stats/all_FA_skeletonised.nii.gz', '/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v2', subjects=25)
# cohort_separator('/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/v3/stats/all_FA_skeletonised.nii.gz', '/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v3', subjects=25)


def histogram(file_path, output="cluster_size_histogram.png"):
    """
    Plots histogram of cluster sizes from a given .txt file.

    Parameters:
        - file_path: str, path to the file containing cluster data
        - output: str, file path to save the plotted histogram

    Returns:
        - Saves a PNG file of the plotted histogram
    """
    data = []

    # Read data from the file
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    for line in lines[1:]:
        fields = line.strip().split()
        cluster_index = int(fields[0])
        voxels = int(fields[1])
        data.append({"Cluster Index": cluster_index, "Voxels": voxels})

    # Extract the "Voxels" values
    voxel_sizes = [entry["Voxels"] for entry in data]

    # Calculate the number of bins
    unique_voxel_sizes = len(set(voxel_sizes))
    num_bins = min(unique_voxel_sizes, 50)

    # Create a histogram
    plt.figure(figsize=(10, 6))
    plt.hist(voxel_sizes, bins=num_bins, edgecolor='black', alpha=0.7)
    plt.xlabel('Cluster Size (Voxels)')
    plt.ylabel('Frequency')
    plt.title('Histogram of Cluster Sizes')
    plt.grid(axis='y')

    # Adjust x-ticks if unique voxel sizes are less than 50
    if unique_voxel_sizes < 50:
        plt.xticks(range(1, max(voxel_sizes) + 1))

    # Save and show the plot
    plt.savefig(output)
    plt.show()

histogram("/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/FA_tstat1_clust_sum.txt", output="/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v1/tstat1_histogram.png")
histogram("/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v1/FA_tstat2_clust_sum.txt", output="/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v1/tstat2_histogram.png")
histogram("/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/FA_tstat1_clust_sum.txt", output="/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v2/tstat1_histogram.png")
histogram("/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v2/FA_tstat2_clust_sum.txt", output="/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v2/tstat2_histogram.png")
histogram("/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/FA_tstat1_clust_sum.txt", output="/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v3/tstat1_histogram.png")
histogram("/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/results/v3/FA_tstat2_clust_sum.txt", output="/Volumes/PT_DATA2/Marc-Antoine/DescoteauxTBSS/systemic_bias/FA_v3/tstat2_histogram.png")