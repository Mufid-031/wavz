import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';

class TrendingRow extends StatelessWidget {
  const TrendingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Text(
            'Trending Now',
            style: AppTypography.headingMD,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.xl2),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  // Rank Number
                  Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontFamily: AppTypography.displayFont,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.divider,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  // Song Info
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.trending_up, color: AppColors.textMuted),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Trending Song',
                        style: AppTypography.labelLG,
                      ),
                      Text(
                        'Artist Name',
                        style: AppTypography.bodySM.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
