import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/components/playlist_tile.dart';
import 'package:flutter_spotify/src/playlist/domain/playlist.dart';

class PlaylistsView extends ConsumerWidget {
  const PlaylistsView(this.playlists, {super.key});

  final AsyncValue<List<Playlist>> playlists;

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
        playlists.when(
          data: (playlists) => Column(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: playlists.length,
                itemBuilder: (context, index) {
                  if (index <= 3) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: PlaylistTile(
                        playlist: playlists[index],
                      ),
                    );
                  }
                  return null;
                },
              ),
              playlists.length > 3
                  ? TextButton(
                      onPressed: () {},
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
