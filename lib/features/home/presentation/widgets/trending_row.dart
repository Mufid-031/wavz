import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/dummy_data.dart';
import '../../../player/presentation/providers/player_provider.dart';

class TrendingRow extends ConsumerWidget {
  const TrendingRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = DummyData.songs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Text(
            'Trending Now',
            style: AppTypography.headingMD,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.xl2),
            itemBuilder: (context, index) {
              final song = songs[index];
              return InkWell(
                onTap: () {
                  ref.read(playerNotifierProvider.notifier).playSong(song, queue: songs);
                },
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    // Rank Number
                    Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontFamily: AppTypography.displayFont,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.divider,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    // Song Info
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(song.thumbnailUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.title,
                          style: AppTypography.labelLG,
                        ),
                        Text(
                          song.artist,
                          style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
