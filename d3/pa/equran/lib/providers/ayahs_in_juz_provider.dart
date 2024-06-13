import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ayahs_in_juz_provider.g.dart';

@riverpod
class AyahsInJuz extends _$AyahsInJuz {
  @override
  Stream<List<Ayah>> build(int juzId) {
    // print('Fetching Ayahs for Juz $juzId');
    final database = ref.watch(databaseProvider);

    final ayahList = database.ayahsInJuz(juzId).watch();

    return ayahList;
  }
}
