import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_durations.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/router/route_names.dart';
import '../../../../shared/widgets/gradient_text.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(AppDurations.splashDelay);
    if (!mounted) return;

    final authState = ref.read(authNotifierProvider);
    
    authState.maybeWhen(
      authenticated: (_) => context.go(RouteNames.home),
      orElse: () => context.go(RouteNames.onboarding),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            GradientText(
              AppStrings.appName,
              style: AppTypography.displayXL.copyWith(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.0, 1.0),
                  duration: 600.ms,
                  curve: Curves.easeOutBack,
                ),

            const SizedBox(height: 12),

            // Tagline
            Text(
              AppStrings.tagline,
              style: AppTypography.bodyLG.copyWith(
                color: AppColors.textMuted,
                letterSpacing: 1.2,
              ),
            )
                .animate(delay: 400.ms)
                .fadeIn(duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
