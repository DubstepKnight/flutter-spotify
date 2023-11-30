import 'package:flutter/material.dart';
import 'package:flutter_spotify/src/playlist/domain/playlist.dart';
import 'package:flutter_spotify/src/playlist/views/playlist_view.dart';

class PlaylistTile extends StatelessWidget {
  const PlaylistTile({
    required this.playlist,
    super.key,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlaylistView(playlistId: playlist.id),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.music_note,
            size: 60,
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                playlist.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
