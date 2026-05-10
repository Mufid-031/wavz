import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.title,
    required this.artist,
    this.imageUrl,
    this.duration,
    this.onTap,
    this.onMoreTap,
  });

  final String title;
  final String artist;
  final String? imageUrl;
  final String? duration;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      leading: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          image: imageUrl != null
              ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
              : null,
        ),
        child: imageUrl == null ? const Icon(Icons.music_note, color: AppColors.textMuted) : null,
      ),
      title: Text(
        title,
        style: AppTypography.labelLG,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        artist,
        style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (duration != null)
            Text(
              duration!,
              style: AppTypography.bodySM.copyWith(color: AppColors.textMuted),
            ),
          IconButton(
            onPressed: onMoreTap,
            icon: const Icon(AppIcons.more, size: 20, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
