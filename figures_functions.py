
from __future__ import division

# !/usr/bin/env python
# -*- coding: utf-8
#########################################################################################
#
# Present figures for dMRI review
#
# example: python tractometry_stat.py -i <results>
# ---------------------------------------------------------------------------------------
# Authors: Marc-Antoine Fortier
#
# About the license: see the file LICENSE
#########################################################################################


import json
import glob

import pandas as pd
import numpy as np
import os
import plotly.express as px
import plotly.graph_objects as go
import plotly.colors as pc
from plotly.subplots import make_subplots


def sunburst_overlap_tbss():
    # Sunburst table
    path_results = os.path.abspath("/Users/Marc-Antoine/Downloads/figure_data_thesis.xlsx")
    df_a = pd.read_excel(path_results, sheet_name="FA", header=0, usecols="L:O")
    df_b = pd.read_excel(path_results, sheet_name="MD", header=0, usecols="L:O")
    df_c = pd.read_excel(path_results, sheet_name="RD", header=0, usecols="L:O")
    df_d = pd.read_excel(path_results, sheet_name="AD", header=0, usecols="L:O")
    
    # Define the dataframes
    dataframes = [df_a, df_b, df_c, df_d]
    
    # Create a color palette with a unique color for each unique ID
    unique_ids = pd.concat([df.idss for df in dataframes]).unique()
    colors = pc.qualitative.Plotly
    color_map = {uid: colors[i % len(colors)] for i, uid in enumerate(unique_ids)}
    
    # Create a new figure
    fig = go.Figure()

    # Define the positions for each Sunburst chart in a 2x2 grid
    positions = [(0, 0), (0, 1), (1, 0), (1, 1)]

    # Loop through dataframes and add Sunburst traces
    for i, df_data in enumerate(dataframes):
        row, col = positions[i]
        primary_df = df_data

        # Map colors based on the ids
        mapped_colors = [color_map[id_] for id_ in primary_df.idss]

        fig.add_trace(go.Sunburst(
            ids=primary_df.idss,
            labels=primary_df.labelss,
            parents=primary_df.parentss,
            values=primary_df.valueee,
            branchvalues="total",
            insidetextorientation='radial',
            domain=dict(column=col, row=row),  # Adjust column and row indices based on position
            marker=dict(colors=mapped_colors),  # Apply mapped colors
            textfont=dict(size=18),  # Set the font size
            textinfo='label',  # Display labels
            outsidetextfont=dict(size=14)  # Allow text to spill out with the same font size
        ))

    fig.update_layout(
        grid=dict(columns=2, rows=2),  # Adjust the number of rows
        margin=dict(t=0, l=0, r=0, b=0),
        # plot_bgcolor='lightgray',  # Set the plot background color
        # paper_bgcolor='lightgray'  # Set the entire figure background color
    )
    fig.update_layout(uniformtext=dict(minsize=18, mode='show'))

    # Add percentage to the hover information
    fig.update_traces(hovertemplate='<b>%{label}</b><br>Value: %{value}<br>Percentage: %{percentRoot:.1%}')

    fig.write_html("/Users/Marc-Antoine/Downloads/sunburst_TBSS_overlap.html")

# sunburst_overlap_tbss()

def friedman_plot(data):
    
    # Colors for the bars
    colors = {
        'Variable': 'blue',
        'Stable': 'green'
    }

    # Create the figure with subplots
    fig = make_subplots(rows=1, cols=2, subplot_titles=("Overlap Clusters (102 voxels)", "Whole Skeleton (90393 voxels)"))

    # Add data for the Overlap Cluster subplot
    for group in ['Control', 'CLBP']:
        for dtype in ['Variable', 'Stable']:
            subset = [d for d in data if d['Group'] == group and d['Condition'] == 'Overlap Cluster' and d['Type'] == dtype]
            fig.add_trace(
                go.Bar(
                    x=[group],
                    y=[subset[0]['Number of Voxels']],
                    name=f"{group} - {dtype}",
                    legendgroup=dtype,
                    marker_color=colors[dtype],
                    showlegend=True if group == 'Control' else False
                ),
                row=1, col=1
            )

    # Add data for the Whole Skeleton subplot
    for group in ['Control', 'CLBP']:
        for dtype in ['Variable', 'Stable']:
            subset = [d for d in data if d['Group'] == group and d['Condition'] == 'Whole Skeleton' and d['Type'] == dtype]
            fig.add_trace(
                go.Bar(
                    x=[group],
                    y=[subset[0]['Number of Voxels']],
                    name=f"{group} - {dtype}",
                    legendgroup=dtype,
                    marker_color=colors[dtype],
                    showlegend=False if dtype == 'Variable' else True
                ),
                row=1, col=2
            )

    # Update layout
    fig.update_layout(
        title_text="Number of Variable AD Voxels with Friedman test",
        barmode='group',
        yaxis_title="Number of Voxels"
    )

    # Show the figure
    fig.show()



# ## FA data
# data = [
#         {'Group': 'Control', 'Condition': 'Overlap Cluster', 'Type': 'Variable', 'Number of Voxels': 2},
#         {'Group': 'Control', 'Condition': 'Overlap Cluster', 'Type': 'Stable', 'Number of Voxels': 137},
#         {'Group': 'CLBP', 'Condition': 'Overlap Cluster', 'Type': 'Variable', 'Number of Voxels': 5},
#         {'Group': 'CLBP', 'Condition': 'Overlap Cluster', 'Type': 'Stable', 'Number of Voxels': 134},
#         {'Group': 'Control', 'Condition': 'Whole Skeleton', 'Type': 'Variable', 'Number of Voxels': 6759},
#         {'Group': 'Control', 'Condition': 'Whole Skeleton', 'Type': 'Stable', 'Number of Voxels': 83634},
#         {'Group': 'CLBP', 'Condition': 'Whole Skeleton', 'Type': 'Variable', 'Number of Voxels': 5829},
#         {'Group': 'CLBP', 'Condition': 'Whole Skeleton', 'Type': 'Stable', 'Number of Voxels': 84564}
#     ]
### MD data
# data = [
#         {'Group': 'Control', 'Condition': 'Overlap Cluster', 'Type': 'Variable', 'Number of Voxels': 0},
#         {'Group': 'Control', 'Condition': 'Overlap Cluster', 'Type': 'Stable', 'Number of Voxels': 7},
#         {'Group': 'CLBP', 'Condition': 'Overlap Cluster', 'Type': 'Variable', 'Number of Voxels': 1},
#         {'Group': 'CLBP', 'Condition': 'Overlap Cluster', 'Type': 'Stable', 'Number of Voxels': 6},
#         {'Group': 'Control', 'Condition': 'Whole Skeleton', 'Type': 'Variable', 'Number of Voxels': 6376},
#         {'Group': 'Control', 'Condition': 'Whole Skeleton', 'Type': 'Stable', 'Number of Voxels': 84017},
#         {'Group': 'CLBP', 'Condition': 'Whole Skeleton', 'Type': 'Variable', 'Number of Voxels': 6156},
#         {'Group': 'CLBP', 'Condition': 'Whole Skeleton', 'Type': 'Stable', 'Number of Voxels': 84237}
#     ]
### RD data
# data = [
#         {'Group': 'Control', 'Condition': 'Overlap Cluster', 'Type': 'Variable', 'Number of Voxels': 0},
#         {'Group': 'Control', 'Condition': 'Overlap Cluster', 'Type': 'Stable', 'Number of Voxels': 46},
#         {'Group': 'CLBP', 'Condition': 'Overlap Cluster', 'Type': 'Variable', 'Number of Voxels': 6},
#         {'Group': 'CLBP', 'Condition': 'Overlap Cluster', 'Type': 'Stable', 'Number of Voxels': 40},
#         {'Group': 'Control', 'Condition': 'Whole Skeleton', 'Type': 'Variable', 'Number of Voxels': 6617},
#         {'Group': 'Control', 'Condition': 'Whole Skeleton', 'Type': 'Stable', 'Number of Voxels': 83776},
#         {'Group': 'CLBP', 'Condition': 'Whole Skeleton', 'Type': 'Variable', 'Number of Voxels': 5904},
#         {'Group': 'CLBP', 'Condition': 'Whole Skeleton', 'Type': 'Stable', 'Number of Voxels': 84489}
#     ]
# ### AD data
data = [
        {'Group': 'Control', 'Condition': 'Overlap Cluster', 'Type': 'Variable', 'Number of Voxels': 4},
        {'Group': 'Control', 'Condition': 'Overlap Cluster', 'Type': 'Stable', 'Number of Voxels': 98},
        {'Group': 'CLBP', 'Condition': 'Overlap Cluster', 'Type': 'Variable', 'Number of Voxels': 4},
        {'Group': 'CLBP', 'Condition': 'Overlap Cluster', 'Type': 'Stable', 'Number of Voxels': 98},
        {'Group': 'Control', 'Condition': 'Whole Skeleton', 'Type': 'Variable', 'Number of Voxels': 6667},
        {'Group': 'Control', 'Condition': 'Whole Skeleton', 'Type': 'Stable', 'Number of Voxels': 83726},
        {'Group': 'CLBP', 'Condition': 'Whole Skeleton', 'Type': 'Variable', 'Number of Voxels': 6225},
        {'Group': 'CLBP', 'Condition': 'Whole Skeleton', 'Type': 'Stable', 'Number of Voxels': 84168}
    ]

friedman_plot(data=data)