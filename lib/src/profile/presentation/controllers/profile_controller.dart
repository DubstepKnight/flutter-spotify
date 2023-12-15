import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/profile/data/profile_repository.dart';
import 'package:flutter_spotify/src/profile/domain/profile.dart';
import 'package:flutter_spotify/src/profile/presentation/state/profile_state.dart';

class ProfileController extends AsyncNotifier<Profile?> with NameValidator {
  ProfileController();

  @override
  Future<Profile?> build() {
    final profileRepository = ref.watch(profileRepositoryProvider);
    return profileRepository.watchCurrentProfile();
  }

  Future<void> changeDisplayName(String displayName) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final profileRepository = ref.read(profileRepositoryProvider);
      await profileRepository.changeDisplayName(displayName);
      return build();
    });
  }
}

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, Profile?>(ProfileController.new);
