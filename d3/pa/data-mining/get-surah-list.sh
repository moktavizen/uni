#!/bin/bash

# Fetch JSON data from the URL and filter using jq, then save it to a file
# THIS USED TO WORK, SUDDENDLY IT ONLY RETURNS {}
# curl -s "curl -s "https://web-api.qurankemenag.net/quran-surah" | jq '[.data[]'" | jq '[.data[] | {id, arabic, transliteration, translation, num_ayah, location}]' >surah-list.json

# 
# Create an empty JSON array
echo "[" > surah-list.json

# Loop through each endpoint and append its content to the JSON file
for i in {1..114}; do
    curl -s "https://web-api.qurankemenag.net/quran-surah/$i" | jq '.data | {id, arabic, transliteration, translation, num_ayah, location}' >> surah-list.json
    # Add a comma after each JSON object except for the last one
    if [ $i -ne 114 ]; then
        echo "," >> surah-list.json
    fi
done

# Close the JSON array
echo "]" >> surah-list.json
