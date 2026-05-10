// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongImpl _$$SongImplFromJson(Map<String, dynamic> json) => _$SongImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      audioUrl: json['audioUrl'] as String,
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$$SongImplToJson(_$SongImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'album': instance.album,
      'thumbnailUrl': instance.thumbnailUrl,
      'audioUrl': instance.audioUrl,
      'duration': instance.duration.inMicroseconds,
      'isLiked': instance.isLiked,
    };
