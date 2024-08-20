import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats

def tractometry_calculator(folder_paths, metric='fa', row_index=15):
    # Initialize lists to store results
    results_dfs = []
    
    for folder_path in folder_paths:
        data_list = []

        # Iterate through all files in the folder
        for filename in os.listdir(folder_path):
            if filename.endswith('.xlsx'):
                file_path = os.path.join(folder_path, filename)
                
                try:
                    # Read the specified sheet and row
                    df = pd.read_excel(file_path, sheet_name=f'{metric}_metric', header=None, engine='openpyxl')
                    row_data = df.iloc[row_index, 1:].values  # iloc[15, 1:] gets the 16th row (index 15) excluding the first column
                    data_list.append(row_data)
                except Exception as e:
                    print(f"Could not read file {filename} from {folder_path}: {e}")

        # Convert the list to a numpy array for easier manipulation
        data_array = np.array(data_list, dtype=float)

        # Calculate the mean and standard deviation for each cell across all files
        mean_values = np.nanmean(data_array, axis=0)
        std_values = np.nanstd(data_array, axis=0)

        # Create a DataFrame to store the results
        results_df = pd.DataFrame({
            'Mean': mean_values,
            'Standard Deviation': std_values
        })
        results_dfs.append(results_df)

    # Plotting
    x_values = np.arange(len(results_dfs[0]['Mean']))  # X-axis values from 0 to number of cells - 1

    plt.figure(figsize=(14, 8))

    # Hot colors (first three dataframes)
    colors_hot = ['red', 'indianred', 'coral']
    for i in range(3):
        plt.plot(x_values, results_dfs[i]['Mean'], marker='o', linestyle='-', color=colors_hot[i], label=f'CLBP Visit {i+1} Mean')
        plt.fill_between(x_values, results_dfs[i]['Mean'] - results_dfs[i]['Standard Deviation'], 
                        results_dfs[i]['Mean'] + results_dfs[i]['Standard Deviation'], color=colors_hot[i], alpha=0.2, label=f'CLBP Visit {i+1} Std Dev')

    # Cold colors (last three dataframes)
    colors_cold = ['blue', 'teal', 'turquoise']
    for i in range(3, 6):
        plt.plot(x_values, results_dfs[i]['Mean'], marker='o', linestyle='-', color=colors_cold[i-3], label=f'Control Visit {i-2} Mean')
        plt.fill_between(x_values, results_dfs[i]['Mean'] - results_dfs[i]['Standard Deviation'], 
                        results_dfs[i]['Mean'] + results_dfs[i]['Standard Deviation'], color=colors_cold[i-3], alpha=0.2, label=f'Control Visit {i-2} Std Dev')

    plt.xlabel('Tract Segment Number', fontsize=16)
    plt.ylabel('RD Values', fontsize=16)
    plt.title('RD Values Along the Occipital corpus Callosum', fontsize=20)

    # Set font size for axis values (ticks)
    plt.xticks(fontsize=14)
    plt.yticks(fontsize=14)

    plt.legend(fontsize=14)
    plt.grid(True)

    plt.show()


def t_test_tractometry(folder_path1, folder_path2, metric='fa', row_index=15):
    # Initialize lists to store results
    data_list1 = []
    data_list2 = []

    # Iterate through files in folder1
    for filename in os.listdir(folder_path1):
        if filename.endswith('.xlsx'):
            file_path = os.path.join(folder_path1, filename)
            
            try:
                # Read the specified sheet and row
                df = pd.read_excel(file_path, sheet_name=f'{metric}_metric', header=None, engine='openpyxl')
                row_data = df.iloc[row_index, 1:].values  # iloc[15, 1:] gets the 16th row (index 15) excluding the first column
                data_list1.append(row_data)
            except Exception as e:
                print(f"Could not read file {filename} from {folder_path1}: {e}")

    # Convert the list to a numpy array for easier manipulation
    data_array1 = np.array(data_list1, dtype=float)

    # Iterate through files in folder2
    for filename in os.listdir(folder_path2):
        if filename.endswith('.xlsx'):
            file_path = os.path.join(folder_path2, filename)
            
            try:
                # Read the specified sheet and row
                df = pd.read_excel(file_path, sheet_name=f'{metric}_metric', header=None, engine='openpyxl')
                row_data = df.iloc[row_index, 1:].values  # iloc[15, 1:] gets the 16th row (index 15) excluding the first column
                data_list2.append(row_data)
            except Exception as e:
                print(f"Could not read file {filename} from {folder_path2}: {e}")

    # Convert the list to a numpy array for easier manipulation
    data_array2 = np.array(data_list2, dtype=float)

    # Ensure both arrays have the same number of columns
    if data_array1.shape[1] != data_array2.shape[1]:
        raise ValueError("The number of columns in the datasets from the two folders do not match.")

    # Initialize lists to store t-test results
    t_statistics = []
    p_values = []

    # Perform t-test for each cell
    for col in range(data_array1.shape[1]):
        t_stat, p_val = stats.ttest_ind(data_array1[:, col], data_array2[:, col], equal_var=False)
        t_statistics.append(t_stat)
        p_values.append(p_val)

    # Create a DataFrame to store the t-test results
    results_df = pd.DataFrame({
        'Cell Index': np.arange(data_array1.shape[1]),
        'T-Statistic': t_statistics,
        'P-Value': p_values
    })

    # Print the DataFrame
    print(results_df)

    return results_df

        


def main():

    tractometry_calculator(folder_paths=[
        '/Users/Marc-Antoine/Downloads/excels_tractometry/patient/v1',
        '/Users/Marc-Antoine/Downloads/excels_tractometry/patient/v2',
        '/Users/Marc-Antoine/Downloads/excels_tractometry/patient/v3',
        '/Users/Marc-Antoine/Downloads/excels_tractometry/control/v1',
        '/Users/Marc-Antoine/Downloads/excels_tractometry/control/v2',
        '/Users/Marc-Antoine/Downloads/excels_tractometry/control/v3'
    ], metric='rd', row_index=5)

    print('t-test for visit 1')
    t_test_tractometry('/Users/Marc-Antoine/Downloads/excels_tractometry/patient/v1', '/Users/Marc-Antoine/Downloads/excels_tractometry/control/v1', metric='rd', row_index=5)
    print('t-test for visit 2')
    t_test_tractometry('/Users/Marc-Antoine/Downloads/excels_tractometry/patient/v2', '/Users/Marc-Antoine/Downloads/excels_tractometry/control/v2', metric='rd', row_index=5)
    print('t-test for visit 3')
    t_test_tractometry('/Users/Marc-Antoine/Downloads/excels_tractometry/patient/v3', '/Users/Marc-Antoine/Downloads/excels_tractometry/control/v3', metric='rd', row_index=5)

if __name__ == "__main__":
    main()