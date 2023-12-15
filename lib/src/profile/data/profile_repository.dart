import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/common-domains/external_urls.dart';
import 'package:flutter_spotify/src/common-domains/followers.dart';
import 'package:flutter_spotify/src/common-domains/image.dart';
import 'package:flutter_spotify/src/profile/domain/profile.dart';

final kTestProfiles = [
  Profile(
    id: '1',
    images: [
      const Image(
        url: 'https://i.scdn.co/image/ab6775700000ee85f1e9e4e0e5e0e0e5e0e0e0e5',
        height: 640,
        width: 640,
      ),
    ],
    displayName: 'Nursultan Akhmetzhanov',
    email: 'nursmaster@gmail.com',
    followers: const Followers(
      href: '',
      total: 5,
    ),
    externalURLs: const ExternalURLs(
      spotify: 'https://open.spotify.com/user/1111111111',
    ),
    href: 'https://api.spotify.com/v1/users/1111111111',
    product: 'premium',
    type: 'user',
    uri: 'spotify:user:1111111111',
  ),
  Profile(
    id: '2',
    images: [
      const Image(
        url: 'https://i.scdn.co/image/ab6775700000ee85f1e9e4e0e5e0e0e5e0e0e0e5',
        height: 640,
        width: 640,
      ),
    ],
    displayName: 'John Doe',
    email: 'nursmaster@gmail.com',
    followers: const Followers(
      href: '',
      total: 0,
    ),
    externalURLs: const ExternalURLs(
      spotify: 'https://open.spotify.com/user/222222',
    ),
    href: 'https://api.spotify.com/v1/users/2222222222',
    product: 'premium',
    type: 'user',
    uri: 'spotify:user:2222222222222',
  )
];

class ProfileRepository {
  final List<Profile> _profiles = kTestProfiles;

  List<Profile> getProductsList() {
    return _profiles;
  }

  Profile? getProfile(String id) {
    return _profiles.firstWhere((profile) => profile.id == id);
  }

  Future<Profile?> watchCurrentProfile() async {
    return _profiles[0];
  }

  Future<Profile> changeDisplayName(String displayName) async {
    final profile = _profiles[0];
    profile.displayName = displayName;
    return profile;
  }
}

final profileRepositoryProvider = Provider((_) => ProfileRepository());

final profileProvider = FutureProvider.autoDispose<Profile?>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.watchCurrentProfile();
});

// final authStateChangeProvider = StreamProvider.autoDispose<AppUser?>((ref) {
//   final authRepository = ref.watch(authRepositoryProvider);
//   return authRepository.authStateChanges();
// });
