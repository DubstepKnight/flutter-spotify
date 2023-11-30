import 'package:flutter/material.dart';
import 'package:flutter_spotify/router_config.dart';
import 'package:flutter_spotify/src/components/profile_drawer.dart';
import 'package:flutter_spotify/src/library/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);

class LibraryRootScreen extends StatelessWidget {
  const LibraryRootScreen(
      {Key? key, required this.label, required this.detailsPath})
      : super(key: key);

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(
        profileName: Routes.libraryProfile.name,
        newsName: Routes.libraryNews.name,
        historyName: Routes.libraryHistory.name,
        settingsName: Routes.librarySettings.name,
      ),
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          const SliverToBoxAdapter(
            child: Placeholder(
              fallbackHeight: 400,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ), // You can customize the text style
                  ),
                  ElevatedButton(
                    onPressed: () => context.go(detailsPath),
                    child: const Text('Details'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
