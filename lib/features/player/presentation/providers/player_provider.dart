import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/song.dart';
import '../../domain/entities/repeat_mode.dart';
import 'player_state.dart';
import '../../../../core/services/audio_service.dart';

part 'player_provider.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  late AudioService _audioService;

  @override
  PlayerState build() {
    _audioService = ref.watch(audioServiceProvider);
    
    // Listen to streams
    _audioService.player.positionStream.listen((pos) {
      _updateState(position: pos);
    });

    _audioService.player.durationStream.listen((dur) {
      _updateState(total: dur);
    });

    _audioService.player.playingStream.listen((playing) {
      _updateState(isPlaying: playing);
    });

    _audioService.player.currentIndexStream.listen((index) {
      if (index != null && state is _Playing) {
        final currentState = state as _Playing;
        if (index < currentState.queue.length) {
          state = currentState.copyWith(
            currentSong: currentState.queue[index],
          );
        }
      }
    });

    return const PlayerState.initial();
  }

  void _updateState({
    Duration? position,
    Duration? total,
    bool? isPlaying,
  }) {
    state.mapOrNull(
      playing: (s) {
        state = s.copyWith(
          position: position ?? s.position,
          total: total ?? s.total,
          isPlaying: isPlaying ?? s.isPlaying,
        );
      },
    );
  }

  Future<void> playSong(Song song, {List<Song>? queue}) async {
    state = const PlayerState.loading();
    
    final songQueue = queue ?? [song];
    final sources = songQueue.map((s) => AudioSource.uri(
      Uri.parse(s.audioUrl),
      tag: MediaItem(
        id: s.id,
        album: s.album,
        title: s.title,
        artist: s.artist,
        artUri: Uri.parse(s.thumbnailUrl),
      ),
    )).toList();
    
    await _audioService.setPlaylist(sources);
    
    final initialIndex = songQueue.indexOf(song);
    if (initialIndex != -1) {
      await _audioService.player.seek(Duration.zero, index: initialIndex);
    }
    
    await _audioService.play();
    
    state = PlayerState.playing(
      currentSong: song,
      position: Duration.zero,
      total: song.duration,
      isPlaying: true,
      isShuffling: false,
      repeatMode: RepeatMode.off,
      queue: songQueue,
    );
  }

  Future<void> togglePlayPause() async {
    if (_audioService.player.playing) {
      await _audioService.pause();
    } else {
      await _audioService.play();
    }
  }

  Future<void> seek(Duration position) async {
    await _audioService.seek(position);
  }

  Future<void> skipNext() async {
    await _audioService.skipToNext();
  }

  Future<void> skipPrevious() async {
    await _audioService.skipToPrevious();
  }
}
