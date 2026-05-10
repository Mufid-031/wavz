import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../widgets/daily_mix_chips.dart';
import '../widgets/featured_card.dart';
import '../widgets/greeting_header.dart';
import '../widgets/new_releases_grid.dart';
import '../widgets/recently_played_row.dart';
import '../widgets/trending_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header
            const SliverPadding(
              padding: EdgeInsets.all(AppSpacing.xl),
              sliver: SliverToBoxAdapter(
                child: GreetingHeader(userName: 'Mufid'),
              ),
            ),

            // Recently Played
            const SliverToBoxAdapter(
              child: RecentlyPlayedRow(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.xl3),
            ),

            // Featured Card
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              sliver: SliverToBoxAdapter(
                child: FeaturedCard(),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.xl3),
            ),

            // Trending Now
            const SliverToBoxAdapter(
              child: TrendingRow(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.xl3),
            ),

            // New Releases
            const SliverToBoxAdapter(
              child: NewReleasesGrid(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.xl3),
            ),

            // Daily Mix
            const SliverToBoxAdapter(
              child: DailyMixChips(),
            ),

            // Bottom Padding
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.xl6),
            ),
          ],
        ),
      ),
    );
  }
}
