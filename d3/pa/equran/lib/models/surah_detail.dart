// // Converted from EQuran API using Quicktype
//
// To parse this JSON data, do
//
//     final surahDetail = surahDetailFromJson(jsonString);

import 'dart:convert';

List<SurahDetail> surahDetailFromJson(String str) => List<SurahDetail>.from(
    json.decode(str).map((x) => SurahDetail.fromJson(x)));

String surahDetailToJson(List<SurahDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurahDetail {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  Map<String, String> audioFull;
  List<Ayat> ayat;
  SuratSelanjutnya suratSelanjutnya;
  bool suratSebelumnya;

  SurahDetail({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
    required this.suratSelanjutnya,
    required this.suratSebelumnya,
  });

  factory SurahDetail.fromJson(Map<String, dynamic> json) => SurahDetail(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
        suratSelanjutnya: SuratSelanjutnya.fromJson(json["suratSelanjutnya"]),
        suratSebelumnya: json["suratSebelumnya"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
        "suratSelanjutnya": suratSelanjutnya.toJson(),
        "suratSebelumnya": suratSebelumnya,
      };
}

class Ayat {
  int nomorAyat;
  String teksArab;
  String teksLatin;
  String teksIndonesia;
  Map<String, String> audio;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio": Map.from(audio).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class SuratSelanjutnya {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;

  SuratSelanjutnya({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
  });

  factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) =>
      SuratSelanjutnya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };
}
