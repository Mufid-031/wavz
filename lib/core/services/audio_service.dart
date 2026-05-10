import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_service.g.dart';

class AudioService {
  AudioService() : _player = AudioPlayer();
  final AudioPlayer _player;

  AudioPlayer get player => _player;

  Future<void> dispose() async {
    await _player.dispose();
  }
}

@riverpod
AudioService audioService(AudioServiceRef ref) {
  final service = AudioService();
  ref.onDispose(() => service.dispose());
  return service;
}
