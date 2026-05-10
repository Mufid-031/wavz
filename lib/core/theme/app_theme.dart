import 'package:flutter/material.dart';
import 'app_theme_extensions.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import '../constants/app_spacing.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryStart,
        secondary: AppColors.primaryEnd,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: AppColors.textPrimary,
        onSecondary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
        onError: AppColors.textPrimary,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 0.5,
      ),
      textTheme: const TextTheme(
        displayLarge: AppTypography.displayXL,
        displayMedium: AppTypography.displayLG,
        displaySmall: AppTypography.displayMD,
        headlineLarge: AppTypography.headingLG,
        headlineMedium: AppTypography.headingMD,
        headlineSmall: AppTypography.headingSM,
        bodyLarge: AppTypography.bodyLG,
        bodyMedium: AppTypography.bodyMD,
        bodySmall: AppTypography.bodySM,
        labelLarge: AppTypography.labelLG,
        labelSmall: AppTypography.labelSM,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: AppTypography.headingLG,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.background,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.labelSM.copyWith(color: AppColors.primaryStart);
          }
          return AppTypography.labelSM.copyWith(color: AppColors.textMuted);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primaryStart);
          }
          return const IconThemeData(color: AppColors.textMuted);
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: const BorderSide(color: AppColors.divider, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: const BorderSide(color: AppColors.divider, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          borderSide: const BorderSide(color: AppColors.primaryStart, width: 1.0),
        ),
        hintStyle: AppTypography.bodyMD.copyWith(color: AppColors.textMuted),
        labelStyle: AppTypography.bodyMD.copyWith(color: AppColors.textMuted),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textPrimary,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl2,
            vertical: AppSpacing.lg,
          ),
          textStyle: AppTypography.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
          ),
        ),
      ),
      extensions: const [
        AppGradients.defaultGradients,
      ],
    );
  }
}
