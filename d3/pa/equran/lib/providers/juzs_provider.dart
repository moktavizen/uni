import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'juzs_provider.g.dart';

@riverpod
class Juzs extends _$Juzs {
  @override
  Future<List<Juz>> build() async {
    // print('Fetching All Juz');
    final database = ref.watch(databaseProvider);

    final List<Juz> juzList = await database.allJuz().get();

    ref.keepAlive();

    return juzList;
  }
}
