import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/followers.dart';
import 'package:flutter_spotify/src/common-domains/image.dart';
import 'package:flutter_spotify/src/common-domains/owner.dart';
import 'package:flutter_spotify/src/common-domains/tracks.dart';

class Playlist {
  bool collaborative;
  String description;
  ExternalURLs externalUrls;
  Followers followers;
  String href;
  String id;
  List<Image> images;
  String name;
  Owner owner;
  bool isPublic;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  Playlist({
    required this.collaborative,
    required this.description,
    required this.externalUrls,
    required this.followers,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.owner,
    required this.isPublic,
    required this.snapshotId,
    required this.tracks,
    required this.type,
    required this.uri,
  });
}
