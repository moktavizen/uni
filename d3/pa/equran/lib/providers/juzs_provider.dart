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
    final jsonStrings = await Future.wait([
      rootBundle.loadString('assets/data/juz-list.json'),
      rootBundle.loadString('assets/data/ayah-list.json'),
    ]);

    final juzList = await compute(juzFromJson, jsonStrings[0]);
    final ayahList = await compute(ayahFromJson, jsonStrings[1]);

    for (var juz in juzList) {
      juz.ayahList = ayahList.where((ayah) => ayah.juz == juz.id).toList();
    }

    return juzList;
  }
}
