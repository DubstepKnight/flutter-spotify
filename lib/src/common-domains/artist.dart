import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/followers.dart';
import 'package:flutter_spotify/src/common-domains/image.dart';

class Artist {
  ExternalURLs externalUrls;
  Followers followers;
  List<String> genres;
  String href;
  String id;
  List<Image> images;
  String name;
  int popularity;
  String type;
  String uri;

  Artist({
    required this.externalUrls,
    required this.followers,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
    required this.type,
    required this.uri,
  });
}
