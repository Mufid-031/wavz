import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../core/router/route_names.dart';
import '../../features/player/presentation/providers/player_provider.dart';
import 'blur_container.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerNotifierProvider);

    return playerState.maybeWhen(
      playing: (song, position, total, isPlaying, isShuffling, repeatMode, queue) {
        return GestureDetector(
          onTap: () => context.push(RouteNames.nowPlaying),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: BlurContainer(
              borderRadius: 16,
              opacity: 0.8,
              blur: 20,
              color: AppColors.surface,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    child: Row(
                      children: [
                        // Art
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceHighest,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(song.thumbnailUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        // Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.title,
                                style: const TextStyle(
                                  fontFamily: AppTypography.bodyFont,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                song.artist,
                                style: const TextStyle(
                                  fontFamily: AppTypography.bodyFont,
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        // Controls
                        IconButton(
                          onPressed: () => ref.read(playerNotifierProvider.notifier).togglePlayPause(),
                          icon: Icon(
                            isPlaying ? AppIcons.pause : AppIcons.play,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        IconButton(
                          onPressed: () => ref.read(playerNotifierProvider.notifier).skipNext(),
                          icon: const Icon(AppIcons.next, color: Colors.white, size: 28),
                        ),
                      ],
                    ),
                  ),
                  // Progress Line
                  Stack(
                    children: [
                      Container(height: 2, color: AppColors.divider),
                      FractionallySizedBox(
                        widthFactor: total.inSeconds > 0 
                            ? position.inSeconds / total.inSeconds 
                            : 0.0,
                        child: Container(
                          height: 2,
                          decoration: const BoxDecoration(
                            gradient: AppColors.primaryGradient,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
