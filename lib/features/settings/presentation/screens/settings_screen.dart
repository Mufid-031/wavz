import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/router/route_names.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          'Settings',
          style: AppTypography.headingLG,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          _buildSectionHeader('Account'),
          _buildSettingItem(
            icon: AppIcons.profile,
            label: 'Premium Subscription',
            onTap: () => context.push(RouteNames.subscription),
            trailing: const Text(
              'Free Plan',
              style: TextStyle(color: AppColors.primaryEnd),
            ),
          ),
          _buildSettingItem(
            icon: AppIcons.profile,
            label: 'Profile Settings',
            onTap: () {},
          ),
          
          const SizedBox(height: AppSpacing.xl),
          _buildSectionHeader('Playback'),
          _buildSettingItem(
            icon: Icons.graphic_eq_rounded,
            label: 'Equalizer',
            onTap: () => context.push(RouteNames.equalizer),
          ),
          _buildSettingItem(
            icon: Icons.high_quality_rounded,
            label: 'Audio Quality',
            onTap: () {},
            trailing: const Text(
              'Very High',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),
          _buildSectionHeader('About'),
          _buildSettingItem(
            icon: Icons.info_outline_rounded,
            label: 'Privacy Policy',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.description_outlined,
            label: 'Terms of Service',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.info_outline_rounded,
            label: 'Version',
            onTap: null,
            trailing: const Text(
              '1.0.0',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),

          const SizedBox(height: AppSpacing.xl2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'LOGOUT',
                style: TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.sm, AppSpacing.xl, AppSpacing.md),
      child: Text(
        title.toUpperCase(),
        style: AppTypography.bodySM.copyWith(
          color: AppColors.textMuted,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      leading: Icon(icon, color: AppColors.textSecondary, size: 24),
      title: Text(
        label,
        style: AppTypography.labelLG,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) ...[
            trailing,
            const SizedBox(width: AppSpacing.sm),
          ],
          if (onTap != null)
            const Icon(AppIcons.chevronRight, color: AppColors.textMuted, size: 20),
        ],
      ),
    );
  }
}
