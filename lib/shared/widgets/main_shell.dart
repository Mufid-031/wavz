import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/router/route_names.dart';
import 'mini_player.dart';

class MainShell extends StatelessWidget {
  const MainShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: Stack(
        children: [
          child,
          // MiniPlayer
          const Positioned(
            left: 0,
            right: 0,
            bottom: AppSpacing.sm,
            child: MiniPlayer(),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(location),
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: const [
          NavigationDestination(
            icon: Icon(AppIcons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(AppIcons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(AppIcons.library),
            label: 'Library',
          ),
          NavigationDestination(
            icon: Icon(AppIcons.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith(RouteNames.home)) return 0;
    if (location.startsWith(RouteNames.search)) return 1;
    if (location.startsWith(RouteNames.library)) return 2;
    if (location.startsWith(RouteNames.profile)) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(RouteNames.home);
      case 1:
        context.go(RouteNames.search);
      case 2:
        context.go(RouteNames.library);
      case 3:
        context.go(RouteNames.profile);
    }
  }
}
