# GEMINI.md — WAVZ Music App
> Panduan lengkap untuk Gemini CLI dalam membangun aplikasi musik **WAVZ** menggunakan Flutter.
> File ini adalah sumber kebenaran tunggal. Selalu rujuk file ini sebelum menulis kode apapun.

---

## 🎯 Project Overview

| Field | Value |
|---|---|
| **App Name** | WAVZ |
| **Tagline** | Feel Every Beat |
| **Platform** | iOS & Android (Flutter cross-platform) |
| **Framework** | Flutter (Dart) |
| **Min SDK** | Android 21 / iOS 14 |
| **Target** | Gen Z & Millennials (18–30 tahun) |
| **Design Style** | Dark UI · Glassmorphism · Gradient Accents |
| **State Management** | Riverpod |
| **Architecture** | Clean Architecture (Feature-first) |

---

## 🧠 Gemini CLI — Instruksi Perilaku

### Aturan Dasar
- **SELALU** baca file ini terlebih dahulu sebelum menghasilkan kode apapun.
- **JANGAN** membuat keputusan arsitektur yang bertentangan dengan yang ada di file ini tanpa konfirmasi eksplisit.
- **JANGAN** mengganti package yang sudah ditetapkan di bawah dengan alternatif lain tanpa alasan kuat.
- **SELALU** tulis kode dalam **Bahasa Inggris** (nama variabel, komentar, nama fungsi).
- **SELALU** berikan komentar singkat pada setiap fungsi publik dan widget utama.
- **JANGAN** pernah hardcode string yang tampil ke user — gunakan konstanta di `lib/core/constants/`.
- Ketika membuat file baru, **SELALU** ikuti struktur folder yang sudah ditetapkan.
- Ketika ada ambiguitas, **TANYA** sebelum mengimplementasikan asumsi.

### Cara Gemini Menulis Kode
- Utamakan **keterbacaan** di atas keringkasan.
- Gunakan **named parameters** untuk widget dengan lebih dari 2 argumen.
- Pisahkan widget besar menjadi **widget kecil** (max ~100 baris per widget).
- Setiap fitur harus **self-contained** di dalam foldernya sendiri.
- Hindari logika bisnis di dalam widget — delegasikan ke provider/notifier.

### Aturan Akhir Sesi
Setiap kali menyelesaikan satu langkah dari Development Flow:
1. Update checklist di section "Development Progress" — centang item yang selesai
2. Isi "Terakhir dikerjakan" dengan nama step yang baru selesai
3. Isi "Tanggal" dengan tanggal hari ini
4. Jalankan: git add . && git commit -m "feat: [nama step yang selesai]"
5. Tulis ringkasan singkat di "Catatan Penting" jika ada keputusan teknis baru

Lakukan ini TANPA perlu diminta. Ini wajib setelah setiap step selesai.

---

## 📁 Struktur Project

```
wavz/
├── android/
├── ios/
├── assets/
│   ├── fonts/
│   │   ├── ClashDisplay/
│   │   └── Satoshi/
│   ├── icons/
│   ├── images/
│   │   ├── onboarding/
│   │   └── placeholders/
│   └── animations/          # Lottie JSON files
│
├── lib/
│   ├── main.dart
│   ├── app.dart              # MaterialApp / root widget
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_typography.dart
│   │   │   ├── app_spacing.dart
│   │   │   ├── app_strings.dart
│   │   │   ├── app_durations.dart
│   │   │   └── app_icons.dart
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   └── app_theme_extensions.dart
│   │   ├── router/
│   │   │   ├── app_router.dart       # GoRouter config
│   │   │   └── route_names.dart
│   │   ├── utils/
│   │   │   ├── duration_formatter.dart
│   │   │   ├── image_helper.dart
│   │   │   └── extensions/
│   │   │       ├── context_extensions.dart
│   │   │       ├── string_extensions.dart
│   │   │       └── num_extensions.dart
│   │   ├── errors/
│   │   │   ├── app_exception.dart
│   │   │   └── failure.dart
│   │   ├── network/
│   │   │   ├── dio_client.dart
│   │   │   └── interceptors/
│   │   └── services/
│   │       ├── audio_service.dart
│   │       ├── storage_service.dart
│   │       └── connectivity_service.dart
│   │
│   ├── shared/
│   │   ├── widgets/
│   │   │   ├── wavz_button.dart
│   │   │   ├── wavz_text_field.dart
│   │   │   ├── wavz_card.dart
│   │   │   ├── wavz_bottom_sheet.dart
│   │   │   ├── wavz_snackbar.dart
│   │   │   ├── wavz_skeleton.dart
│   │   │   ├── gradient_text.dart
│   │   │   ├── blur_container.dart
│   │   │   ├── animated_album_art.dart
│   │   │   ├── song_tile.dart
│   │   │   ├── album_card.dart
│   │   │   ├── artist_chip.dart
│   │   │   ├── genre_tile.dart
│   │   │   ├── mini_player.dart
│   │   │   └── empty_state.dart
│   │   └── providers/
│   │       ├── theme_provider.dart
│   │       └── connectivity_provider.dart
│   │
│   └── features/
│       ├── onboarding/
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       │       ├── screens/
│       │       │   ├── splash_screen.dart
│       │       │   ├── onboarding_screen.dart
│       │       │   ├── login_screen.dart
│       │       │   ├── register_screen.dart
│       │       │   └── preference_picker_screen.dart
│       │       ├── widgets/
│       │       └── providers/
│       │
│       ├── home/
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       │       ├── screens/
│       │       │   └── home_screen.dart
│       │       ├── widgets/
│       │       │   ├── greeting_header.dart
│       │       │   ├── recently_played_row.dart
│       │       │   ├── featured_card.dart
│       │       │   ├── trending_row.dart
│       │       │   ├── new_releases_grid.dart
│       │       │   └── daily_mix_chips.dart
│       │       └── providers/
│       │           └── home_provider.dart
│       │
│       ├── search/
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       │       ├── screens/
│       │       │   ├── search_screen.dart
│       │       │   └── search_results_screen.dart
│       │       ├── widgets/
│       │       └── providers/
│       │
│       ├── player/
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       │       ├── screens/
│       │       │   ├── now_playing_screen.dart
│       │       │   ├── lyrics_screen.dart
│       │       │   └── queue_screen.dart
│       │       ├── widgets/
│       │       │   ├── album_art_display.dart
│       │       │   ├── player_controls.dart
│       │       │   ├── progress_bar_widget.dart
│       │       │   └── player_action_buttons.dart
│       │       └── providers/
│       │           └── player_provider.dart
│       │
│       ├── library/
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       │       ├── screens/
│       │       │   ├── library_screen.dart
│       │       │   ├── playlist_detail_screen.dart
│       │       │   ├── album_detail_screen.dart
│       │       │   └── create_playlist_screen.dart
│       │       ├── widgets/
│       │       └── providers/
│       │
│       ├── artist/
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       │       ├── screens/
│       │       │   └── artist_profile_screen.dart
│       │       ├── widgets/
│       │       └── providers/
│       │
│       ├── profile/
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       │       ├── screens/
│       │       │   ├── profile_screen.dart
│       │       │   └── notifications_screen.dart
│       │       ├── widgets/
│       │       └── providers/
│       │
│       └── settings/
│           ├── data/
│           ├── domain/
│           └── presentation/
│               ├── screens/
│               │   ├── settings_screen.dart
│               │   ├── equalizer_screen.dart
│               │   └── subscription_screen.dart
│               ├── widgets/
│               └── providers/
│
├── test/
│   ├── unit/
│   ├── widget/
│   └── integration/
│
├── pubspec.yaml
├── analysis_options.yaml
└── GEMINI.md                 # <- file ini
```

---

## 📦 Dependencies (pubspec.yaml)

```yaml
name: wavz
description: WAVZ - Feel Every Beat. A premium music streaming experience.
version: 1.0.0+1

environment:
  sdk: '>=3.3.0 <4.0.0'
  flutter: '>=3.22.0'

dependencies:
  flutter:
    sdk: flutter

  # === STATE MANAGEMENT ===
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

  # === NAVIGATION ===
  go_router: ^14.2.0

  # === AUDIO ===
  just_audio: ^0.9.39
  just_audio_background: ^0.0.1-beta.11
  audio_service: ^0.18.13
  audio_session: ^0.1.21

  # === NETWORK ===
  dio: ^5.5.0+1
  retrofit: ^4.2.0

  # === LOCAL STORAGE ===
  hive_flutter: ^1.1.0
  flutter_secure_storage: ^9.2.2
  shared_preferences: ^2.3.1

  # === UI & ANIMATION ===
  lottie: ^3.1.2
  shimmer: ^3.0.0
  flutter_animate: ^4.5.0
  cached_network_image: ^3.3.1
  palette_generator: ^0.3.3+3   # Generate color from album art
  blur: ^4.0.0
  glassmorphism: ^3.0.0

  # === MEDIA ===
  image_picker: ^1.1.2
  permission_handler: ^11.3.1

  # === UTILITIES ===
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  intl: ^0.19.0
  uuid: ^4.4.2
  connectivity_plus: ^6.0.3
  url_launcher: ^6.3.0
  share_plus: ^10.0.0
  flutter_svg: ^2.0.10+1

  # === AUTH ===
  google_sign_in: ^6.2.1
  sign_in_with_apple: ^6.1.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  build_runner: ^2.4.11
  freezed: ^2.5.2
  json_serializable: ^6.8.0
  riverpod_generator: ^2.4.0
  retrofit_generator: ^8.2.1
  hive_generator: ^2.0.1
  custom_lint: ^0.6.5
  riverpod_lint: ^2.3.10
  mockito: ^5.4.4

flutter:
  uses-material-design: true

  assets:
    - assets/fonts/
    - assets/icons/
    - assets/images/
    - assets/animations/

  fonts:
    - family: ClashDisplay
      fonts:
        - asset: assets/fonts/ClashDisplay/ClashDisplay-Regular.otf
        - asset: assets/fonts/ClashDisplay/ClashDisplay-Medium.otf
          weight: 500
        - asset: assets/fonts/ClashDisplay/ClashDisplay-Semibold.otf
          weight: 600
        - asset: assets/fonts/ClashDisplay/ClashDisplay-Bold.otf
          weight: 700
    - family: Satoshi
      fonts:
        - asset: assets/fonts/Satoshi/Satoshi-Regular.otf
        - asset: assets/fonts/Satoshi/Satoshi-Medium.otf
          weight: 500
        - asset: assets/fonts/Satoshi/Satoshi-Bold.otf
          weight: 700
```

---

## 🎨 Design System

### Color Palette (`lib/core/constants/app_colors.dart`)

```dart
import 'package:flutter/material.dart';

abstract class AppColors {
  // === BACKGROUNDS ===
  static const Color background      = Color(0xFF0A0A0F);
  static const Color surface         = Color(0xFF13131A);
  static const Color surfaceElevated = Color(0xFF1C1C26);
  static const Color surfaceHighest  = Color(0xFF252532);

  // === BRAND GRADIENTS ===
  static const Color primaryStart    = Color(0xFF7C3AED); // Electric Purple
  static const Color primaryEnd      = Color(0xFF06B6D4); // Neon Cyan
  static const Color accentPink      = Color(0xFFEC4899);
  static const Color accentOrange    = Color(0xFFF97316);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryStart, primaryEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1E1A2E), Color(0xFF0F1A2E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // === TEXT ===
  static const Color textPrimary     = Color(0xFFFFFFFF);
  static const Color textSecondary   = Color(0xFFAAAAAA);
  static const Color textMuted       = Color(0xFF666680);

  // === STATUS ===
  static const Color success         = Color(0xFF22C55E);
  static const Color warning         = Color(0xFFF59E0B);
  static const Color error           = Color(0xFFEF4444);
  static const Color info            = Color(0xFF3B82F6);

  // === MISC ===
  static const Color divider         = Color(0xFF1F1F2E);
  static const Color shimmerBase     = Color(0xFF1C1C2E);
  static const Color shimmerHighlight = Color(0xFF2A2A3E);

  // === SEMANTIC ===
  static const Color liked           = Color(0xFFEC4899);
  static const Color downloaded      = Color(0xFF22C55E);
}
```

### Typography (`lib/core/constants/app_typography.dart`)

```dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTypography {
  static const String displayFont = 'ClashDisplay';
  static const String bodyFont    = 'Satoshi';

  // === DISPLAY (ClashDisplay) ===
  static const TextStyle displayXL = TextStyle(
    fontFamily: displayFont, fontSize: 40,
    fontWeight: FontWeight.w700, color: AppColors.textPrimary,
    letterSpacing: -1.5,
  );

  static const TextStyle displayLG = TextStyle(
    fontFamily: displayFont, fontSize: 32,
    fontWeight: FontWeight.w700, color: AppColors.textPrimary,
    letterSpacing: -1.0,
  );

  static const TextStyle displayMD = TextStyle(
    fontFamily: displayFont, fontSize: 24,
    fontWeight: FontWeight.w600, color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  // === HEADINGS (ClashDisplay) ===
  static const TextStyle headingLG = TextStyle(
    fontFamily: displayFont, fontSize: 20,
    fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );

  static const TextStyle headingMD = TextStyle(
    fontFamily: displayFont, fontSize: 18,
    fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );

  static const TextStyle headingSM = TextStyle(
    fontFamily: displayFont, fontSize: 16,
    fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );

  // === BODY (Satoshi) ===
  static const TextStyle bodyLG = TextStyle(
    fontFamily: bodyFont, fontSize: 16,
    fontWeight: FontWeight.w400, color: AppColors.textPrimary,
  );

  static const TextStyle bodyMD = TextStyle(
    fontFamily: bodyFont, fontSize: 14,
    fontWeight: FontWeight.w400, color: AppColors.textSecondary,
  );

  static const TextStyle bodySM = TextStyle(
    fontFamily: bodyFont, fontSize: 12,
    fontWeight: FontWeight.w400, color: AppColors.textMuted,
  );

  // === LABELS (Satoshi Medium) ===
  static const TextStyle labelLG = TextStyle(
    fontFamily: bodyFont, fontSize: 14,
    fontWeight: FontWeight.w500, color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );

  static const TextStyle labelSM = TextStyle(
    fontFamily: bodyFont, fontSize: 12,
    fontWeight: FontWeight.w500, color: AppColors.textSecondary,
    letterSpacing: 0.2,
  );

  // === BUTTON ===
  static const TextStyle button = TextStyle(
    fontFamily: displayFont, fontSize: 15,
    fontWeight: FontWeight.w600, color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );
}
```

### Spacing (`lib/core/constants/app_spacing.dart`)

```dart
abstract class AppSpacing {
  // 8px base grid
  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 12.0;
  static const double lg  = 16.0;
  static const double xl  = 20.0;
  static const double xl2 = 24.0;
  static const double xl3 = 32.0;
  static const double xl4 = 40.0;
  static const double xl5 = 48.0;
  static const double xl6 = 64.0;

  // Border radius
  static const double radiusSM  = 8.0;
  static const double radiusMD  = 12.0;
  static const double radiusLG  = 16.0;
  static const double radiusXL  = 20.0;
  static const double radiusXXL = 24.0;
  static const double radiusFull = 999.0;

  // Screen padding
  static const double screenH = 20.0;  // horizontal
  static const double screenV = 16.0;  // vertical
}
```

### Animation Durations (`lib/core/constants/app_durations.dart`)

```dart
abstract class AppDurations {
  static const Duration instant  = Duration(milliseconds: 100);
  static const Duration fast     = Duration(milliseconds: 200);
  static const Duration normal   = Duration(milliseconds: 300);
  static const Duration slow     = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);
  static const Duration page     = Duration(milliseconds: 350);

  static const Duration splashDelay   = Duration(seconds: 2);
  static const Duration albumArtBloom = Duration(milliseconds: 600);
}
```

---

## 🏗️ Arsitektur (Clean Architecture)

Setiap feature mengikuti tiga layer berikut:

```
feature/
├── data/
│   ├── datasources/         # Remote (API) & Local (Hive/SharedPrefs)
│   ├── models/              # DTO / JSON models (dengan @JsonSerializable)
│   └── repositories/        # Implementasi dari domain/repositories
│
├── domain/
│   ├── entities/            # Pure Dart class (tanpa Flutter dependency)
│   ├── repositories/        # Abstract interfaces
│   └── usecases/            # Satu file per use case
│
└── presentation/
    ├── screens/             # Layar utama (tidak ada logika di sini)
    ├── widgets/             # Widget spesifik fitur
    └── providers/           # Riverpod providers & notifiers
```

### Contoh Use Case

```dart
// lib/features/home/domain/usecases/get_recommendations_usecase.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../entities/song.dart';
import '../repositories/home_repository.dart';

part 'get_recommendations_usecase.g.dart';

class GetRecommendationsUseCase {
  const GetRecommendationsUseCase(this._repository);
  final HomeRepository _repository;

  Future<List<Song>> call({required String userId}) {
    return _repository.getRecommendations(userId: userId);
  }
}
```

### Contoh Riverpod Notifier

```dart
// lib/features/player/presentation/providers/player_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/song.dart';

part 'player_provider.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  @override
  PlayerState build() => const PlayerState.initial();

  void play(Song song) {
    // delegate to AudioService
  }

  void togglePlayPause() { ... }
  void seek(Duration position) { ... }
  void skipNext() { ... }
  void skipPrevious() { ... }
}

// === State class (pakai freezed) ===
@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState.initial() = _Initial;
  const factory PlayerState.playing({
    required Song currentSong,
    required Duration position,
    required Duration total,
    required bool isPlaying,
    required bool isShuffling,
    required RepeatMode repeatMode,
  }) = _Playing;
  const factory PlayerState.error(String message) = _Error;
}
```

---

## 📐 Konvensi Penulisan Kode

### Penamaan

| Tipe | Konvensi | Contoh |
|---|---|---|
| File | `snake_case.dart` | `home_screen.dart` |
| Class / Widget | `PascalCase` | `HomeScreen`, `SongTile` |
| Variable / Method | `camelCase` | `currentSong`, `playTrack()` |
| Constant | `camelCase` dalam `abstract class` | `AppColors.background` |
| Provider | `camelCase` + suffix `Provider` | `playerNotifierProvider` |
| State | `PascalCase` + suffix `State` | `PlayerState` |

### Widget Guidelines

```dart
// ✅ BENAR — widget kecil, named params, const di mana memungkinkan
class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    this.onTap,
    this.showIndex = false,
    this.index,
  });

  final Song song;
  final VoidCallback? onTap;
  final bool showIndex;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // ...
    );
  }
}

// ❌ SALAH — logika di dalam build, tidak reusable
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 300 baris kode di sini — JANGAN!
      ],
    );
  }
}
```

### Provider Conventions

```dart
// Selalu gunakan code generation
@riverpod
Future<List<Song>> recentlyPlayed(RecentlyPlayedRef ref) async {
  final repo = ref.watch(homeRepositoryProvider);
  return repo.getRecentlyPlayed();
}

// Gunakan ref.invalidate() untuk refresh, bukan setState
```

### Error Handling

```dart
// Gunakan Either<Failure, T> dari domain layer
// Di presentation layer, tangani dengan .when() atau AsyncValue
ref.watch(songsProvider).when(
  data:    (songs)   => SongListWidget(songs: songs),
  loading: ()        => const SongListSkeleton(),
  error:   (e, st)   => ErrorWidget(error: e.toString()),
);
```

---

## 🎮 Navigasi (GoRouter)

```dart
// lib/core/router/route_names.dart
abstract class RouteNames {
  static const String splash            = '/';
  static const String onboarding        = '/onboarding';
  static const String login             = '/login';
  static const String register          = '/register';
  static const String preferencePicker  = '/preference-picker';
  static const String home              = '/home';
  static const String search            = '/home/search';
  static const String searchResults     = '/home/search/results';
  static const String library           = '/home/library';
  static const String profile           = '/home/profile';
  static const String nowPlaying        = '/player';
  static const String lyrics            = '/player/lyrics';
  static const String queue             = '/player/queue';
  static const String playlistDetail    = '/playlist/:id';
  static const String albumDetail       = '/album/:id';
  static const String artistProfile     = '/artist/:id';
  static const String createPlaylist    = '/playlist/create';
  static const String settings          = '/settings';
  static const String equalizer         = '/settings/equalizer';
  static const String subscription      = '/settings/subscription';
  static const String notifications     = '/notifications';
}
```

- Gunakan `ShellRoute` untuk **Bottom Navigation Bar**
- Now Playing menggunakan **custom page transition** (slide up)
- Semua route dilindungi oleh `redirect` guard yang cek auth state

---

## 🎵 Audio Architecture

```
AudioService (background isolate)
        ↑
just_audio (AudioPlayer)
        ↑
PlayerNotifier (Riverpod)
        ↑
NowPlayingScreen + MiniPlayer
```

- **`audio_service`** → background playback, lock screen controls, notification
- **`just_audio`** → player engine utama
- **`PlayerNotifier`** → single source of truth untuk UI player
- Queue dikelola oleh `ConcatenatingAudioSource` dari `just_audio`
- Notch/Dynamic Island: gunakan `audio_service` metadata untuk lock screen

---

## 🌐 API Layer

### Base URL & Endpoints

```dart
// lib/core/network/dio_client.dart
// Gunakan environment variable untuk base URL

abstract class ApiEndpoints {
  // Auth
  static const String login          = '/auth/login';
  static const String register       = '/auth/register';
  static const String refresh        = '/auth/refresh';

  // Music
  static const String songs          = '/songs';
  static const String trending       = '/songs/trending';
  static const String recommendations = '/songs/recommendations';
  static const String search         = '/search';

  // Artist
  static const String artists        = '/artists';

  // Playlist
  static const String playlists      = '/playlists';

  // User
  static const String profile        = '/user/profile';
  static const String library        = '/user/library';
}
```

### Interceptors yang wajib ada

1. **AuthInterceptor** — inject Bearer token ke setiap request
2. **LoggingInterceptor** — log request/response di debug mode
3. **ErrorInterceptor** — transform error menjadi `AppException`
4. **RetryInterceptor** — retry 3x untuk network error

---

## 🎨 UI Patterns yang Wajib Diikuti

### Glassmorphism Card

```dart
// lib/shared/widgets/blur_container.dart
class BlurContainer extends StatelessWidget {
  const BlurContainer({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.blur = 20,
    this.opacity = 0.15,
  });

  final Widget child;
  final double borderRadius;
  final double blur;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 0.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
```

### Album Art Bloom Effect

```dart
// Tampilkan glow di belakang album art menggunakan PaletteGenerator
// Ambil warna dominan dari cover art, lalu tampilkan sebagai radial gradient blur
Future<void> _extractAndApplyPalette(String imageUrl) async {
  final image = NetworkImage(imageUrl);
  final palette = await PaletteGenerator.fromImageProvider(image);
  final dominant = palette.dominantColor?.color ?? AppColors.primaryStart;
  // Gunakan dominant sebagai glow color
}
```

### Bottom Navigation Bar

```dart
// 4 tab: Home / Search / Library / Profile
// Gunakan NavigationBar (Material 3) dengan custom indicator
// Active item: gradient icon + label
// Inactive item: muted icon, no label
// MiniPlayer tampil DI ATAS bottom nav (Stack)
```

### Skeleton Loading

```dart
// Gunakan shimmer package
// Setiap screen WAJIB punya skeleton variant-nya
// Contoh: HomeScreenSkeleton, PlaylistDetailSkeleton, dll.
```

### Bottom Sheet (3-dot Menu)

```dart
// Song option sheet selalu berisi:
// - Play Next
// - Add to Queue
// - Add to Playlist
// - View Artist
// - View Album
// - Download / Remove Download
// - Share
// - Like / Unlike
```

---

## 🔒 State Management Rules

1. **Global state** (auth, player, theme) → `@riverpod` di `core/`
2. **Feature state** → `@riverpod` di dalam folder feature masing-masing
3. **Local UI state** (animation, tab index) → `StatefulWidget` atau `useState`
4. **JANGAN** gunakan `setState` untuk data yang di-share antar widget
5. Gunakan `ref.listen()` untuk side effects (navigasi, snackbar)
6. Gunakan `ref.read()` hanya di dalam callbacks (onTap, onPressed)
7. Gunakan `ref.watch()` di dalam `build()` method

---

## ✅ Definition of Done (per Screen)

Setiap screen dianggap selesai jika:

- [ ] Layout pixel-perfect sesuai design system
- [ ] Loading state menggunakan skeleton
- [ ] Error state ditampilkan dengan `EmptyState` widget
- [ ] Navigasi masuk & keluar berfungsi dengan benar
- [ ] Data terhubung ke provider (bukan hardcoded)
- [ ] MiniPlayer tetap tampil di atas bottom nav (jika ada lagu playing)
- [ ] Semua touch target minimal 44px
- [ ] Mendukung dark theme (default)
- [ ] Tidak ada overflow / pixel overflow di semua ukuran layar

---

## 🚀 Development Flow

### Urutan Implementasi yang Disarankan

```
Phase 1 — Foundation
  1. Setup project structure + pubspec
  2. Design system (colors, typography, spacing, theme)
  3. Router setup (GoRouter + shell route)
  4. Shared widgets (button, card, text field, skeleton)
  5. Core services (audio, storage, network)

Phase 2 — Auth Flow
  6. Splash screen
  7. Onboarding screens
  8. Login / Register
  9. Preference picker

Phase 3 — Core Features
  10. Home screen
  11. Search screen
  12. Now Playing screen (PRIORITAS TINGGI)
  13. Mini player
  14. Queue screen
  15. Lyrics screen

Phase 4 — Library & Social
  16. Library screen
  17. Playlist detail
  18. Album detail
  19. Artist profile
  20. Create playlist

Phase 5 — Profile & Settings
  21. Profile screen
  22. Notifications
  23. Settings screen
  24. Equalizer
  25. Subscription screen
```

### Git Commit Convention

```
feat: add now playing screen
fix: resolve album art glow performance issue
refactor: extract song tile into shared widget
style: update color tokens to match design spec
chore: add just_audio dependency
test: add unit test for player notifier
```

---

## ⚠️ Hal yang DILARANG

- ❌ Hardcode warna langsung (`Color(0xFF...)`) di widget — gunakan `AppColors`
- ❌ Hardcode string di widget — gunakan `AppStrings`
- ❌ Hardcode spacing angka di widget — gunakan `AppSpacing`
- ❌ Logika bisnis di dalam `build()` method
- ❌ `Navigator.push()` langsung — semua navigasi lewat GoRouter
- ❌ `setState` untuk shared state
- ❌ Widget dengan lebih dari 150 baris tanpa dipecah
- ❌ Import `dart:io` di domain layer
- ❌ Gunakan `print()` — gunakan `debugPrint()` atau logger package
- ❌ Commit kode yang gagal `flutter analyze`

---

## 📊 Development Progress

> Section ini di-update otomatis oleh Gemini setiap selesai satu langkah.
> Baca section ini PERTAMA KALI di setiap sesi baru sebelum melakukan apapun.

### Status Terakhir
- **Terakhir dikerjakan:** Phase 5 — Animasi & Polish (Album Art Bloom & Skeleton Widgets)
- **Tanggal:** Sunday, May 10, 2026
- **Git commit terakhir:** 77b7ec9

### Phase Checklist
- [x] Phase 1 — Setup & Struktur Folder
- [x] Phase 2 — Design System (colors, typography, spacing, theme)
- [x] Phase 2 — Shared Widgets
- [x] Phase 3 — Onboarding & Auth Screens
- [x] Phase 3 — Home Screen
- [x] Phase 3 — Now Playing Screen
- [x] Phase 3 — Mini Player
- [x] Phase 3 — Search Screen
- [x] Phase 3 — Library Screen
- [x] Phase 3 — Artist Profile Screen
- [x] Phase 3 — Playlist & Album Detail
- [x] Phase 4 — Riverpod Providers
- [x] Phase 4 — Audio Service (just_audio)
- [x] Phase 4 — Sambungkan UI ke Provider
- [x] Phase 5 — Animasi & Polish
- [ ] Phase 5 — Edge Cases & Review
- [ ] Phase 5 — Build Final

### Catatan Penting
<!-- Gemini akan isi ini jika ada keputusan teknis penting yang dibuat -->

*GEMINI.md ini adalah living document. Update setiap kali ada perubahan arsitektur signifikan.*
*Last updated: project initialization*
