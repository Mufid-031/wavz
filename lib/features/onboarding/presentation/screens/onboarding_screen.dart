import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/router/route_names.dart';
import '../../../../shared/widgets/wavz_button.dart';
import '../../domain/entities/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    const OnboardingData(
      title: AppStrings.onboardingDiscoverTitle,
      body: AppStrings.onboardingDiscoverBody,
      image: 'assets/images/onboarding/discover.png',
    ),
    const OnboardingData(
      title: AppStrings.onboardingConnectTitle,
      body: AppStrings.onboardingConnectBody,
      image: 'assets/images/onboarding/connect.png',
    ),
    const OnboardingData(
      title: AppStrings.onboardingListenTitle,
      body: AppStrings.onboardingListenBody,
      image: 'assets/images/onboarding/listen.png',
    ),
  ];

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    context.go(RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            children: [
              // Skip Button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _finishOnboarding,
                  child: Text(
                    AppStrings.skip,
                    style: AppTypography.labelLG.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) => setState(() => _currentPage = index),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return _OnboardingSlide(data: _pages[index]);
                  },
                ),
              ),

              // Bottom Area
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl3),
                child: Column(
                  children: [
                    // Dot Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (index) => _buildDot(index),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl3),

                    // CTA Button
                    WavzButton(
                      onPressed: _onNext,
                      label: _currentPage == _pages.length - 1
                          ? AppStrings.getStarted
                          : 'Next',
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    final bool isActive = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: isActive ? AppColors.primaryGradient : null,
        color: isActive ? null : AppColors.surfaceHighest,
      ),
    );
  }
}

class _OnboardingSlide extends StatelessWidget {
  const _OnboardingSlide({required this.data});

  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Illustration Placeholder
        Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusXL),
          ),
          child: const Center(
            child: Icon(
              Icons.image_outlined,
              size: 64,
              color: AppColors.textMuted,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xl4),

        // Title
        Text(
          data.title,
          style: AppTypography.displayLG.copyWith(
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),

        // Body
        Text(
          data.body,
          style: AppTypography.bodyLG.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
