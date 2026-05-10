import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dominantColor = AppColors.primaryStart; // Placeholder

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              dominantColor.withOpacity(0.15),
              AppColors.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: Column(
              children: [
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(AppIcons.chevronDown, color: AppColors.textPrimary),
                    ),
                    Column(
                      children: [
                        Text(
                          'PLAYING FROM',
                          style: AppTypography.bodySM.copyWith(color: AppColors.textMuted, letterSpacing: 1.5),
                        ),
                        const Text(
                          'Discover Weekly',
                          style: AppTypography.labelLG,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(AppIcons.more, color: AppColors.textPrimary),
                    ),
                  ],
                ),

                const Spacer(),

                // Album Art
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: dominantColor.withOpacity(0.6),
                        blurRadius: 60,
                        spreadRadius: -10,
                      ),
                    ],
                    image: const DecorationImage(
                      image: NetworkImage('https://placeholder.com/500x500'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const Spacer(),

                // Song Info
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Blinding Lights',
                            style: AppTypography.displayMD,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'The Weeknd',
                            style: AppTypography.bodyLG.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(AppIcons.heartOutline, color: AppColors.textSecondary, size: 28),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.xl2),

                // Progress Bar
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceHighest,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.4,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1:24', style: AppTypography.bodySM.copyWith(color: AppColors.textMuted)),
                        Text('3:20', style: AppTypography.bodySM.copyWith(color: AppColors.textMuted)),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.xl3),

                // Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(AppIcons.shuffle, color: AppColors.textMuted, size: 24),
                    const Icon(AppIcons.previous, color: AppColors.textPrimary, size: 32),
                    // Play Button
                    Container(
                      height: 72,
                      width: 72,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.primaryGradient,
                      ),
                      child: const Icon(AppIcons.play, color: Colors.white, size: 40),
                    ),
                    const Icon(AppIcons.next, color: AppColors.textPrimary, size: 32),
                    const Icon(AppIcons.repeat, color: AppColors.textMuted, size: 24),
                  ],
                ),

                const SizedBox(height: AppSpacing.xl5),

                // Bottom Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomAction(AppIcons.lyrics, 'Lyrics'),
                    _buildBottomAction(AppIcons.queue, 'Queue'),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomAction(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: AppColors.textSecondary, size: 20),
        const SizedBox(width: AppSpacing.xs),
        Text(
          label,
          style: AppTypography.labelSM.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
