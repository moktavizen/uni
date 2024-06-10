import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'last_read_provider.g.dart';

@riverpod
class LastRead extends _$LastRead {
  @override
  Stream<LastReadData> build() {
    final database = ref.watch(databaseProvider);

    final lastRead = database.getLastRead().watchSingle();

    ref.keepAlive();
    return lastRead;
  }
}
