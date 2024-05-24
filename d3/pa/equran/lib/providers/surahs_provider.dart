import 'package:equran/models/ayah.dart';
import 'package:equran/models/surah.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'surahs_provider.g.dart';

@riverpod
class Surahs extends _$Surahs {
  @override
  Future<List<Surah>> build() async {
    // Load JSON strings for Surah and Ayah data from asset files
    final jsonStrings = await Future.wait([
      rootBundle.loadString('assets/data/surah-list.json'),
      rootBundle.loadString('assets/data/ayah-list.json'),
    ]);

    // Parse JSON strings to create lists of Surah and Ayah objects
    final surahList = await compute(surahFromJson, jsonStrings[0]);
    final ayahList = await compute(ayahFromJson, jsonStrings[1]);

    // Associate each Ayah with its corresponding Surah
    for (var surah in surahList) {
      surah.ayahList =
          ayahList.where((ayah) => ayah.surahId == surah.id).toList();
    }

    // Keep the provider alive to avoid data reloading
    ref.keepAlive();

    return surahList;
  }
}
