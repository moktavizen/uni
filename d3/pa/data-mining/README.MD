
# Steps to Convert API into Local Database

## SQLite Table Structure

```sql
CREATE TABLE IF NOT EXISTS surahs (
  id INTEGER PRIMARY KEY,
  arabic VARCHAR(16) NOT NULL,
  latin VARCHAR(16) NOT NULL,
  translation VARCHAR(44) NOT NULL,
  ayah_count INTEGER NOT NULL,
  location VARCHAR(12) NOT NULL
);

CREATE TABLE IF NOT EXISTS juzs (
  id INTEGER PRIMARY KEY,
  ayah_count INTEGER NOT NULL,
  surah_start VARCHAR(16) NOT NULL,
  ayah_start INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS ayahs (
  id INTEGER PRIMARY KEY,
  surah_id INTEGER NOT NULL,
  juz_id INTEGER NOT NULL,
  surah_name VARCHAR(16) NOT NULL,
  ayah_num INTEGER NOT NULL,
  arabic VARCHAR(1280) NOT NULL,
  latin VARCHAR(1024) NOT NULL,
  translation VARCHAR(1664) NOT NULL,
  tafsir VARCHAR(3712) NOT NULL,
  FOREIGN KEY (surah_id) REFERENCES surahs (id) ON DELETE CASCADE,
  FOREIGN KEY (juz_id) REFERENCES juzs (id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_ayahs_surah_id ON ayahs (surah_id);
CREATE INDEX IF NOT EXISTS idx_ayahs_juz_id ON ayahs (juz_id);
```

## Insert Data from JSON into SQLite
```sql
INSERT INTO surahs SELECT
  json_extract(value, '$.id'),
  json_extract(value, '$.arabic'),
  json_extract(value, '$.transliteration'),
  json_extract(value, '$.translation'),
  json_extract(value, '$.num_ayah'),
  json_extract(value, '$.location')
FROM json_each(readfile('surah-list.json'));

INSERT INTO juzs SELECT
  json_extract(value, '$.id'),
  json_extract(value, '$.num_ayah'),
  json_extract(value, '$.start_surah'),
  json_extract(value, '$.start_ayah')
FROM json_each(readfile('juz-list.json'));

INSERT INTO ayahs SELECT
  json_extract(value, '$.id'),
  json_extract(value, '$.surah_id'),
  json_extract(value, '$.juz_id'),
  json_extract(value, '$.surah_name'),
  json_extract(value, '$.ayah_num'),
  json_extract(value, '$.arabic'),
  json_extract(value, '$.latin'),
  json_extract(value, '$.translation'),
  json_extract(value, '$.tafsir')
FROM json_each(readfile('ayah-list.json'));
```

## Interesting Fact

 - Longest Surah Name: Al-Mutaffifin
 - Longest Ayah: Al-Baqarah Ayah 282
 - Longest Latin: Al-Baqarah Ayah 282
 - Longest Translation: Al-Baqarah Ayah 282
 - Longest Tafsir: An-Nisa Ayah 23

