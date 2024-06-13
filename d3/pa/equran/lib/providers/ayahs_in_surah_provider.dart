import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ayahs_in_surah_provider.g.dart';

@riverpod
class AyahsInSurah extends _$AyahsInSurah {
  @override
  Stream<List<Ayah>> build(int surahId) {
    // print('Fetching Ayahs for Surah $surahId');
    final database = ref.watch(databaseProvider);

    final ayahList = database.ayahsInSurah(surahId).watch();

    return ayahList;
  }
}
