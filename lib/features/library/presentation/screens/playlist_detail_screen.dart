import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/dummy_data.dart';

class PlaylistDetailScreen extends StatelessWidget {
  const PlaylistDetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final songs = DummyData.songs;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Collapsing Header
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.background,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(AppIcons.back, color: AppColors.textPrimary),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=800&q=80',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.background.withOpacity(0.8),
                          AppColors.background,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: AppSpacing.xl,
                    left: AppSpacing.xl,
                    right: AppSpacing.xl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Epic Road Trip',
                          style: AppTypography.displayMD,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          '24 songs • 1h 45m',
                          style: AppTypography.bodyMD.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Actions Row
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Row(
                children: [
                  _buildActionButton(Icons.shuffle_rounded, 'Shuffle'),
                  const SizedBox(width: AppSpacing.md),
                  _buildActionButton(AppIcons.play, 'Play All', isPrimary: true),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(AppIcons.download, color: AppColors.textSecondary),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(AppIcons.heartOutline, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),

          // Song List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final song = songs[index % songs.length];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      song.thumbnailUrl,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    song.title,
                    style: AppTypography.labelLG,
                  ),
                  subtitle: Text(
                    song.artist,
                    style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary),
                  ),
                  trailing: const Icon(AppIcons.more, color: AppColors.textMuted, size: 20),
                );
              },
              childCount: 20,
            ),
          ),
          
          const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, {bool isPrimary = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        gradient: isPrimary ? AppColors.primaryGradient : null,
        color: isPrimary ? null : AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: isPrimary ? null : Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Text(
            label,
            style: AppTypography.button.copyWith(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
