import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'murattal_provider.g.dart';

@riverpod
class Murattal extends _$Murattal {
  @override
  AudioPlayer build() {
    final player = AudioPlayer();

    return player;
  }
}
