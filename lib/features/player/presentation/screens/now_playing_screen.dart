import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/duration_formatter.dart';
import '../providers/player_provider.dart';

class NowPlayingScreen extends ConsumerWidget {
  const NowPlayingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerNotifierProvider);
    final playerNotifier = ref.read(playerNotifierProvider.notifier);

    return playerState.when(
      initial: () => const Scaffold(body: Center(child: Text('No song playing'))),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (message) => Scaffold(body: Center(child: Text('Error: $message'))),
      playing: (song, position, total, isPlaying, isShuffling, repeatMode, queue) {
        final dominantColor = AppColors.primaryStart; // TODO: Use PaletteGenerator

        return Scaffold(
          backgroundColor: AppColors.background,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  dominantColor.withOpacity(0.15),
                  AppColors.background,
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: Column(
                  children: [
                    // Top Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(AppIcons.chevronDown, color: AppColors.textPrimary),
                        ),
                        Column(
                          children: [
                            Text(
                              'PLAYING FROM',
                              style: AppTypography.bodySM.copyWith(color: AppColors.textMuted, letterSpacing: 1.5),
                            ),
                            Text(
                              song.album,
                              style: AppTypography.labelLG,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(AppIcons.more, color: AppColors.textPrimary),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Album Art
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: dominantColor.withOpacity(0.6),
                            blurRadius: 60,
                            spreadRadius: -10,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(song.thumbnailUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Song Info
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.title,
                                style: AppTypography.displayMD,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                song.artist,
                                style: AppTypography.bodyLG.copyWith(color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            song.isLiked ? AppIcons.heart : AppIcons.heartOutline,
                            color: song.isLiked ? AppColors.liked : AppColors.textSecondary,
                            size: 28,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.xl2),

                    // Progress Bar
                    Column(
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 4,
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                            activeTrackColor: AppColors.primaryStart,
                            inactiveTrackColor: AppColors.surfaceHighest,
                            thumbColor: Colors.white,
                          ),
                          child: Slider(
                            value: position.inSeconds.toDouble(),
                            max: total.inSeconds.toDouble(),
                            onChanged: (value) {
                              playerNotifier.seek(Duration(seconds: value.toInt()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DurationFormatter.format(position),
                                style: AppTypography.bodySM.copyWith(color: AppColors.textMuted),
                              ),
                              Text(
                                DurationFormatter.format(total),
                                style: AppTypography.bodySM.copyWith(color: AppColors.textMuted),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.xl3),

                    // Controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(AppIcons.shuffle, color: AppColors.textMuted, size: 24),
                        IconButton(
                          onPressed: () => playerNotifier.skipPrevious(),
                          icon: const Icon(AppIcons.previous, color: AppColors.textPrimary, size: 32),
                        ),
                        // Play Button
                        GestureDetector(
                          onTap: () => playerNotifier.togglePlayPause(),
                          child: Container(
                            height: 72,
                            width: 72,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppColors.primaryGradient,
                            ),
                            child: Icon(
                              isPlaying ? AppIcons.pause : AppIcons.play,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => playerNotifier.skipNext(),
                          icon: const Icon(AppIcons.next, color: AppColors.textPrimary, size: 32),
                        ),
                        const Icon(AppIcons.repeat, color: AppColors.textMuted, size: 24),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.xl5),

                    // Bottom Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBottomAction(AppIcons.lyrics, 'Lyrics'),
                        _buildBottomAction(AppIcons.queue, 'Queue'),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomAction(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: AppColors.textSecondary, size: 20),
        const SizedBox(width: AppSpacing.xs),
        Text(
          label,
          style: AppTypography.labelSM.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
