import 'package:equran/databases/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@riverpod
class Database extends _$Database {
  @override
  AppDatabase build() {
    // print('Open Database');
    final database = AppDatabase();

    ref.keepAlive();

    return database;
  }
}
