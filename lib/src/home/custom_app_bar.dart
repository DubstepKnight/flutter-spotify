import 'package:flutter/material.dart';
import 'package:flutter_spotify/router_config.dart';
import 'package:go_router/go_router.dart';

ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
);

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      expandedHeight: 70.0,
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Center(
          child: Row(
            children: [
              Builder(
                builder: (BuildContext context) {
                  return Hero(
                    tag: 'topBarBtnLibrary',
                    child: MaterialButton(
                      color: Colors.green,
                      height: 40,
                      minWidth: 40,
                      elevation: 1,
                      shape: kBackButtonShape,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => context.goNamed(Routes.homeAll.name),
                          child: const Text('All'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () =>
                              context.goNamed(Routes.homeMusic.name),
                          child: const Text('Music'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () =>
                              context.goNamed(Routes.homePodcastsShows.name),
                          child: const Text('Podcasts & Shows'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
