import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTypography {
  static const String displayFont = 'ClashDisplay';
  static const String bodyFont    = 'Satoshi';

  // === DISPLAY (ClashDisplay) ===
  static const TextStyle displayXL = TextStyle(
    fontFamily: displayFont,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -1.5,
  );

  static const TextStyle displayLG = TextStyle(
    fontFamily: displayFont,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -1.0,
  );

  static const TextStyle displayMD = TextStyle(
    fontFamily: displayFont,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  // === HEADINGS (ClashDisplay) ===
  static const TextStyle headingLG = TextStyle(
    fontFamily: displayFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle headingMD = TextStyle(
    fontFamily: displayFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle headingSM = TextStyle(
    fontFamily: displayFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // === BODY (Satoshi) ===
  static const TextStyle bodyLG = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMD = TextStyle(
    fontFamily: bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySM = TextStyle(
    fontFamily: bodyFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  // === LABELS (Satoshi Medium) ===
  static const TextStyle labelLG = TextStyle(
    fontFamily: bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );

  static const TextStyle labelSM = TextStyle(
    fontFamily: bodyFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.2,
  );

  // === BUTTON (ClashDisplay) ===
  static const TextStyle button = TextStyle(
    fontFamily: displayFont,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );
}
