import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/deezer_song.dart';
import '../../../player/domain/entities/song.dart';

part 'home_repository.g.dart';

class HomeRepository {
  HomeRepository(this._dio);
  final Dio _dio;

  Future<List<Song>> getTrendingSongs() async {
    try {
      final response = await _dio.get('${AppConstants.deezerBaseUrl}/chart/0/tracks');
      final List data = response.data['data'];
      
      return data.map((json) {
        final deezerSong = DeezerSong.fromJson(json);
        return Song(
          id: deezerSong.id.toString(),
          title: deezerSong.title,
          artist: deezerSong.artist.name,
          album: deezerSong.album.title,
          thumbnailUrl: deezerSong.album.coverMedium,
          audioUrl: deezerSong.preview,
          duration: Duration(seconds: deezerSong.duration),
        );
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final dio = ref.watch(dioClientProvider);
  return HomeRepository(dio);
}
