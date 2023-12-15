import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/followers.dart';
import 'package:flutter_spotify/src/common-domains/image.dart';

typedef ProfileID = String;

/// Class representing a profile.
class Profile {
  Profile({
    required this.id,
    required this.images,
    required this.displayName,
    required this.email,
    required this.followers,
    required this.externalURLs,
    required this.href,
    required this.product,
    required this.type,
    required this.uri,
  });

  /// Unique product id
  final ProfileID id;
  final List<Image> images;
  String displayName;
  final String email;
  final Followers followers;
  final ExternalURLs externalURLs;
  final String href;
  final String product;
  final String type;
  final String uri;

  set name(String name) => displayName = name;
}
