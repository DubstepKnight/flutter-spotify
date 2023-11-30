import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/followers.dart';

class Owner {
  ExternalURLs externalUrls;
  Followers followers;
  String href;
  String id;
  String type;
  String uri;
  String displayName;

  Owner({
    required this.externalUrls,
    required this.followers,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
    required this.displayName,
  });
}
