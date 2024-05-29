import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_provider.g.dart';

@riverpod
class Player extends _$Player {
  @override
  AudioPlayer build() {
    print('Creating AudioPlayer');
    return AudioPlayer();
  }
}
