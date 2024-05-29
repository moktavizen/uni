import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ayahs_in_juz_provider.g.dart';

@riverpod
class AyahsInJuz extends _$AyahsInJuz {
  @override
  Future<List<Ayah>> build(int juzId) async {
    print('Fetching Ayahs for Juz $juzId');
    final database = ref.watch(databaseProvider);

    List<Ayah> ayahList = await database.ayahsInJuz(juzId).get();

    return ayahList;
  }
}
