import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

@riverpod
class Favorites extends _$Favorites {
  @override
  Stream<List<Favorite>> build() {
    final database = ref.watch(databaseProvider);

    final favorites = database.allFavorite().watch();

    ref.keepAlive();
    return favorites;
  }
}
