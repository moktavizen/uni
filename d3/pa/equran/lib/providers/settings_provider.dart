import 'package:equran/databases/database.dart' as d;
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@riverpod
class Setting extends _$Setting {
  @override
  Stream<d.Setting> build() {
    final database = ref.watch(databaseProvider);

    final setting = database.getSetting().watchSingle();

    ref.keepAlive();
    return setting;
  }
}
