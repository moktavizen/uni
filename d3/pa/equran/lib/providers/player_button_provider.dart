import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_button_provider.g.dart';

@riverpod
class PlayerButton extends _$PlayerButton {
  @override
  String build(int buttonId) {
    return '$buttonId stopped';
  }

  playButton() {
    state = '$buttonId playing';
  }

  stopButton() {
    state = '$buttonId stopped';
  }

  pauseButton() {
    state = '$buttonId paused';
  }
}
