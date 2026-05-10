import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/home_repository.dart';
import '../../../player/domain/entities/song.dart';

part 'home_provider.g.dart';

@riverpod
Future<List<Song>> trendingSongs(TrendingSongsRef ref) async {
  final repository = ref.watch(homeRepositoryProvider);
  return repository.getTrendingSongs();
}
