import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/followers.dart';

class AddedBy {
  ExternalURLs externalUrls;
  Followers followers;
  String href;
  String id;
  String type;
  String uri;

  AddedBy({
    required this.externalUrls,
    required this.followers,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });
}
