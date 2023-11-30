import 'package:flutter/material.dart';
import 'package:flutter_spotify/router_config.dart';
import 'package:flutter_spotify/src/components/profile_drawer.dart';
import 'package:flutter_spotify/src/search/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class SearchRootScreen extends StatelessWidget {
  const SearchRootScreen(
      {Key? key, required this.label, required this.detailsPath})
      : super(key: key);

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: label),
      drawer: ProfileDrawer(
        profileName: Routes.searchProfile.name,
        newsName: Routes.searchNews.name,
        historyName: Routes.searchHistory.name,
        settingsName: Routes.searchSettings.name,
      ),
      body: Center(
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
    );
  }
}
