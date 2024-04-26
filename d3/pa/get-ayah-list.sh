#!/bin/bash

# Fetch JSON data from the URL and filter using jq, then save it to a file
curl -s "https://web-api.qurankemenag.net/quran-ayah" | jq '[.data[] | {id, surah_id, juz, ayah, arabic, latin, translation}]' >ayah-list.json
