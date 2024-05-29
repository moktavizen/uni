import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_player_provider.g.dart';

@riverpod
class SelectedPlayer extends _$SelectedPlayer {
  @override
  String build() {
    return '';
  }

  void selectButton({required int buttonId}) {
    state = '$buttonId selected';
  }
}
