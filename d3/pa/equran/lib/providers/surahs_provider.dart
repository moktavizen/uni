import 'package:equran/models/ayah.dart';
import 'package:equran/models/surah.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'surahs_provider.g.dart';

@Riverpod(keepAlive: true)
class Surahs extends _$Surahs {
  @override
  Future<List<Surah>> build() async {
    final jsonStrings = await Future.wait([
      rootBundle.loadString('assets/data/surah-list.json'),
      rootBundle.loadString('assets/data/ayah-list.json'),
    ]);

    final surahList = await compute(surahFromJson, jsonStrings[0]);
    final ayahList = await compute(ayahFromJson, jsonStrings[1]);

    for (var surah in surahList) {
      surah.ayahList =
          ayahList.where((ayah) => ayah.surahId == surah.id).toList();
    }

    return surahList;
  }
}
