import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'surahs_provider.g.dart';

@riverpod
class Surahs extends _$Surahs {
  @override
  Future<List<Surah>> build() async {
    // print('Fetching All Surah');
    final database = ref.watch(databaseProvider);

    final List<Surah> surahList = await database.allSurah().get();

    ref.keepAlive();

    return surahList;
  }
}
