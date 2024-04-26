#!/bin/bash

# Fetch JSON data from the URL and filter using jq, then save it to a file
curl -s "curl -s "https://web-api.qurankemenag.net/quran-surah" | jq '[.data[]'" | jq '[.data[] | {id, arabic, transliteration, translation, num_ayah, location}]' >surah-list.json
