#!/bin/bash

# Define the URL
BASE_URL="https://web-api.qurankemenag.net/quran-ayah?surah="

# Function to get data for a specific surah
get_surah_data() {
	surah_number=$1
	curl -s "${BASE_URL}${surah_number}" | jq '.data'
}

# Array to store surah data
surah_data_array=()

# Loop through surah numbers (1 to 114) and fetch data
for ((i = 1; i <= 114; i++)); do
	surah_data=$(get_surah_data $i)
	surah_data_array+=("$surah_data")
done

# Merge data into one JSON array
merged_json=$(printf '%s\n' "${surah_data_array[@]}" | jq -s '.')

# Output to a JSON file
echo "$merged_json" >surah-detail.json
