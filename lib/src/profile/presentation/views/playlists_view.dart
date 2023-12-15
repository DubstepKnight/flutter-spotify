import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/components/playlist_tile.dart';
import 'package:flutter_spotify/src/playlist/domain/playlist.dart';
import 'package:flutter_spotify/src/playlist/views/all_playlists_view.dart';

class PlaylistsView extends ConsumerWidget {
  const PlaylistsView(this.playlistsValue, {super.key});

  final AsyncValue<List<Playlist>> playlistsValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Playlists",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        playlistsValue.when(
          data: (playlists) => Column(
            children: [
              ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: playlists.length,
                itemBuilder: (context, index) {
                  if (index <= 3) {
                    return PlaylistTile(
                      playlist: playlists[index],
                    );
                  }
                  return null;
                },
              ),
              playlists.length > 2
                  ? TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              AllPlaylistsView(playlists: playlists),
                        ),
                      ),
                      child: const Text('Show all'),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => const Center(
            child: Text('Error'),
          ),
        ),
      ],
    );
  }
}
