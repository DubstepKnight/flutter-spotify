import 'package:flutter_spotify/src/common-domains/added_by.dart';
import 'package:flutter_spotify/src/common-domains/album.dart';
import 'package:flutter_spotify/src/common-domains/artist.dart';
import 'package:flutter_spotify/src/common-domains/external_ids.dart';
import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/restrictions.dart';

class Tracks {
  String href;
  int limit;
  String next;
  int offset;
  String previous;
  int total;
  List<Track> items;

  Tracks({
    required this.href,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
    required this.items,
  });
}

class Track {
  String addedAt;
  AddedBy addedBy;
  bool isLocal;
  TrackDetails track;

  Track({
    required this.addedAt,
    required this.addedBy,
    required this.isLocal,
    required this.track,
  });
}

class TrackDetails {
  Album album;
  List<Artist> artists;
  List<String> availableMarkets;
  int discNumber;
  int durationMs;
  bool isExplicit;
  ExternalIds externalIds;
  ExternalURLs externalUrls;
  String href;
  String id;
  bool isPlayable;
  Object linkedFrom;
  Restrictions restrictions;
  String name;
  int popularity;
  String previewUrl;
  int trackNumber;
  String type;
  String uri;
  bool isLocal;

  TrackDetails({
    required this.album,
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.isExplicit,
    required this.externalIds,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isPlayable,
    required this.linkedFrom,
    required this.restrictions,
    required this.name,
    required this.popularity,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
    required this.isLocal,
  });
}
