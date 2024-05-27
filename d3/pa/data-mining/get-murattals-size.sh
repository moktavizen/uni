#!/bin/bash

# Create a directory to store the downloaded files
mkdir -p murattals_m4a
cd murattals_m4a || exit

# Base URL
base_url="https://media.qurankemenag.net/audio/Abu_Bakr_Ash-Shaatree_aac64/"

# Init total size
total_size_bytes=0

# Define the ranges
for i in {1..114}; do
    for j in {1..286}; do
        file_number=$(printf "%03d%03d" "$i" "$j")
        # Format the URL
        url="$base_url$file_number.m4a"

        # Check if URL exists and calc size if available
        if curl -s --fail "$url" >/dev/null; then
            content_length=$(curl -sI "$url" | awk '/Content-Length/ {print $2}' | tr -d '\r')
            echo "Calculating $url ... file size = $content_length"
            if [ -n "$content_length" ]; then
                total_size_bytes=$((total_size_bytes + content_length))
            fi
        else
            echo "URL not found: $url"
            break
        fi
    done
done

# Wait for all calc to finish
wait

# Calculate total size in megabytes
total_size_mb=$(awk "BEGIN {printf \"%.2f\", $total_size_bytes / 1048576}")

# Print the total size in megabytes
echo "Total size of files if downloaded: $total_size_mb megabytes."
