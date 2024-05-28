import 'package:equran/models/ayah.dart';
import 'package:equran/models/juz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'juzs_provider.g.dart';

@riverpod
class Juzs extends _$Juzs {
  @override
  Future<List<Juz>> build() async {
    // Load JSON strings for Juz and Ayah data from asset files
    final jsonStrings = await Future.wait([
      rootBundle.loadString('assets/data/juz-list.json'),
      rootBundle.loadString('assets/data/ayah-list.json'),
    ]);

    // Parse JSON strings to create lists of Juz and Ayah objects
    final juzList = await compute(juzFromJson, jsonStrings[0]);
    final ayahList = await compute(ayahFromJson, jsonStrings[1]);

    // Associate each Ayah with its corresponding Juz
    for (var juz in juzList) {
      juz.ayahList = ayahList.where((ayah) => ayah.juzId == juz.id).toList();
    }

    // Keep the provider alive to avoid data reloading
    ref.keepAlive();

    return juzList;
  }
}
