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
  final String surahName;
  final int juzId;
  final int ayahNum;
  final String arabic;
  final String translation;
  final String tafsir;

  Ayah({
    required this.id,
    required this.surahId,
    required this.surahName,
    required this.juzId,
    required this.ayahNum,
    required this.arabic,
    required this.translation,
    required this.tafsir,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        id: json["id"],
        surahId: json["surah_id"],
        surahName: json["surah_name"],
        juzId: json["juz_id"],
        ayahNum: json["ayah_num"],
        arabic: json["arabic"],
        translation: json["translation"],
        tafsir: json["tafsir"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah_id": surahId,
        "surah_name": surahName,
        "juz_id": juzId,
        "ayah_num": ayahNum,
        "arabic": arabic,
        "translation": translation,
        "tafsir": tafsir,
      };
}
