#!/bin/bash

# Get JSON data from the URL
json_data=$(curl -s https://web-api.qurankemenag.net/quran-ayah)

# Format and filter JSON data using jq and save it to the file
echo "$json_data" | jq '
  [
    .data[] |
    { surah: {
        id: .surah.id,
        arabic: .surah.arabic,
        transliteration: .surah.transliteration,
        translation: .surah.translation,
        num_ayah: .surah.num_ayah,
        location: .surah.location,
        ayahs: [{
          id: .id,
          ayah: .ayah,
          juz: .juz,
          arabic: .arabic,
          latin: .latin,
          translation: .translation
        }]
      }
    }
  ] |
  group_by(.surah.id) |
  map({
    surah: {
      id: .[0].surah.id,
      arabic: .[0].surah.arabic,
      transliteration: .[0].surah.transliteration,
      translation: .[0].surah.translation,
      num_ayah: .[0].surah.num_ayah,
      location: .[0].surah.location,
      ayahs: map(.surah.ayahs[0])
    }
  }) |
  map(.surah)
' >surah-list.json
