import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'route_names.dart';
import '../../features/onboarding/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/onboarding/presentation/screens/login_screen.dart';
import '../../features/onboarding/presentation/screens/register_screen.dart';
import '../../features/onboarding/presentation/screens/preference_picker_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/search/presentation/screens/search_results_screen.dart';
import '../../features/library/presentation/screens/library_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/player/presentation/screens/now_playing_screen.dart';
import '../../features/player/presentation/screens/lyrics_screen.dart';
import '../../features/player/presentation/screens/queue_screen.dart';
import '../../features/profile/presentation/screens/notifications_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/settings/presentation/screens/equalizer_screen.dart';
import '../../features/settings/presentation/screens/subscription_screen.dart';
import '../../features/library/presentation/screens/playlist_detail_screen.dart';
import '../../features/library/presentation/screens/album_detail_screen.dart';
import '../../features/library/presentation/screens/create_playlist_screen.dart';
import '../../features/artist/presentation/screens/artist_profile_screen.dart';

import '../../shared/widgets/main_shell.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: RouteNames.splash,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: RouteNames.preferencePicker,
        builder: (context, state) => const PreferencePickerScreen(),
      ),
      GoRoute(
        path: RouteNames.nowPlaying,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const NowPlayingScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeOutQuart;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(position: animation.drive(tween), child: child);
            },
          );
        },
      ),
      GoRoute(
        path: RouteNames.lyrics,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LyricsScreen(),
      ),
      GoRoute(
        path: RouteNames.queue,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const QueueScreen(),
      ),
      GoRoute(
        path: RouteNames.notifications,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: RouteNames.settings,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: RouteNames.equalizer,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const EqualizerScreen(),
      ),
      GoRoute(
        path: RouteNames.subscription,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SubscriptionScreen(),
      ),
      GoRoute(
        path: RouteNames.playlistDetail,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => PlaylistDetailScreen(
          id: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: RouteNames.albumDetail,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => AlbumDetailScreen(
          id: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: RouteNames.artistProfile,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => ArtistProfileScreen(
          id: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: RouteNames.createPlaylist,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CreatePlaylistScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: RouteNames.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: RouteNames.search,
            builder: (context, state) => const SearchScreen(),
            routes: [
              GoRoute(
                path: 'results',
                builder: (context, state) => SearchResultsScreen(
                  query: state.uri.queryParameters['q'] ?? '',
                ),
              ),
            ],
          ),
          GoRoute(
            path: RouteNames.library,
            builder: (context, state) => const LibraryScreen(),
          ),
          GoRoute(
            path: RouteNames.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
