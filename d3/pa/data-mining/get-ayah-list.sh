#!/bin/bash

# Fetch JSON data from the URL and filter using jq, then save it to a file
# /quran-tafsir will get ayah and tafsir, /quran-ayah will get ayah only
# THIS USED TO WORK, SUDDENDLY IT ONLY RETURNS {}
# curl -s "https://web-api.qurankemenag.net/quran-tafsir" \
#   | jq '[.data[] | {id, surah_id, juz_id: .juz, ayah_num: .ayah, arabic, translation, tafsir: .tafsir.wajiz}]' \
#   > ayah-list.json

# Create an empty JSON array
echo "[" > ayah-list.json

# Loop through each endpoint and append its content to the JSON file
for i in {1..6236}; do
    curl -s "https://web-api.qurankemenag.net/quran-tafsir/$i" \
        | jq '.data | {id, surah_id, surah_name: .surah.transliteration, juz_id: .juz, ayah_num: .ayah, arabic, translation, tafsir: .tafsir.wajiz}' \
        >> ayah-list.json

    # Add a comma after each JSON object except for the last one
    if [ $i -ne 6236 ]; then
        echo "," >> ayah-list.json
    fi
done

# Close the JSON array
echo "]" >> ayah-list.json