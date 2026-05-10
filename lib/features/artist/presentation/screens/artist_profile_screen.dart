import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/dummy_data.dart';

class ArtistProfileScreen extends StatelessWidget {
  const ArtistProfileScreen({
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
          // Hero Header
          SliverAppBar(
            expandedHeight: 400,
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
                    'https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?w=800&q=80',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.background.withOpacity(0.5),
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
                        Row(
                          children: [
                            const Text(
                              'The Weeknd',
                              style: AppTypography.displayLG,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            const Icon(AppIcons.verified, color: AppColors.info, size: 24),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          '75,234,120 monthly listeners',
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
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
              child: Row(
                children: [
                  _buildFollowButton(),
                  const SizedBox(width: AppSpacing.md),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(AppIcons.bell, color: AppColors.textSecondary),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(AppIcons.shuffle, color: AppColors.textSecondary),
                  ),
                  _buildPlayButton(),
                ],
              ),
            ),
          ),

          // Popular Songs
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.lg, AppSpacing.xl, AppSpacing.md),
              child: Text(
                'Popular Songs',
                style: AppTypography.headingMD,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final song = songs[index % songs.length];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  leading: Text(
                    '${index + 1}',
                    style: AppTypography.bodyMD.copyWith(color: AppColors.textMuted),
                  ),
                  title: Text(
                    song.title,
                    style: AppTypography.labelLG,
                  ),
                  subtitle: Text(
                    '1,234,567,890',
                    style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary),
                  ),
                  trailing: const Icon(AppIcons.more, color: AppColors.textMuted, size: 20),
                );
              },
              childCount: 5,
            ),
          ),

          // Albums Section
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.xl2, AppSpacing.xl, AppSpacing.md),
              child: Text(
                'Albums',
                style: AppTypography.headingMD,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 220,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.lg),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&q=80',
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      const Text(
                        'Album Title',
                        style: AppTypography.labelLG,
                      ),
                      Text(
                        '2024 • Album',
                        style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          
          const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
        ],
      ),
    );
  }

  Widget _buildFollowButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: Border.all(color: AppColors.divider),
      ),
      child: Text(
        'Follow',
        style: AppTypography.button.copyWith(fontSize: 14),
      ),
    );
  }

  Widget _buildPlayButton() {
    return Container(
      height: 56,
      width: 56,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
      ),
      child: const Icon(AppIcons.play, color: Colors.white, size: 32),
    );
  }
}
