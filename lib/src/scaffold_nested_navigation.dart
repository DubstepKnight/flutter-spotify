// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.0)],
          ),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          elevation: 0,
          destinations: [
            NavigationDestination(
              label: 'Home',
              icon: Icon(navigationShell.currentIndex == 0
                  ? Icons.home_sharp
                  : Icons.home_outlined),
            ),
            NavigationDestination(
              label: 'Search',
              icon: Icon(navigationShell.currentIndex == 1
                  ? Icons.search
                  : Icons.search_outlined),
            ),
            NavigationDestination(
              label: 'Your Library',
              icon: Icon(navigationShell.currentIndex == 2
                  ? Icons.library_music
                  : Icons.library_music_outlined),
            ),
          ],
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}
