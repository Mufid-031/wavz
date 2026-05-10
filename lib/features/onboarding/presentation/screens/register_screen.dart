import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/router/route_names.dart';
import '../../../../shared/widgets/gradient_text.dart';
import '../../../../shared/widgets/wavz_button.dart';
import '../../../../shared/widgets/wavz_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              const SizedBox(height: AppSpacing.xl4),

              // Heading
              const Text(
                'Create Account',
                style: AppTypography.displayMD,
              ),
              const SizedBox(height: AppSpacing.md),
              const Text(
                'Start your musical journey with WAVZ',
                style: AppTypography.bodyMD,
              ),

              const SizedBox(height: AppSpacing.xl3),

              // Fields
              WavzTextField(
                controller: _nameController,
                hintText: 'Enter your full name',
                label: 'Full Name',
                prefixIcon: const Icon(Icons.person_outline, size: 20),
              ),
              const SizedBox(height: AppSpacing.lg),
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
                hintText: 'Create a password',
                label: AppStrings.password,
                obscureText: true,
                prefixIcon: const Icon(Icons.lock_outline, size: 20),
                suffixIcon: const Icon(Icons.visibility_off_outlined, size: 20),
              ),

              const SizedBox(height: AppSpacing.xl4),

              // CTA Button
              WavzButton(
                onPressed: () => context.go(RouteNames.preferencePicker),
                label: AppStrings.register,
                width: double.infinity,
              ),

              const SizedBox(height: AppSpacing.xl3),

              // Login Link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: AppTypography.bodyMD,
                    ),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        AppStrings.login,
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
