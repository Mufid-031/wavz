import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppGradients extends ThemeExtension<AppGradients> {
  const AppGradients({
    required this.primary,
    required this.card,
  });

  final LinearGradient primary;
  final LinearGradient card;

  @override
  ThemeExtension<AppGradients> copyWith({
    LinearGradient? primary,
    LinearGradient? card,
  }) {
    return AppGradients(
      primary: primary ?? this.primary,
      card: card ?? this.card,
    );
  }

  @override
  ThemeExtension<AppGradients> lerp(
    ThemeExtension<AppGradients>? other,
    double t,
  ) {
    if (other is! AppGradients) return this;
    return AppGradients(
      primary: LinearGradient.lerp(primary, other.primary, t)!,
      card: LinearGradient.lerp(card, other.card, t)!,
    );
  }

  static const AppGradients defaultGradients = AppGradients(
    primary: AppColors.primaryGradient,
    card: AppColors.cardGradient,
  );
}
