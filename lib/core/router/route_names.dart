abstract class RouteNames {
  static const String splash            = '/';
  static const String onboarding        = '/onboarding';
  static const String login             = '/login';
  static const String register          = '/register';
  static const String preferencePicker  = '/preference-picker';
  
  // Shell routes
  static const String home              = '/home';
  static const String search            = '/search';
  static const String searchResults     = '/search/results';
  static const String library           = '/library';
  static const String profile           = '/profile';
  
  // Player
  static const String nowPlaying        = '/player';
  static const String lyrics            = '/player/lyrics';
  static const String queue             = '/player/queue';
  
  // Details
  static const String playlistDetail    = '/playlist/:id';
  static const String albumDetail       = '/album/:id';
  static const String artistProfile     = '/artist/:id';
  static const String createPlaylist    = '/playlist/create';
  
  // Settings
  static const String settings          = '/settings';
  static const String equalizer         = '/settings/equalizer';
  static const String subscription      = '/settings/subscription';
  static const String notifications     = '/notifications';
}
