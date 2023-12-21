import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/auth/data/auth_repository.dart';
import 'package:flutter_spotify/src/auth/presentation/login_view.dart';
import 'package:flutter_spotify/src/home/home_root_screen.dart';
import 'package:flutter_spotify/src/library/library_root_screen.dart';
import 'package:flutter_spotify/src/news/news_view.dart';
import 'package:flutter_spotify/src/profile/presentation/views/profile_view.dart';
import 'package:flutter_spotify/src/scaffold_nested_navigation.dart';
import 'package:flutter_spotify/src/search/search_root_screen.dart';
import 'package:flutter_spotify/src/settings/settings_controller.dart';
import 'package:flutter_spotify/src/settings/settings_service.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final _shellNavigatorSearchKey = GlobalKey<NavigatorState>();
final _shellNavigatorLibraryKey = GlobalKey<NavigatorState>();

enum Routes {
  login,
  home,
  search,
  library,
  premium,
  homeAll,
  homeMusic,
  homePodcastsShows,
  news,
  listeningHistory,
  settings,
}

final settingsService = SettingsService();
final settingsController = SettingsController(settingsService);

// final routerConfig = GoRouter(
final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return GoRouter(
      initialLocation: '/login',
      refreshListenable:
          GoRouterRefreshStream(authRepository.authStateChanges()),
      navigatorKey: _rootNavigatorKey,
      routes: [
        // Stateful nested navigation based on:
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            // the UI shell
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: '/home',
                  name: Routes.home.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomeRootScreen(
                        label: 'Home', detailsPath: '/home/details'),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorSearchKey,
              routes: [
                GoRoute(
                  path: '/search',
                  name: Routes.search.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: SearchRootScreen(
                        label: 'Search', detailsPath: '/search/details'),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorLibraryKey,
              routes: [
                GoRoute(
                  path: '/library',
                  name: Routes.library.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: LibraryRootScreen(
                        label: 'Library', detailsPath: '/library/details'),
                  ),
                  routes: [
                    GoRoute(
                      path: 'news',
                      name: Routes.news.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: NewsView(),
                      ),
                    ),
                    GoRoute(
                      path: 'listening-history',
                      name: Routes.listeningHistory.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: ProfileView(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          name: Routes.login.name,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LoginView(),
          ),
        ),
      ],
    );
  },
);

/// This class was imported from the migration guide for GoRouter 5.0
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
