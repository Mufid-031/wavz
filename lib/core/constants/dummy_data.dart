import '../../features/player/domain/entities/song.dart';

abstract class DummyData {
  static const songs = [
    Song(
      id: '1',
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      album: 'After Hours',
      thumbnailUrl: 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=500&q=80',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      duration: Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: '2',
      title: 'Levitating',
      artist: 'Dua Lipa',
      album: 'Future Nostalgia',
      thumbnailUrl: 'https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=500&q=80',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
      duration: Duration(minutes: 3, seconds: 23),
    ),
    Song(
      id: '3',
      title: 'Save Your Tears',
      artist: 'The Weeknd',
      album: 'After Hours',
      thumbnailUrl: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500&q=80',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
      duration: Duration(minutes: 3, seconds: 35),
    ),
  ];
}
