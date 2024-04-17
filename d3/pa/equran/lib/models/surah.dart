// Converted from json using quicktype.io
//
// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

List<Surah> surahFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

String surahToJson(List<Surah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Surah {
  int id;
  String arabic;
  String transliteration;
  String translation;
  int numAyah;
  Location location;
  List<Ayah> ayahs;

  Surah({
    required this.id,
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.numAyah,
    required this.location,
    required this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        id: json["id"],
        arabic: json["arabic"],
        transliteration: json["transliteration"],
        translation: json["translation"],
        numAyah: json["num_ayah"],
        location: locationValues.map[json["location"]]!,
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arabic": arabic,
        "transliteration": transliteration,
        "translation": translation,
        "num_ayah": numAyah,
        "location": locationValues.reverse[location],
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
      };
}

class Ayah {
  int id;
  int ayah;
  int juz;
  String arabic;
  String latin;
  String translation;

  Ayah({
    required this.id,
    required this.ayah,
    required this.juz,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        id: json["id"],
        ayah: json["ayah"],
        juz: json["juz"],
        arabic: json["arabic"],
        latin: json["latin"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ayah": ayah,
        "juz": juz,
        "arabic": arabic,
        "latin": latin,
        "translation": translation,
      };
}

enum Location { MADANIYAH, MAKKIYAH }

final locationValues = EnumValues(
    {"Madaniyah": Location.MADANIYAH, "Makkiyah": Location.MAKKIYAH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
