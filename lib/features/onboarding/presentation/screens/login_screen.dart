import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/router/route_names.dart';
import '../../../../shared/widgets/gradient_text.dart';
import '../../../../shared/widgets/wavz_button.dart';
import '../../../../shared/widgets/wavz_card.dart';
import '../../../../shared/widgets/wavz_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xl2),

              // Logo Small
              const Center(
                child: GradientText(
                  AppStrings.appName,
                  style: TextStyle(
                    fontFamily: AppTypography.displayFont,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.xl6),

              // Heading
              const Text(
                AppStrings.welcomeBack,
                style: AppTypography.displayMD,
              ),
              const SizedBox(height: AppSpacing.xl3),

              // Fields
              WavzTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                label: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined, size: 20),
              ),
              const SizedBox(height: AppSpacing.lg),
              WavzTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                label: AppStrings.password,
                obscureText: true,
                prefixIcon: const Icon(Icons.lock_outline, size: 20),
                suffixIcon: const Icon(Icons.visibility_off_outlined, size: 20),
              ),

              const SizedBox(height: AppSpacing.md),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.forgotPassword,
                    style: AppTypography.labelSM.copyWith(
                      color: AppColors.primaryStart,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.xl2),

              // CTA Button
              WavzButton(
                onPressed: () => context.go(RouteNames.home),
                label: AppStrings.login,
                width: double.infinity,
              ),

              const SizedBox(height: AppSpacing.xl3),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    child: Text(
                      AppStrings.or,
                      style: AppTypography.bodySM,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: AppSpacing.xl3),

              // OAuth Buttons
              WavzCard(
                onTap: () {},
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.g_mobiledata, size: 32),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      AppStrings.loginWithGoogle,
                      style: AppTypography.labelLG,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              WavzCard(
                onTap: () {},
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.apple, size: 24),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      AppStrings.loginWithApple,
                      style: AppTypography.labelLG,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xl3),

              // Register Link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: AppTypography.bodyMD,
                    ),
                    TextButton(
                      onPressed: () => context.push(RouteNames.register),
                      child: Text(
                        AppStrings.register,
                        style: AppTypography.labelLG.copyWith(
                          color: AppColors.primaryStart,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xl2),
            ],
          ),
        ),
      ),
    );
  }
}
