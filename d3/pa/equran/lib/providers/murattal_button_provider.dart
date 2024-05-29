import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'murattal_button_provider.g.dart';

@riverpod
class MurattalButton extends _$MurattalButton {
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
