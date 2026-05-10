import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../onboarding/domain/entities/genre.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Search',
                    style: AppTypography.displayLG,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.divider, width: 0.5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                    child: const Row(
                      children: [
                        Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
                        SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Songs, artists, or albums...',
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              filled: false,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Icon(Icons.mic_rounded, color: AppColors.textMuted, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Browse Genres
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Text(
                'Browse Genres',
                style: AppTypography.headingMD,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.sm,
                  mainAxisSpacing: AppSpacing.sm,
                  childAspectRatio: 2,
                ),
                itemCount: _genres.length,
                itemBuilder: (context, index) {
                  return _GenreTile(genre: _genres[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenreTile extends StatelessWidget {
  const _GenreTile({required this.genre});

  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: genre.gradient,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 8,
            bottom: 8,
            child: Icon(
              genre.icon,
              size: 28,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                genre.name,
                style: const TextStyle(
                  fontFamily: AppTypography.displayFont,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
