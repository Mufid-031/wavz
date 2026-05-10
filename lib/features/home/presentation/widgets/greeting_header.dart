import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getGreeting(),
                style: AppTypography.bodyMD.copyWith(color: AppColors.textSecondary),
              ),
              Text(
                userName,
                style: AppTypography.headingLG,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(AppIcons.bell, color: AppColors.textSecondary),
        ),
        const SizedBox(width: AppSpacing.sm),
        const CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.surfaceHighest,
          child: Icon(AppIcons.profile, color: AppColors.textMuted, size: 20),
        ),
      ],
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }
}
