import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/song.dart';
import '../../domain/entities/repeat_mode.dart';

part 'player_state.freezed.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState.initial() = _Initial;
  
  const factory PlayerState.loading() = _Loading;

  const factory PlayerState.playing({
    required Song currentSong,
    required Duration position,
    required Duration total,
    required bool isPlaying,
    required bool isShuffling,
    required RepeatMode repeatMode,
    @Default([]) List<Song> queue,
  }) = _Playing;

  const factory PlayerState.error(String message) = _Error;
}
