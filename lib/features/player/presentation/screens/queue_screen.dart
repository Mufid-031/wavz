import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../providers/player_provider.dart';

class QueueScreen extends ConsumerWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(AppIcons.back, color: AppColors.textPrimary),
        ),
        title: const Text(
          'Queue',
          style: AppTypography.headingLG,
        ),
        centerTitle: true,
      ),
      body: playerState.maybeWhen(
        playing: (song, position, total, isPlaying, isShuffling, repeatMode, queue) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            itemCount: queue.length,
            itemBuilder: (context, index) {
              final s = queue[index];
              final isCurrent = s.id == song.id;

              return ListTile(
                onTap: () {
                  ref.read(playerNotifierProvider.notifier).skipToQueueIndex(index);
                },
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.xs,
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    s.thumbnailUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  s.title,
                  style: AppTypography.labelLG.copyWith(
                    color: isCurrent ? AppColors.primaryEnd : AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  s.artist,
                  style: AppTypography.bodySM.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                trailing: isCurrent
                    ? const Icon(
                        AppIcons.play,
                        color: AppColors.primaryEnd,
                        size: 20,
                      )
                    : const Icon(
                        AppIcons.more,
                        color: AppColors.textMuted,
                        size: 20,
                      ),
              );
            },
          );
        },
        orElse: () => const Center(
          child: Text(
            'No songs in queue',
            style: AppTypography.bodyMD,
          ),
        ),
      ),
    );
  }
}
