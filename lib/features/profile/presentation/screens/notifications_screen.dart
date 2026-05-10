import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Notifications',
          style: AppTypography.headingLG,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.sm,
            ),
            leading: Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
              ),
              child: const Icon(
                AppIcons.bell,
                color: Colors.white,
                size: 24,
              ),
            ),
            title: Text(
              'New Release: Album Title',
              style: AppTypography.labelLG,
            ),
            subtitle: Text(
              'Artist Name has just released a new album. Check it out now!',
              style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary),
            ),
            trailing: Text(
              '2h ago',
              style: AppTypography.bodySM.copyWith(color: AppColors.textMuted),
            ),
          );
        },
      ),
    );
  }
}
