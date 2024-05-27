#!/bin/bash

# Create a directory to store the downloaded files
mkdir -p murattals_m4a
cd murattals_m4a

# Base URL
base_url="https://media.qurankemenag.net/audio/Abu_Bakr_Ash-Shaatree_aac64/"

# Define the ranges
for i in {1..114}; do
    for j in {1..286}; do
        file_number=$(printf "%03d%03d" $i $j)
        # Format the URL
        url="$base_url$file_number.m4a"

        # Check if URL exists and download if available
        if curl -s --fail "$url" >/dev/null; then
            echo "Downloading $url ..."
            curl -s -O "$url"
        else
            echo "URL not found: $url"
            break
        fi
    done
done

# Wait for all downloads to finish
wait

echo "All downloads completed."
