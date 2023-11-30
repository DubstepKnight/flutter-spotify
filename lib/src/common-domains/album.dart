import 'package:flutter_spotify/src/common-domains/artist.dart';
import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/image.dart';
import 'package:flutter_spotify/src/common-domains/restrictions.dart';

class Album {
  String albumType;
  int totalTracks;
  List<String> availableMarkets;
  ExternalURLs externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  String releaseDate;
  String releaseDatePrecision;
  Restrictions restrictions;
  String type;
  String uri;
  List<Artist> artists;

  Album({
    required this.albumType,
    required this.totalTracks,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.restrictions,
    required this.type,
    required this.uri,
    required this.artists,
  });
}
