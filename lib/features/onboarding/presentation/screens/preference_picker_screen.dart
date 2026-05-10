import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/router/route_names.dart';
import '../../../../shared/widgets/wavz_button.dart';
import '../../domain/entities/genre.dart';

class PreferencePickerScreen extends StatefulWidget {
  const PreferencePickerScreen({super.key});

  @override
  State<PreferencePickerScreen> createState() => _PreferencePickerScreenState();
}

class _PreferencePickerScreenState extends State<PreferencePickerScreen> {
  final List<String> _selectedIds = [];

  final List<Genre> _genres = const [
    Genre(id: 'hiphop', name: 'Hip-Hop', gradient: AppColors.hipHopGradient, icon: Icons.audiotrack),
    Genre(id: 'electronic', name: 'Electronic', gradient: AppColors.electronicGradient, icon: Icons.speaker),
    Genre(id: 'jazz', name: 'Jazz', gradient: AppColors.jazzGradient, icon: Icons.music_note),
    Genre(id: 'pop', name: 'Pop', gradient: AppColors.popGradient, icon: Icons.favorite),
    Genre(id: 'randb', name: 'R&B', gradient: AppColors.rAndBGradient, icon: Icons.nights_stay),
    Genre(id: 'rock', name: 'Rock', gradient: AppColors.rockGradient, icon: Icons.whatshot),
    Genre(id: 'classical', name: 'Classical', gradient: AppColors.classicalGradient, icon: Icons.account_balance),
    Genre(id: 'latin', name: 'Latin', gradient: AppColors.latinGradient, icon: Icons.wb_sunny),
  ];

  void _toggleGenre(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pick Your Vibes',
                    style: AppTypography.displayLG,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Select at least 3 genres you like',
                    style: AppTypography.bodyMD.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                  childAspectRatio: 16 / 9,
                ),
                itemCount: _genres.length,
                itemBuilder: (context, index) {
                  final genre = _genres[index];
                  final isSelected = _selectedIds.contains(genre.id);
                  return _GenreCard(
                    genre: genre,
                    isSelected: isSelected,
                    onTap: () => _toggleGenre(genre.id),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: WavzButton(
                onPressed: _selectedIds.length >= 3 ? () => context.go(RouteNames.home) : null,
                label: 'Continue',
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenreCard extends StatelessWidget {
  const _GenreCard({
    required this.genre,
    required this.isSelected,
    required this.onTap,
  });

  final Genre genre;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: genre.gradient,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: genre.gradient.colors.last.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              bottom: -10,
              child: Icon(
                genre.icon,
                size: 64,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                genre.name,
                style: AppTypography.headingMD.copyWith(color: Colors.white),
              ),
            ),
            if (isSelected)
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
