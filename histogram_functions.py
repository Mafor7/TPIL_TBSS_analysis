import glob
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import cm

def plot_cluster_histogram(cluster_files1, cluster_files2, output="combined_histogram", boundary_low=None, boundary_high=None, metric="FA"):
    """
    Plots histogram of cluster size distribution from .txt files

    Parameters:
        - cluster_files1: list, list of files that will be plotted on the histogram. Ex: cluster size distribution for every visit
        - cluster_files2: list, list of files that will be plotted on the histogram. Ex: cluster size distribution that overlaps across visits
        - output: str, base file path to save plotted histograms

    Returns:
        - Two png files of the plotted histograms with different y-axis limits
    """
    def plot_histogram(ax, y_limit):
        # Define colormaps
        autumn_cmap = plt.get_cmap('autumn')
        winter_cmap = plt.get_cmap('winter')

        # Plot histograms for the first files with autumn colormap
        for i, cluster_file in enumerate(cluster_files1):
            with open(cluster_file, 'r') as f:
                lines = f.readlines()

            cluster_info = []
            for line in lines[1:]:
                data = line.split()
                cluster_index = int(data[0])
                voxels = int(data[1])
                cluster_info.append({"Cluster Index": cluster_index, "Voxels": voxels})

            cluster_sizes = [cluster["Voxels"] for cluster in cluster_info]

            cluster_size_counts = {}
            for size in cluster_sizes:
                if size in cluster_size_counts:
                    cluster_size_counts[size] += 1
                else:
                    cluster_size_counts[size] = 1

            # Get a different color from the colormap for each file
            color = autumn_cmap(float(i) / len(cluster_files1))
            # Displace bars for each file slightly
            x_offset = i * 0.2
            ax.bar(np.array(list(cluster_size_counts.keys())) + x_offset, cluster_size_counts.values(), label=cluster_file.split('/')[-2], alpha=0.7, color=color)
            
        # Plot histograms for the last files with winter colormap
        for i, cluster_file in enumerate(cluster_files2):
            with open(cluster_file, 'r') as f:
                lines = f.readlines()

            cluster_info = []
            for line in lines[1:]:
                data = line.split()
                cluster_index = int(data[0])
                voxels = int(data[1])
                cluster_info.append({"Cluster Index": cluster_index, "Voxels": voxels})

            cluster_sizes = [cluster["Voxels"] for cluster in cluster_info]

            cluster_size_counts = {}
            for size in cluster_sizes:
                if size in cluster_size_counts:
                    cluster_size_counts[size] += 1
                else:
                    cluster_size_counts[size] = 1

            # Get a different color from the colormap for each file
            color = winter_cmap(float(i) / len(cluster_files2))
            # Displace bars for each file slightly
            x_offset = i * 0.2
            ax.bar(np.array(list(cluster_size_counts.keys())) + 0.5 + x_offset, cluster_size_counts.values(), label='overlap', alpha=0.7, color=color)

        ax.set_xlabel('Cluster Size')
        ax.set_ylabel('Number of Clusters')
        ax.set_title('Distribution of significantly different\n' + str(metric) + ' clusters within the same cohort')
        ax.legend(loc='upper right')
        ax.grid(axis='y')
        # Set y-axis limit
        ax.set_ylim(y_limit)

    # Plot and save the first histogram
    fig, ax = plt.subplots()
    plot_histogram(ax, (0, boundary_low))
    plt.savefig(output + "_0_" + str(boundary_low) + ".png")
    plt.close()

    # Plot and save the second histogram
    fig, ax = plt.subplots()
    plot_histogram(ax, (boundary_high, 300))
    plt.savefig(output + "_" + str(boundary_high) + "_300.png")
    plt.close()


def plot_voxel_histogram(file_list1, file_list2, labels1, labels2, metric="FA", output="combined_histogram.png"):
    """
    Plots histogram of voxel values from .csv files

    Parameters:
        - file_list1: list, list of files that will be plotted on the histogram. Ex: friedman statistic values for the voxels of the whole tbss skeleton
        - file_list2: list, list of files that will be plotted on the histogram. Ex: friedman statistic values for the voxels of the overlapping clusters across visits
        - labels1: list, list of labels for file_list1
        - labels2: list, list of labels for file_list2
        - output: str, file path to save plotted histogram

    Returns:
        - png file of the plotted histogram
    """
    fig, ax = plt.subplots()

    # Define colormaps
    autumn_cmap = plt.get_cmap('autumn')
    winter_cmap = plt.get_cmap('winter')

    # Plot histograms for the first group of files with autumn colormap
    for i, (file, label) in enumerate(zip(file_list1, labels1)):
        # Read the CSV file
        df = pd.read_csv(file)
        voxel_values = df['Friedman_Stat'].tolist()

        # Create histogram
        hist, bins = np.histogram(voxel_values, bins=50)

        # Get a different color from the colormap for each file
        color = autumn_cmap(float(i) / len(file_list1))

        # Plot histogram
        ax.bar(bins[:-1], hist, width=np.diff(bins), alpha=0.7, color=color, label=label)

    # Plot histograms for the second group of files with winter colormap
    for i, (file, label) in enumerate(zip(file_list2, labels2)):
        # Read the CSV file
        df = pd.read_csv(file)
        voxel_values = df['Friedman_Stat'].tolist()

        # Create histogram
        hist, bins = np.histogram(voxel_values, bins=50)

        # Get a different color from the colormap for each file
        color = winter_cmap(float(i) / len(file_list2))

        # Plot histogram
        ax.bar(bins[:-1] + 0.01, hist, width=np.diff(bins), alpha=0.7, color=color, label=label)

    ax.set_xlabel('Friedman statistic')
    ax.set_ylabel('Frequency')
    ax.set_title('Distribution of Friedman statistic across ' + str(metric) + ' voxels')
    ax.legend(loc='upper right')
    plt.grid(axis='y')
    # Set y-axis limit
    ax.set_ylim(0, 100)
    plt.savefig(output)
    plt.close()


def main():
    ### plot histogram of all clusters found by TBSS 

    ## Process all cluster files FA
    cluster_files_fa = [
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/FA_tstat_clust_sum.txt",
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/FA_tstat_clust_sum.txt",
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/FA_tstat_clust_sum.txt",
    ]

    cluster_files_overlap_fa = [
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/FA_overlap_vox_tstat_clust_sum.txt"
    ]

    plot_cluster_histogram(cluster_files_fa, cluster_files_overlap_fa, output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/combined_histogram_FA", boundary_low=60, boundary_high=100, metric="FA")
    # plot_cluster_histogram(cluster_files_clbp_fa, cluster_files_control_fa, output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/combined_histogram_between_visits_FA", boundary_low=60, boundary_high=100, metric="FA")

    # Process all cluster files MD
    cluster_files_md = [
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/MD_tstat_clust_sum.txt",
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/MD_tstat_clust_sum.txt",
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/MD_tstat_clust_sum.txt",
    ]

    cluster_files_overlap_md = [
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/MD_overlap_vox_tstat_clust_sum.txt"
    ]

    plot_cluster_histogram(cluster_files_md, cluster_files_overlap_md, output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/combined_histogram_MD", boundary_low=60, boundary_high=140, metric="MD")
    # plot_cluster_histogram(cluster_files_clbp_md, cluster_files_control_md, output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/combined_histogram_between_visits_MD", boundary_low=60, boundary_high=140, metric="MD")

    # Process all cluster files RD
    cluster_files_rd = [
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/RD_tstat_clust_sum.txt",
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/RD_tstat_clust_sum.txt",
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/RD_tstat_clust_sum.txt",
    ]

    cluster_files_overlap_rd = [
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/RD_overlap_vox_tstat_clust_sum.txt"
    ]

    plot_cluster_histogram(cluster_files_rd, cluster_files_overlap_rd, output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/combined_histogram_RD", boundary_low=60, boundary_high=140, metric="RD")
    # plot_cluster_histogram(cluster_files_clbp_rd, cluster_files_control_rd, output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/combined_histogram_between_visits_RD", boundary_low=60, boundary_high=140, metric="RD")

    # Process all cluster files AD
    cluster_files_ad = [
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v1/AD_tstat_clust_sum.txt",
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v2/AD_tstat_clust_sum.txt",
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/v3/AD_tstat_clust_sum.txt",
    ]

    cluster_files_overlap_ad = [
        "/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/overlap/AD_overlap_vox_tstat_clust_sum.txt"
    ]

    plot_cluster_histogram(cluster_files_ad, cluster_files_overlap_ad, output="/Users/Marc-Antoine/repositories/TPIL_TBSS_24072024/clbp_conT/results/combined_histogram_AD", boundary_low=60, boundary_high=160, metric="AD")
    # plot_cluster_histogram(cluster_files_clbp_ad, cluster_files_control_ad, output="/Volumes/PT_DATA2/Marc-Antoine/myTBSS/data/combined_histogram_between_visits_AD", boundary_low=60, boundary_high=160, metric="AD")

if __name__ == "__main__":
    main()