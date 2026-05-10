import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/router/route_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => context.push(RouteNames.settings),
            icon: const Icon(AppIcons.settings, color: AppColors.textPrimary),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.xl2),

              // Avatar
              const CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.surfaceHighest,
                child: Icon(AppIcons.profile, size: 60, color: AppColors.textMuted),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Name
              const Text(
                'Mufid',
                style: AppTypography.displayMD,
              ),
              Text(
                '@mufid.wavz',
                style: AppTypography.bodyMD.copyWith(color: AppColors.textSecondary),
              ),

              const SizedBox(height: AppSpacing.xl3),

              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStat('12', 'Playlists'),
                  _buildDivider(),
                  _buildStat('450', 'Followers'),
                  _buildDivider(),
                  _buildStat('210', 'Following'),
                ],
              ),

              const SizedBox(height: AppSpacing.xl6),

              // Settings Section
              const _SettingsSection(),

              const SizedBox(height: AppSpacing.xl4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontFamily: AppTypography.displayFont,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: AppTypography.bodySM.copyWith(color: AppColors.textMuted),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 24,
      width: 1,
      color: AppColors.divider,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Text(
            'SETTINGS',
            style: TextStyle(
              fontFamily: AppTypography.bodyFont,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textMuted,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _SettingItem(
          icon: AppIcons.profile,
          label: 'Edit Profile',
          onTap: () {},
        ),
        _SettingItem(
          icon: AppIcons.bell,
          label: 'Notifications',
          onTap: () => context.push(RouteNames.notifications),
        ),
        _SettingItem(
          icon: Icons.security_rounded,
          label: 'Privacy & Security',
          onTap: () => context.push(RouteNames.settings),
        ),
        _SettingItem(
          icon: Icons.help_outline_rounded,
          label: 'Help & Support',
          onTap: () {},
        ),
        const SizedBox(height: AppSpacing.lg),
        _SettingItem(
          icon: Icons.logout_rounded,
          label: 'Logout',
          labelColor: AppColors.error,
          onTap: () {},
          showChevron: false,
        ),
      ],
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.labelColor = AppColors.textPrimary,
    this.showChevron = true,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color labelColor;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      leading: Icon(icon, color: AppColors.textMuted, size: 22),
      title: Text(
        label,
        style: AppTypography.labelLG.copyWith(color: labelColor),
      ),
      trailing: showChevron
          ? const Icon(AppIcons.chevronRight, color: AppColors.textMuted, size: 18)
          : null,
    );
  }
}
