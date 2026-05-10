import 'package:flutter/material.dart';

abstract class AppColors {
  // === BACKGROUNDS ===
  static const Color background      = Color(0xFF0A0A0F);
  static const Color surface         = Color(0xFF13131A);
  static const Color surfaceElevated = Color(0xFF1C1C26);
  static const Color surfaceHighest  = Color(0xFF252532);

  // === BRAND GRADIENTS ===
  static const Color primaryStart    = Color(0xFF7C3AED); // Electric Purple
  static const Color primaryEnd      = Color(0xFF06B6D4); // Neon Cyan
  static const Color accentPink      = Color(0xFFEC4899);
  static const Color accentOrange    = Color(0xFFF97316);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryStart, primaryEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1E1A2E), Color(0xFF0F1A2E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // === GENRE GRADIENTS ===
  static const LinearGradient hipHopGradient = LinearGradient(
    colors: [Color(0xFF1A0533), Color(0xFF6D28D9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient electronicGradient = LinearGradient(
    colors: [Color(0xFF001A2E), Color(0xFF0EA5E9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient jazzGradient = LinearGradient(
    colors: [Color(0xFF1A0A00), Color(0xFFB45309)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient popGradient = LinearGradient(
    colors: [Color(0xFF1A0020), Color(0xFFA21CAF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient rAndBGradient = LinearGradient(
    colors: [Color(0xFF001A10), Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient rockGradient = LinearGradient(
    colors: [Color(0xFF1A0000), Color(0xFFDC2626)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient classicalGradient = LinearGradient(
    colors: [Color(0xFF0A0A1A), Color(0xFF4338CA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient latinGradient = LinearGradient(
    colors: [Color(0xFF1A1000), Color(0xFFD97706)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // === TEXT ===
  static const Color textPrimary     = Color(0xFFFFFFFF);
  static const Color textSecondary   = Color(0xFFAAAAAA);
  static const Color textMuted       = Color(0xFF666680);

  // === STATUS ===
  static const Color success         = Color(0xFF22C55E);
  static const Color warning         = Color(0xFFF59E0B);
  static const Color error           = Color(0xFFEF4444);
  static const Color info            = Color(0xFF3B82F6);

  // === MISC ===
  static const Color divider         = Color(0xFF1F1F2E);
  static const Color shimmerBase     = Color(0xFF1C1C2E);
  static const Color shimmerHighlight = Color(0xFF2A2A3E);

  // === SEMANTIC ===
  static const Color liked           = Color(0xFFEC4899);
  static const Color downloaded      = Color(0xFF22C55E);
}
