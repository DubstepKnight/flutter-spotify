import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spotify/src/details.dart';
import 'package:flutter_spotify/src/home/home_root_screen.dart';
import 'package:flutter_spotify/src/library/library_root_screen.dart';
import 'package:flutter_spotify/src/news/news_view.dart';
import 'package:flutter_spotify/src/playlist/views/playlist_view.dart';
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
  home,
  search,
  library,
  premium,
  details,
  homeAll,
  homeMusic,
  homePodcastsShows,
  homeProfile,
  homeNews,
  homeHistory,
  homeSettings,
  homePlaylist,
  searchProfile,
  searchNews,
  searchSettings,
  searchHistory,
  searchPlaylist,
  libraryProfile,
  libraryNews,
  libraryHistory,
  librarySettings,
  libraryPlaylist,
  news,
  listeningHistory,
  settings,
}

final settingsService = SettingsService();
final settingsController = SettingsController(settingsService);

final routerConfig = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // Stateful nested navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              name: Routes.home.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child:
                    HomeRootScreen(label: 'Home', detailsPath: '/home/details'),
              ),
              routes: [
                GoRoute(
                  path: 'all',
                  name: Routes.homeAll.name,
                  builder: (context, state) =>
                      const DetailsScreen(label: 'All'),
                ),
                GoRoute(
                  path: 'music',
                  name: Routes.homeMusic.name,
                  builder: (context, state) =>
                      const DetailsScreen(label: 'Music'),
                ),
                GoRoute(
                  path: 'podcasts_and_shows',
                  name: Routes.homePodcastsShows.name,
                  builder: (context, state) =>
                      const DetailsScreen(label: 'Podcasts & Shows'),
                ),
              ],
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
              routes: [
                GoRoute(
                  path: 'All',
                  builder: (context, state) =>
                      const DetailsScreen(label: 'Search'),
                ),
              ],
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
                  path: 'details',
                  builder: (context, state) =>
                      const DetailsScreen(label: 'Library'),
                ),
                GoRoute(
                  path: 'profile',
                  name: Routes.libraryProfile.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ProfileView(),
                  ),
                  routes: [
                    GoRoute(
                      path: 'profilePlaylist/:playlistId',
                      name: Routes.libraryPlaylist.name,
                      builder: (context, state) {
                        final playlistId = state.pathParameters['playlistId'];
                        return PlaylistView(playlistId: playlistId!);
                      },
                    ),
                  ],
                ),
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
  ],
);
