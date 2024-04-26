// Converted from json using quicktype.io
//
// To parse this JSON data, do
//
//     final ayah = ayahFromJson(jsonString);

import 'dart:convert';

List<Ayah> ayahFromJson(String str) =>
    List<Ayah>.from(json.decode(str).map((x) => Ayah.fromJson(x)));

String ayahToJson(List<Ayah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ayah {
  final int id;
  final int surahId;
  final int juz;
  final int ayah;
  final String arabic;
  final String latin;
  final String translation;

  Ayah({
    required this.id,
    required this.surahId,
    required this.juz,
    required this.ayah,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        id: json["id"],
        surahId: json["surah_id"],
        juz: json["juz"],
        ayah: json["ayah"],
        arabic: json["arabic"],
        latin: json["latin"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah_id": surahId,
        "juz": juz,
        "ayah": ayah,
        "arabic": arabic,
        "latin": latin,
        "translation": translation,
      };
}
