import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../shared/widgets/song_tile.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Library',
                      style: AppTypography.displayLG,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(AppIcons.add, color: AppColors.textPrimary),
                    ),
                  ],
                ),
              ),

              // Tab Bar
              TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: AppColors.primaryStart,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: const TextStyle(
                  fontFamily: AppTypography.displayFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: AppTypography.bodyFont,
                  fontSize: 14,
                ),
                labelColor: AppColors.textPrimary,
                unselectedLabelColor: AppColors.textMuted,
                tabs: const [
                  Tab(text: 'Playlists'),
                  Tab(text: 'Albums'),
                  Tab(text: 'Artists'),
                  Tab(text: 'Downloads'),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Tab Content
              Expanded(
                child: TabBarView(
                  children: [
                    _buildPlaylistsTab(),
                    const Center(child: Text('Albums Tab')),
                    const Center(child: Text('Artists Tab')),
                    const Center(child: Text('Downloads Tab')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaylistsTab() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // Liked Songs
        ListTile(
          onTap: () {},
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
          leading: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryStart, AppColors.accentPink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(AppIcons.heart, color: Colors.white, size: 28),
          ),
          title: const Text('Liked Songs', style: AppTypography.labelLG),
          subtitle: Text('Pinned · 128 songs', style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary)),
        ),

        // Create Playlist
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.divider, width: 1, style: BorderStyle.none), // Placeholder for dashed
              color: AppColors.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(AppIcons.add, color: AppColors.primaryStart, size: 20),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Create New Playlist',
                  style: AppTypography.labelLG.copyWith(color: AppColors.primaryStart),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // List of Playlists
        ...List.generate(
          5,
          (index) => SongTile(
            title: 'Playlist #$index',
            artist: 'Playlist · 24 songs',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
