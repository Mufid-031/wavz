import 'package:freezed_annotation/freezed_annotation.dart';

part 'deezer_song.freezed.dart';
part 'deezer_song.g.dart';

@freezed
class DeezerSong with _$DeezerSong {
  const factory DeezerSong({
    required int id,
    required String title,
    @JsonKey(name: 'title_short') required String titleShort,
    required String link,
    required int duration,
    required int rank,
    required String preview,
    required DeezerArtist artist,
    required DeezerAlbum album,
  }) = _DeezerSong;

  factory DeezerSong.fromJson(Map<String, dynamic> json) => _$DeezerSongFromJson(json);
}

@freezed
class DeezerArtist with _$DeezerArtist {
  const factory DeezerArtist({
    required int id,
    required String name,
    required String picture,
    @JsonKey(name: 'picture_medium') required String pictureMedium,
  }) = _DeezerArtist;

  factory DeezerArtist.fromJson(Map<String, dynamic> json) => _$DeezerArtistFromJson(json);
}

@freezed
class DeezerAlbum with _$DeezerAlbum {
  const factory DeezerAlbum({
    required int id,
    required String title,
    required String cover,
    @JsonKey(name: 'cover_medium') required String coverMedium,
  }) = _DeezerAlbum;

  factory DeezerAlbum.fromJson(Map<String, dynamic> json) => _$DeezerAlbumFromJson(json);
}
