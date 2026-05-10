import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/dummy_data.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    final songs = DummyData.songs;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(AppIcons.back, color: AppColors.textPrimary),
        ),
        title: TextField(
          autofocus: false,
          controller: TextEditingController(text: query),
          style: AppTypography.bodyLG,
          decoration: InputDecoration(
            hintText: 'Search songs, artists...',
            hintStyle: AppTypography.bodyLG.copyWith(color: AppColors.textMuted),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.close, color: AppColors.textMuted),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        itemCount: 15,
        itemBuilder: (context, index) {
          final song = songs[index % songs.length];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xs),
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
              '${song.artist} • Song',
              style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary),
            ),
            trailing: const Icon(AppIcons.more, color: AppColors.textMuted, size: 20),
          );
        },
      ),
    );
  }
}
