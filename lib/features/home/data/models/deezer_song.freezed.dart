// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deezer_song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeezerSong _$DeezerSongFromJson(Map<String, dynamic> json) {
  return _DeezerSong.fromJson(json);
}

/// @nodoc
mixin _$DeezerSong {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_short')
  String get titleShort => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  DeezerArtist get artist => throw _privateConstructorUsedError;
  DeezerAlbum get album => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeezerSongCopyWith<DeezerSong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeezerSongCopyWith<$Res> {
  factory $DeezerSongCopyWith(
          DeezerSong value, $Res Function(DeezerSong) then) =
      _$DeezerSongCopyWithImpl<$Res, DeezerSong>;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'title_short') String titleShort,
      String link,
      int duration,
      int rank,
      String preview,
      DeezerArtist artist,
      DeezerAlbum album});

  $DeezerArtistCopyWith<$Res> get artist;
  $DeezerAlbumCopyWith<$Res> get album;
}

/// @nodoc
class _$DeezerSongCopyWithImpl<$Res, $Val extends DeezerSong>
    implements $DeezerSongCopyWith<$Res> {
  _$DeezerSongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titleShort = null,
    Object? link = null,
    Object? duration = null,
    Object? rank = null,
    Object? preview = null,
    Object? artist = null,
    Object? album = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleShort: null == titleShort
          ? _value.titleShort
          : titleShort // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as DeezerArtist,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as DeezerAlbum,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeezerArtistCopyWith<$Res> get artist {
    return $DeezerArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeezerAlbumCopyWith<$Res> get album {
    return $DeezerAlbumCopyWith<$Res>(_value.album, (value) {
      return _then(_value.copyWith(album: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeezerSongImplCopyWith<$Res>
    implements $DeezerSongCopyWith<$Res> {
  factory _$$DeezerSongImplCopyWith(
          _$DeezerSongImpl value, $Res Function(_$DeezerSongImpl) then) =
      __$$DeezerSongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'title_short') String titleShort,
      String link,
      int duration,
      int rank,
      String preview,
      DeezerArtist artist,
      DeezerAlbum album});

  @override
  $DeezerArtistCopyWith<$Res> get artist;
  @override
  $DeezerAlbumCopyWith<$Res> get album;
}

/// @nodoc
class __$$DeezerSongImplCopyWithImpl<$Res>
    extends _$DeezerSongCopyWithImpl<$Res, _$DeezerSongImpl>
    implements _$$DeezerSongImplCopyWith<$Res> {
  __$$DeezerSongImplCopyWithImpl(
      _$DeezerSongImpl _value, $Res Function(_$DeezerSongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titleShort = null,
    Object? link = null,
    Object? duration = null,
    Object? rank = null,
    Object? preview = null,
    Object? artist = null,
    Object? album = null,
  }) {
    return _then(_$DeezerSongImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleShort: null == titleShort
          ? _value.titleShort
          : titleShort // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as DeezerArtist,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as DeezerAlbum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeezerSongImpl implements _DeezerSong {
  const _$DeezerSongImpl(
      {required this.id,
      required this.title,
      @JsonKey(name: 'title_short') required this.titleShort,
      required this.link,
      required this.duration,
      required this.rank,
      required this.preview,
      required this.artist,
      required this.album});

  factory _$DeezerSongImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeezerSongImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'title_short')
  final String titleShort;
  @override
  final String link;
  @override
  final int duration;
  @override
  final int rank;
  @override
  final String preview;
  @override
  final DeezerArtist artist;
  @override
  final DeezerAlbum album;

  @override
  String toString() {
    return 'DeezerSong(id: $id, title: $title, titleShort: $titleShort, link: $link, duration: $duration, rank: $rank, preview: $preview, artist: $artist, album: $album)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeezerSongImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleShort, titleShort) ||
                other.titleShort == titleShort) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.album, album) || other.album == album));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, titleShort, link,
      duration, rank, preview, artist, album);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeezerSongImplCopyWith<_$DeezerSongImpl> get copyWith =>
      __$$DeezerSongImplCopyWithImpl<_$DeezerSongImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeezerSongImplToJson(
      this,
    );
  }
}

abstract class _DeezerSong implements DeezerSong {
  const factory _DeezerSong(
      {required final int id,
      required final String title,
      @JsonKey(name: 'title_short') required final String titleShort,
      required final String link,
      required final int duration,
      required final int rank,
      required final String preview,
      required final DeezerArtist artist,
      required final DeezerAlbum album}) = _$DeezerSongImpl;

  factory _DeezerSong.fromJson(Map<String, dynamic> json) =
      _$DeezerSongImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'title_short')
  String get titleShort;
  @override
  String get link;
  @override
  int get duration;
  @override
  int get rank;
  @override
  String get preview;
  @override
  DeezerArtist get artist;
  @override
  DeezerAlbum get album;
  @override
  @JsonKey(ignore: true)
  _$$DeezerSongImplCopyWith<_$DeezerSongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeezerArtist _$DeezerArtistFromJson(Map<String, dynamic> json) {
  return _DeezerArtist.fromJson(json);
}

/// @nodoc
mixin _$DeezerArtist {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_medium')
  String get pictureMedium => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeezerArtistCopyWith<DeezerArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeezerArtistCopyWith<$Res> {
  factory $DeezerArtistCopyWith(
          DeezerArtist value, $Res Function(DeezerArtist) then) =
      _$DeezerArtistCopyWithImpl<$Res, DeezerArtist>;
  @useResult
  $Res call(
      {int id,
      String name,
      String picture,
      @JsonKey(name: 'picture_medium') String pictureMedium});
}

/// @nodoc
class _$DeezerArtistCopyWithImpl<$Res, $Val extends DeezerArtist>
    implements $DeezerArtistCopyWith<$Res> {
  _$DeezerArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? picture = null,
    Object? pictureMedium = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      pictureMedium: null == pictureMedium
          ? _value.pictureMedium
          : pictureMedium // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeezerArtistImplCopyWith<$Res>
    implements $DeezerArtistCopyWith<$Res> {
  factory _$$DeezerArtistImplCopyWith(
          _$DeezerArtistImpl value, $Res Function(_$DeezerArtistImpl) then) =
      __$$DeezerArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String picture,
      @JsonKey(name: 'picture_medium') String pictureMedium});
}

/// @nodoc
class __$$DeezerArtistImplCopyWithImpl<$Res>
    extends _$DeezerArtistCopyWithImpl<$Res, _$DeezerArtistImpl>
    implements _$$DeezerArtistImplCopyWith<$Res> {
  __$$DeezerArtistImplCopyWithImpl(
      _$DeezerArtistImpl _value, $Res Function(_$DeezerArtistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? picture = null,
    Object? pictureMedium = null,
  }) {
    return _then(_$DeezerArtistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      pictureMedium: null == pictureMedium
          ? _value.pictureMedium
          : pictureMedium // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeezerArtistImpl implements _DeezerArtist {
  const _$DeezerArtistImpl(
      {required this.id,
      required this.name,
      required this.picture,
      @JsonKey(name: 'picture_medium') required this.pictureMedium});

  factory _$DeezerArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeezerArtistImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String picture;
  @override
  @JsonKey(name: 'picture_medium')
  final String pictureMedium;

  @override
  String toString() {
    return 'DeezerArtist(id: $id, name: $name, picture: $picture, pictureMedium: $pictureMedium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeezerArtistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.pictureMedium, pictureMedium) ||
                other.pictureMedium == pictureMedium));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, picture, pictureMedium);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeezerArtistImplCopyWith<_$DeezerArtistImpl> get copyWith =>
      __$$DeezerArtistImplCopyWithImpl<_$DeezerArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeezerArtistImplToJson(
      this,
    );
  }
}

abstract class _DeezerArtist implements DeezerArtist {
  const factory _DeezerArtist(
      {required final int id,
      required final String name,
      required final String picture,
      @JsonKey(name: 'picture_medium')
      required final String pictureMedium}) = _$DeezerArtistImpl;

  factory _DeezerArtist.fromJson(Map<String, dynamic> json) =
      _$DeezerArtistImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get picture;
  @override
  @JsonKey(name: 'picture_medium')
  String get pictureMedium;
  @override
  @JsonKey(ignore: true)
  _$$DeezerArtistImplCopyWith<_$DeezerArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeezerAlbum _$DeezerAlbumFromJson(Map<String, dynamic> json) {
  return _DeezerAlbum.fromJson(json);
}

/// @nodoc
mixin _$DeezerAlbum {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_medium')
  String get coverMedium => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeezerAlbumCopyWith<DeezerAlbum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeezerAlbumCopyWith<$Res> {
  factory $DeezerAlbumCopyWith(
          DeezerAlbum value, $Res Function(DeezerAlbum) then) =
      _$DeezerAlbumCopyWithImpl<$Res, DeezerAlbum>;
  @useResult
  $Res call(
      {int id,
      String title,
      String cover,
      @JsonKey(name: 'cover_medium') String coverMedium});
}

/// @nodoc
class _$DeezerAlbumCopyWithImpl<$Res, $Val extends DeezerAlbum>
    implements $DeezerAlbumCopyWith<$Res> {
  _$DeezerAlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? cover = null,
    Object? coverMedium = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      coverMedium: null == coverMedium
          ? _value.coverMedium
          : coverMedium // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeezerAlbumImplCopyWith<$Res>
    implements $DeezerAlbumCopyWith<$Res> {
  factory _$$DeezerAlbumImplCopyWith(
          _$DeezerAlbumImpl value, $Res Function(_$DeezerAlbumImpl) then) =
      __$$DeezerAlbumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String cover,
      @JsonKey(name: 'cover_medium') String coverMedium});
}

/// @nodoc
class __$$DeezerAlbumImplCopyWithImpl<$Res>
    extends _$DeezerAlbumCopyWithImpl<$Res, _$DeezerAlbumImpl>
    implements _$$DeezerAlbumImplCopyWith<$Res> {
  __$$DeezerAlbumImplCopyWithImpl(
      _$DeezerAlbumImpl _value, $Res Function(_$DeezerAlbumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? cover = null,
    Object? coverMedium = null,
  }) {
    return _then(_$DeezerAlbumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      coverMedium: null == coverMedium
          ? _value.coverMedium
          : coverMedium // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeezerAlbumImpl implements _DeezerAlbum {
  const _$DeezerAlbumImpl(
      {required this.id,
      required this.title,
      required this.cover,
      @JsonKey(name: 'cover_medium') required this.coverMedium});

  factory _$DeezerAlbumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeezerAlbumImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String cover;
  @override
  @JsonKey(name: 'cover_medium')
  final String coverMedium;

  @override
  String toString() {
    return 'DeezerAlbum(id: $id, title: $title, cover: $cover, coverMedium: $coverMedium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeezerAlbumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.coverMedium, coverMedium) ||
                other.coverMedium == coverMedium));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, cover, coverMedium);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeezerAlbumImplCopyWith<_$DeezerAlbumImpl> get copyWith =>
      __$$DeezerAlbumImplCopyWithImpl<_$DeezerAlbumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeezerAlbumImplToJson(
      this,
    );
  }
}

abstract class _DeezerAlbum implements DeezerAlbum {
  const factory _DeezerAlbum(
          {required final int id,
          required final String title,
          required final String cover,
          @JsonKey(name: 'cover_medium') required final String coverMedium}) =
      _$DeezerAlbumImpl;

  factory _DeezerAlbum.fromJson(Map<String, dynamic> json) =
      _$DeezerAlbumImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get cover;
  @override
  @JsonKey(name: 'cover_medium')
  String get coverMedium;
  @override
  @JsonKey(ignore: true)
  _$$DeezerAlbumImplCopyWith<_$DeezerAlbumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
