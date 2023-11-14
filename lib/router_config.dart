import 'package:flutter/widgets.dart';
import 'package:flutter_spotify/src/details.dart';
import 'package:flutter_spotify/src/root_screen.dart';
import 'package:flutter_spotify/src/scaffold_nested_navigation.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');

final routerConfig =
    GoRouter(initialLocation: '/a', navigatorKey: _rootNavigatorKey, routes: [
  // Stateful nested navigation based on:
  // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      // the UI shell
      return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
    },
    branches: [
      // first branch (A)
      StatefulShellBranch(
        navigatorKey: _shellNavigatorAKey,
        routes: [
          // top route inside branch
          GoRoute(
            path: '/a',
            pageBuilder: (context, state) => NoTransitionPage(
              child: RootScreen(label: 'A', detailsPath: '/a/details'),
            ),
            routes: [
              // child route
              GoRoute(
                path: 'details',
                builder: (context, state) => const DetailsScreen(label: 'A'),
              ),
            ],
          ),
        ],
      ),
      // second branch (B)
      StatefulShellBranch(
        navigatorKey: _shellNavigatorBKey,
        routes: [
          // top route inside branch
          GoRoute(
            path: '/b',
            pageBuilder: (context, state) => NoTransitionPage(
              child: RootScreen(label: 'B', detailsPath: '/b/details'),
            ),
            routes: [
              // child route
              GoRoute(
                path: 'details',
                builder: (context, state) => const DetailsScreen(label: 'B'),
              ),
            ],
          ),
        ],
      ),
      // third branch (C)
      StatefulShellBranch(
        navigatorKey: _shellNavigatorCKey,
        routes: [
          // top route inside branch
          GoRoute(
            path: '/c',
            pageBuilder: (context, state) => NoTransitionPage(
              child: RootScreen(label: 'C', detailsPath: '/c/details'),
            ),
            routes: [
              // child route
              GoRoute(
                path: 'details',
                builder: (context, state) => const DetailsScreen(label: 'C'),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
]);
