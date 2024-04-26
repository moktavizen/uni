// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

import 'package:equran/models/ayah.dart';

List<Surah> surahFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

String surahToJson(List<Surah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Surah {
  final int id;
  final String arabic;
  final String transliteration;
  final String translation;
  final int numAyah;
  final String location;
  List<Ayah> ayahList;

  Surah({
    required this.id,
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.numAyah,
    required this.location,
    required this.ayahList,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        id: json["id"],
        arabic: json["arabic"],
        transliteration: json["transliteration"],
        translation: json["translation"],
        numAyah: json["num_ayah"],
        location: json["location"],
        ayahList: [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arabic": arabic,
        "transliteration": transliteration,
        "translation": translation,
        "num_ayah": numAyah,
        "location": location,
      };
}
