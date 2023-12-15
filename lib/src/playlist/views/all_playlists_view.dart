import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/components/playlist_tile.dart';
import 'package:flutter_spotify/src/playlist/domain/playlist.dart';

class AllPlaylistsView extends ConsumerWidget {
  const AllPlaylistsView({super.key, required this.playlists});

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Playlists"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return PlaylistTile(
                  playlist: playlists[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
