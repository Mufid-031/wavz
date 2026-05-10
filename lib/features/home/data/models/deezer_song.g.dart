// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deezer_song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeezerSongImpl _$$DeezerSongImplFromJson(Map<String, dynamic> json) =>
    _$DeezerSongImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      titleShort: json['title_short'] as String,
      link: json['link'] as String,
      duration: (json['duration'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      preview: json['preview'] as String,
      artist: DeezerArtist.fromJson(json['artist'] as Map<String, dynamic>),
      album: DeezerAlbum.fromJson(json['album'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DeezerSongImplToJson(_$DeezerSongImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_short': instance.titleShort,
      'link': instance.link,
      'duration': instance.duration,
      'rank': instance.rank,
      'preview': instance.preview,
      'artist': instance.artist,
      'album': instance.album,
    };

_$DeezerArtistImpl _$$DeezerArtistImplFromJson(Map<String, dynamic> json) =>
    _$DeezerArtistImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      picture: json['picture'] as String,
      pictureMedium: json['picture_medium'] as String,
    );

Map<String, dynamic> _$$DeezerArtistImplToJson(_$DeezerArtistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'picture_medium': instance.pictureMedium,
    };

_$DeezerAlbumImpl _$$DeezerAlbumImplFromJson(Map<String, dynamic> json) =>
    _$DeezerAlbumImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      cover: json['cover'] as String,
      coverMedium: json['cover_medium'] as String,
    );

Map<String, dynamic> _$$DeezerAlbumImplToJson(_$DeezerAlbumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'cover_medium': instance.coverMedium,
    };
