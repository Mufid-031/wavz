import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../shared/widgets/wavz_button.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.lg),
        child: Column(
          children: [
            const Text(
              'Go Premium',
              style: AppTypography.displayLG,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Enjoy ad-free music, offline playback, and high-quality audio.',
              style: AppTypography.bodyMD.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl4),
            
            _buildPlanCard(
              title: 'Individual',
              price: '\$9.99',
              period: 'month',
              features: [
                'Ad-free music listening',
                'Download 10k songs/device',
                'Pre-release access',
                'High-fidelity audio',
              ],
              isPopular: true,
            ),
            
            const SizedBox(height: AppSpacing.xl2),
            
            _buildPlanCard(
              title: 'Family',
              price: '\$14.99',
              period: 'month',
              features: [
                'Up to 6 accounts',
                'Block explicit music',
                'Ad-free music listening',
                'Download 10k songs/device',
              ],
              isPopular: false,
            ),
            
            const SizedBox(height: AppSpacing.xl3),
            
            Text(
              'Terms and conditions apply. Monthly subscription auto-renews unless canceled.',
              style: AppTypography.bodySM.copyWith(color: AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String period,
    required List<String> features,
    required bool isPopular,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isPopular ? AppColors.primaryStart : AppColors.divider,
          width: isPopular ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.headingLG,
              ),
              if (isPopular)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'POPULAR',
                    style: AppTypography.labelSM.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                price,
                style: AppTypography.displayMD.copyWith(color: AppColors.primaryEnd),
              ),
              Text(
                ' / $period',
                style: AppTypography.bodySM.copyWith(color: AppColors.textMuted),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          const Divider(color: AppColors.divider),
          const SizedBox(height: AppSpacing.xl),
          ...features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_rounded, color: AppColors.primaryEnd, size: 20),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        f,
                        style: AppTypography.bodyMD,
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: AppSpacing.lg),
          WavzButton(
            label: 'Get Started',
            onPressed: () {},
            type: isPopular ? WavzButtonType.primary : WavzButtonType.outlined,
          ),
        ],
      ),
    );
  }
}
