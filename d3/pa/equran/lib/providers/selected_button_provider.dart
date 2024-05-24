import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_button_provider.g.dart';

@riverpod
class SelectedButton extends _$SelectedButton {
  @override
  String build() {
    return '';
  }

  void selectButton({required int buttonId}) {
    state = '$buttonId selected';
  }
}
