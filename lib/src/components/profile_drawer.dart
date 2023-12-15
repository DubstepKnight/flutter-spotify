import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/listening-history/listening_history.dart';
import 'package:flutter_spotify/src/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_spotify/src/profile/presentation/views/profile_view.dart';
import 'package:flutter_spotify/src/settings/settings_view.dart';
import 'package:go_router/go_router.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({
    super.key,
    required this.profileName,
    required this.newsName,
    required this.historyName,
    required this.settingsName,
  });

  final String profileName;
  final String newsName;
  final String historyName;
  final String settingsName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileControllerProvider);

    return Drawer(
      child: NavigationDrawer(
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
                child: InkWell(
                  enableFeedback: false,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfileView(),
                    ),
                  ),
                  child: DrawerHeader(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.valueOrNull?.displayName ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "View profile",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Row(children: [
                  Icon(Icons.bolt_outlined),
                  SizedBox(
                    width: 8,
                  ),
                  Text('What\'s new')
                ]),
                onTap: () {
                  context.goNamed(newsName);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.av_timer_outlined),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Listening history')
                  ],
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListeningHistoryView(),
                  ),
                ),
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Settings')
                  ],
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsView(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
