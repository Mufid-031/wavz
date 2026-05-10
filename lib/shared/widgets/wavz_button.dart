import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';

enum WavzButtonType { primary, outlined, text }

class WavzButton extends StatelessWidget {
  const WavzButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.type = WavzButtonType.primary,
    this.width,
    this.height = 56.0,
    this.isLoading = false,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String label;
  final WavzButtonType type;
  final double? width;
  final double height;
  final bool isLoading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    switch (type) {
      case WavzButtonType.primary:
        return _buildPrimaryButton(isDisabled);
      case WavzButtonType.outlined:
        return _buildOutlinedButton(isDisabled);
      case WavzButtonType.text:
        return _buildTextButton(isDisabled);
    }
  }

  Widget _buildPrimaryButton(bool isDisabled) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: isDisabled ? null : AppColors.primaryGradient,
        color: isDisabled ? AppColors.surfaceHighest : null,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
      ),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
          ),
        ),
        child: _buildContent(isDisabled),
      ),
    );
  }

  Widget _buildOutlinedButton(bool isDisabled) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: isDisabled ? AppColors.divider : AppColors.primaryStart,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
          ),
        ),
        child: _buildContent(isDisabled),
      ),
    );
  }

  Widget _buildTextButton(bool isDisabled) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
          ),
        ),
        child: _buildContent(isDisabled),
      ),
    );
  }

  Widget _buildContent(bool isDisabled) {
    if (isLoading) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon!,
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(
          label,
          style: AppTypography.button.copyWith(
            color: isDisabled ? AppColors.textMuted : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
