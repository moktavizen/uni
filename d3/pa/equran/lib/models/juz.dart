// Converted from json using quicktype.io
//
// To parse this JSON data, do
//
//     final juz = juzFromJson(jsonString);

import 'dart:convert';

import 'package:equran/models/ayah.dart';

List<Juz> juzFromJson(String str) =>
    List<Juz>.from(json.decode(str).map((x) => Juz.fromJson(x)));

String juzToJson(List<Juz> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Juz {
  final int id;
  final int numAyah;
  final String startSurah;
  final int startAyah;
  List<Ayah> ayahList;

  Juz({
    required this.id,
    required this.numAyah,
    required this.startSurah,
    required this.startAyah,
    required this.ayahList,
  });

  factory Juz.fromJson(Map<String, dynamic> json) => Juz(
        id: json["id"],
        numAyah: json["num_ayah"],
        startSurah: json["start_surah"],
        startAyah: json["start_ayah"],
        ayahList: [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num_ayah": numAyah,
        "start_surah": startSurah,
        "start_ayah": startAyah,
      };
}
