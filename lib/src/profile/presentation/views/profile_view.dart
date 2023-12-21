import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/playlist/data/playlist_provider.dart';
import 'package:flutter_spotify/src/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_spotify/src/profile/presentation/views/playlists_view.dart';
import 'package:flutter_spotify/src/profile/presentation/views/profile_header_view.dart';

const kClampMax = 100.0;

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  late final ScrollController _scrollController;
  double appBarOpacity = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 0.0)
      ..addListener(() {
        setState(() {
          appBarOpacity = _scrollController.hasClients
              ? clampDouble(_scrollController.offset, 0.0, kClampMax) /
                  kClampMax
              : 0;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playlists = ref.watch(playlistsProvider);
    final state = ref.watch(profileControllerProvider);

    return state.when(
      data: (profile) => profile == null
          ? Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text('No data'),
              ),
            )
          : Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                bottomOpacity: 0,
                backgroundColor: Colors.black.withOpacity(appBarOpacity),
                elevation: 0,
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    profile.displayName,
                    style: TextStyle(
                      color: Colors.white.withOpacity(appBarOpacity),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    ProfileHeaderView(
                      profile: profile,
                    ),
                    PlaylistsView(playlists)
                  ],
                ),
              ),
            ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => const Center(
        child: Text('Error'),
      ),
    );
  }
}
