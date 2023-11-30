import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/common-domains/added_by.dart';
import 'package:flutter_spotify/src/common-domains/album.dart';
import 'package:flutter_spotify/src/common-domains/artist.dart';
import 'package:flutter_spotify/src/common-domains/external_ids.dart';
import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/followers.dart';
import 'package:flutter_spotify/src/common-domains/image.dart';
import 'package:flutter_spotify/src/common-domains/owner.dart';
import 'package:flutter_spotify/src/common-domains/restrictions.dart';
import 'package:flutter_spotify/src/common-domains/tracks.dart';

import '../domain/playlist.dart';

final kTestPlaylists = [
  Playlist(
    id: '1',
    name: 'Playlist 1',
    description: 'Playlist 1 description',
    images: [
      const Image(
        url: 'https://i.scdn.co/image/ab6775700000ee85f1e9e4e0e5e0e0e5e0e0e0e5',
        height: 640,
        width: 640,
      )
    ],
    tracks: Tracks(
      href: 'https://api.spotify.com/v1/playlists/1/tracks',
      limit: 100,
      next: 'null',
      offset: 0,
      previous: 'null',
      total: 1,
      items: [
        Track(
          addedAt: 'asdasd',
          addedBy: AddedBy(
              externalUrls: const ExternalURLs(spotify: 'asdasd'),
              followers: const Followers(href: 'asdasd', total: 1200),
              href: 'asdasd',
              id: '123123',
              type: 'something',
              uri: 'adasd'),
          isLocal: true,
          track: TrackDetails(
            artists: [],
            album: Album(
              albumType: 'asdas',
              totalTracks: 123,
              availableMarkets: ['fi'],
              externalUrls: const ExternalURLs(spotify: 'asda'),
              href: 'asdasd',
              id: 'adas',
              images: [
                const Image(
                  url: 'adasda',
                  height: 320,
                  width: 320,
                ),
              ],
              name: 'name',
              releaseDate: 'asdasd',
              releaseDatePrecision: 'asdasd',
              restrictions: Restrictions(reason: 'reason'),
              type: 'type',
              uri: 'uri',
              artists: [
                Artist(
                  externalUrls: const ExternalURLs(spotify: 'asdasd'),
                  followers: const Followers(href: 'href', total: 120),
                  genres: ['asdasd'],
                  href: 'href',
                  id: 'id',
                  images: [const Image(url: 'url', height: 320, width: 320)],
                  name: 'asdasd',
                  popularity: 120,
                  type: 'type',
                  uri: 'uri',
                )
              ],
            ),
            availableMarkets: ['fi'],
            discNumber: 2,
            durationMs: 2300,
            isExplicit: false,
            externalIds: ExternalIds(isrc: 'isrc', ean: 'ean', upc: 'upc'),
            externalUrls: const ExternalURLs(spotify: 'asd'),
            href: 'href',
            id: 'id',
            isPlayable: true,
            linkedFrom: {},
            restrictions: Restrictions(reason: 'reason'),
            name: 'name',
            popularity: 120,
            previewUrl: 'asdasd',
            trackNumber: 12,
            type: 'type',
            uri: 'uri',
            isLocal: false,
          ),
        )
      ],
    ),
    externalUrls: const ExternalURLs(spotify: 'asdasd'),
    followers: const Followers(href: 'asdasd', total: 1200),
    href: 'asdasd',
    collaborative: true,
    isPublic: true,
    owner: Owner(
      externalUrls: const ExternalURLs(spotify: 'asda'),
      followers: const Followers(href: 'href', total: 120),
      href: 'href',
      id: 'id',
      type: 'type',
      uri: 'uri',
      displayName: 'displayName',
    ),
    snapshotId: 'snapshotId',
    type: 'type',
    uri: 'uri',
  ),
  Playlist(
    id: '2',
    name: 'Playlist 2',
    description: 'Playlist 2 description',
    images: [
      const Image(
        url: 'https://i.scdn.co/image/ab6775700000ee85f1e9e4e0e5e0e0e5e0e0e0e5',
        height: 640,
        width: 640,
      )
    ],
    tracks: Tracks(
      href: 'https://api.spotify.com/v1/playlists/1/tracks',
      limit: 100,
      next: 'null',
      offset: 0,
      previous: 'null',
      total: 1,
      items: [
        Track(
          addedAt: 'asdasd',
          addedBy: AddedBy(
              externalUrls: const ExternalURLs(spotify: 'asdasd'),
              followers: const Followers(href: 'asdasd', total: 1200),
              href: 'asdasd',
              id: '123123',
              type: 'something',
              uri: 'adasd'),
          isLocal: true,
          track: TrackDetails(
            artists: [],
            album: Album(
              albumType: 'asdas',
              totalTracks: 123,
              availableMarkets: ['fi'],
              externalUrls: const ExternalURLs(spotify: 'asda'),
              href: 'asdasd',
              id: 'adas',
              images: [
                const Image(
                  url: 'adasda',
                  height: 320,
                  width: 320,
                ),
              ],
              name: 'name',
              releaseDate: 'asdasd',
              releaseDatePrecision: 'asdasd',
              restrictions: Restrictions(reason: 'reason'),
              type: 'type',
              uri: 'uri',
              artists: [
                Artist(
                  externalUrls: const ExternalURLs(spotify: 'asdasd'),
                  followers: const Followers(href: 'href', total: 120),
                  genres: ['asdasd'],
                  href: 'href',
                  id: 'id',
                  images: [const Image(url: 'url', height: 320, width: 320)],
                  name: 'asdasd',
                  popularity: 120,
                  type: 'type',
                  uri: 'uri',
                )
              ],
            ),
            availableMarkets: ['fi'],
            discNumber: 2,
            durationMs: 2300,
            isExplicit: false,
            externalIds: ExternalIds(isrc: 'isrc', ean: 'ean', upc: 'upc'),
            externalUrls: const ExternalURLs(spotify: 'asd'),
            href: 'href',
            id: 'id',
            isPlayable: true,
            linkedFrom: {},
            restrictions: Restrictions(reason: 'reason'),
            name: 'name',
            popularity: 120,
            previewUrl: 'asdasd',
            trackNumber: 12,
            type: 'type',
            uri: 'uri',
            isLocal: false,
          ),
        )
      ],
    ),
    externalUrls: const ExternalURLs(spotify: 'asdasd'),
    followers: const Followers(href: 'asdasd', total: 1200),
    href: 'asdasd',
    collaborative: true,
    isPublic: true,
    owner: Owner(
      externalUrls: const ExternalURLs(spotify: 'asda'),
      followers: const Followers(href: 'href', total: 120),
      href: 'href',
      id: 'id',
      type: 'type',
      uri: 'uri',
      displayName: 'displayName',
    ),
    snapshotId: 'snapshotId',
    type: 'type',
    uri: 'uri',
  ),
  Playlist(
    id: '3',
    name: 'Playlist 3',
    description: 'Playlist 3 description',
    images: [
      const Image(
        url: 'https://i.scdn.co/image/ab6775700000ee85f1e9e4e0e5e0e0e5e0e0e0e5',
        height: 640,
        width: 640,
      )
    ],
    tracks: Tracks(
      href: 'https://api.spotify.com/v1/playlists/1/tracks',
      limit: 100,
      next: 'null',
      offset: 0,
      previous: 'null',
      total: 1,
      items: [
        Track(
          addedAt: 'asdasd',
          addedBy: AddedBy(
              externalUrls: const ExternalURLs(spotify: 'asdasd'),
              followers: const Followers(href: 'asdasd', total: 1200),
              href: 'asdasd',
              id: '123123',
              type: 'something',
              uri: 'adasd'),
          isLocal: true,
          track: TrackDetails(
            artists: [],
            album: Album(
              albumType: 'asdas',
              totalTracks: 123,
              availableMarkets: ['fi'],
              externalUrls: const ExternalURLs(spotify: 'asda'),
              href: 'asdasd',
              id: 'adas',
              images: [
                const Image(
                  url: 'adasda',
                  height: 320,
                  width: 320,
                ),
              ],
              name: 'name',
              releaseDate: 'asdasd',
              releaseDatePrecision: 'asdasd',
              restrictions: Restrictions(reason: 'reason'),
              type: 'type',
              uri: 'uri',
              artists: [
                Artist(
                  externalUrls: const ExternalURLs(spotify: 'asdasd'),
                  followers: const Followers(href: 'href', total: 120),
                  genres: ['asdasd'],
                  href: 'href',
                  id: 'id',
                  images: [const Image(url: 'url', height: 320, width: 320)],
                  name: 'asdasd',
                  popularity: 120,
                  type: 'type',
                  uri: 'uri',
                )
              ],
            ),
            availableMarkets: ['fi'],
            discNumber: 2,
            durationMs: 2300,
            isExplicit: false,
            externalIds: ExternalIds(isrc: 'isrc', ean: 'ean', upc: 'upc'),
            externalUrls: const ExternalURLs(spotify: 'asd'),
            href: 'href',
            id: 'id',
            isPlayable: true,
            linkedFrom: {},
            restrictions: Restrictions(reason: 'reason'),
            name: 'name',
            popularity: 120,
            previewUrl: 'asdasd',
            trackNumber: 12,
            type: 'type',
            uri: 'uri',
            isLocal: false,
          ),
        )
      ],
    ),
    externalUrls: const ExternalURLs(spotify: 'asdasd'),
    followers: const Followers(href: 'asdasd', total: 1200),
    href: 'asdasd',
    collaborative: true,
    isPublic: true,
    owner: Owner(
      externalUrls: const ExternalURLs(spotify: 'asda'),
      followers: const Followers(href: 'href', total: 120),
      href: 'href',
      id: 'id',
      type: 'type',
      uri: 'uri',
      displayName: 'displayName',
    ),
    snapshotId: 'snapshotId',
    type: 'type',
    uri: 'uri',
  )
];

class PlaylistRepository {
  final List<Playlist> _playlists = kTestPlaylists;

  List<Playlist> getPlaylistsList() {
    return _playlists;
  }

  Playlist? getPlaylist(String id) {
    return _playlists.firstWhere((playlist) => playlist.id == id);
  }

  Provider<Playlist?> getPlaylistProvider(String id) {
    return Provider((_) => getPlaylist(id));
  }
}

final playlistRepositoryProvider = Provider((_) => PlaylistRepository());

final playlistProvider =
    FutureProvider.autoDispose.family<Playlist?, String>((ref, id) async {
  final repository = ref.watch(playlistRepositoryProvider);
  return repository.getPlaylist(id);
});

final playlistsProvider =
    FutureProvider.autoDispose<List<Playlist>>((ref) async {
  final repository = ref.watch(playlistRepositoryProvider);
  return repository.getPlaylistsList();
});
