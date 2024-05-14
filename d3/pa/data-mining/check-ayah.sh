# Create an array to store missing IDs
missing_ids=()

# Loop through each expected ID from 1 to 6236
for ((id=1; id<=6236; id++)); do
    # Check if the ID exists in the JSON file
    if ! jq ".[] | select(.id == $id)" ayah-list.json >/dev/null; then
        missing_ids+=("$id")
    fi
done

# Check if any missing IDs were found
if [ ${#missing_ids[@]} -eq 0 ]; then
    echo "All IDs from 1 to 6236 are present in the JSON file."
else
    echo "The following IDs are missing from the JSON file:"
    echo "${missing_ids[@]}"
fi

