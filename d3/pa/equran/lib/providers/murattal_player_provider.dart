import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'murattal_player_provider.g.dart';

@riverpod
class MurattalPlayer extends _$MurattalPlayer {
  @override
  AudioPlayer build() {
    print('Creating AudioPlayer');
    return AudioPlayer();
  }
}

