import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/playlist/data/playlist_provider.dart';

class PlaylistView extends ConsumerWidget {
  const PlaylistView({
    super.key,
    required this.playlistId,
  });

  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistValue = ref.watch(playlistProvider(playlistId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
      ),
      body: playlistValue.when(
        data: (playlist) => Container(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => const Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}
