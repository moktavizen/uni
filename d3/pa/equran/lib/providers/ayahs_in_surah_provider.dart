import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ayahs_in_surah_provider.g.dart';

@riverpod
class AyahsInSurah extends _$AyahsInSurah {
  @override
  Future<List<Ayah>> build(int surahId) async {
    // print('Fetching Ayahs for Surah $surahId');
    final database = ref.watch(databaseProvider);

    List<Ayah> ayahList = await database.ayahsInSurah(surahId).get();

    return ayahList;
  }
}
