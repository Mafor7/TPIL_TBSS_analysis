
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


def sunburst_friedman():
    # Sunburst table
    path_results = os.path.abspath("/Users/Marc-Antoine/Downloads/figure_data_thesis.xlsx")
    df_a = pd.read_excel(path_results, sheet_name="FA", header=0, usecols="A:D")
    df_aa = pd.read_excel(path_results, sheet_name="FA", header=0, usecols="F:I")
    df_b = pd.read_excel(path_results, sheet_name="MD", header=0, usecols="A:D")
    df_bb = pd.read_excel(path_results, sheet_name="MD", header=0, usecols="F:I")
    df_c = pd.read_excel(path_results, sheet_name="RD", header=0, usecols="A:D")
    df_cc = pd.read_excel(path_results, sheet_name="RD", header=0, usecols="F:I")
    df_d = pd.read_excel(path_results, sheet_name="AD", header=0, usecols="A:D")
    df_dd = pd.read_excel(path_results, sheet_name="AD", header=0, usecols="F:I")
    
    fig = go.Figure()

    colors = ['blue', 'green', 'red', 'orange', 'purple', 'yellow']  # Define color schemes for each pair of charts

    for i, ((df_data, df_data_secondary), color) in enumerate(zip([(df_a, df_aa), (df_b, df_bb), (df_c, df_cc), (df_d, df_dd)], colors)):
        primary_df = df_data
        secondary_df = df_data_secondary

        fig.add_trace(go.Sunburst(
            ids=secondary_df.ids,
            labels=secondary_df.labels,
            parents=secondary_df.parents,
            values=secondary_df.valuee,
            branchvalues="total",
            insidetextorientation='radial',
            domain=dict(column=0, row=i),  # Adjust row index to stack vertically
            marker=dict(colors=[color]*len(secondary_df.ids))  # Ensure to provide an array of colors
        ))

        fig.add_trace(go.Sunburst(
            ids=primary_df.id,
            labels=primary_df.label,
            parents=primary_df.parent,
            values=primary_df.value,
            branchvalues="total",
            insidetextorientation='radial',
            domain=dict(column=1, row=i),  # Adjust row index to stack vertically
            marker=dict(colors=[color]*len(primary_df.id))  # Ensure to provide an array of colors
        ))

    fig.update_layout(
        grid=dict(columns=2, rows=4),  # Adjust the number of rows
        margin=dict(t=0, l=0, r=0, b=0),
        plot_bgcolor='lightgray',  # Set the plot background color
        paper_bgcolor='lightgray'  # Set the entire figure background colo
    )
    fig.update_layout(uniformtext=dict(minsize=12, mode='show'))

    # Add percentage to the hover information
    fig.update_traces(hovertemplate='<b>%{label}</b><br>Value: %{value}<br>Percentage: %{percentRoot:.1%}')

    fig.write_html("/Users/Marc-Antoine/Downloads/sunburst_friedman.html")

sunburst_friedman()

def sunburst_overlap_tbss():
    # Sunburst table
    path_results = os.path.abspath("/Users/Marc-Antoine/Downloads/figure_data_thesis.xlsx")
    df_a = pd.read_excel(path_results, sheet_name="FA", header=0, usecols="L:O")
    df_b = pd.read_excel(path_results, sheet_name="MD", header=0, usecols="L:O")
    df_c = pd.read_excel(path_results, sheet_name="RD", header=0, usecols="L:O")
    df_d = pd.read_excel(path_results, sheet_name="AD", header=0, usecols="L:O")
    
    # Define the dataframes and colors
    dataframes = [df_a, df_b, df_c, df_d]
    colors = ['red', 'blue', 'green', 'orange']
    
    # Create a new figure
    fig = go.Figure()

    # Define the positions for each Sunburst chart in a 2x2 grid
    positions = [(0, 0), (0, 1), (1, 0), (1, 1)]

    # Loop through dataframes and add Sunburst traces
    for i, (df_data, color) in enumerate(zip(dataframes, colors)):
        row, col = positions[i]
        primary_df = df_data

        fig.add_trace(go.Sunburst(
            ids=primary_df.idss,
            labels=primary_df.labelss,
            parents=primary_df.parentss,
            values=primary_df.valueee,
            branchvalues="total",
            insidetextorientation='radial',
            domain=dict(column=col, row=row),  # Adjust column and row indices based on position
            marker=dict(colors=[color] * len(primary_df.idss)),  # Ensure to provide an array of colors
            textfont=dict(size=18),  # Set the font size
            textinfo='label',  # Display labels
            outsidetextfont=dict(size=14)  # Allow text to spill out with the same font size
        ))

    fig.update_layout(
        grid=dict(columns=2, rows=2),  # Adjust the number of rows
        margin=dict(t=0, l=0, r=0, b=0),
        plot_bgcolor='lightgray',  # Set the plot background color
        paper_bgcolor='lightgray'  # Set the entire figure background colo
    )
    fig.update_layout(uniformtext=dict(minsize=18, mode='show'))

    # Add percentage to the hover information
    fig.update_traces(hovertemplate='<b>%{label}</b><br>Value: %{value}<br>Percentage: %{percentRoot:.1%}')

    fig.write_html("/Users/Marc-Antoine/Downloads/sunburst_TBSS_overlap.html")

# sunburst_overlap_tbss()