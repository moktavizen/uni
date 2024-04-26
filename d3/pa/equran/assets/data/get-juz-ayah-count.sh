#!/bin/bash

# Function to get the number of ayahs for a given Juz
get_num_ayah() {
	juz="$1"
	jq --arg juz "$juz" '[.[] | select(.juz == ($juz | tonumber))] | length' ayah-list.json
}

# Load the existing JSON file
existing_json=$(<juz-list.json)

# Loop through each Juz and update the JSON
for juz in {1..30}; do
	num_ayah=$(get_num_ayah "$juz")
	# Update the existing JSON with the number of ayahs for the current Juz
	existing_json=$(echo "$existing_json" | jq --arg juz "$juz" --arg num_ayah "$num_ayah" \
		'map(if .id == ($juz | tonumber) then . + { "num_ayah": ($num_ayah | tonumber) } else . end)')
done

# Save the updated JSON back to the file
echo "$existing_json" >merged.json
