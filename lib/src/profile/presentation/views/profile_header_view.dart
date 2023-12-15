import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/profile/domain/profile.dart';
import 'package:flutter_spotify/src/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_spotify/src/profile/presentation/views/modal_bottom_menu.dart';
import 'package:flutter_spotify/src/profile/presentation/views/profile_edit_view.dart';

class ProfileHeaderView extends ConsumerWidget {
  const ProfileHeaderView({
    super.key,
    required this.profile,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileController = ref.watch(profileControllerProvider.notifier);

    return Container(
      padding: const EdgeInsets.only(top: 32.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 106, 106, 106), Colors.black],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                ),
                const SizedBox(width: 16.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.displayName,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Row(
                              children: [
                                Text(
                                  profile.followers.total.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                const Text(
                                  "followers",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      elevation: MaterialStateProperty.all(0),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () async {
                      final newName = await showModalBottomSheet<String?>(
                        context: context,
                        builder: (BuildContext context) {
                          return ProfileEditView(
                            profile: profile,
                          );
                        },
                      );
                      if (newName != null) {
                        profileController.changeDisplayName(newName);
                      }
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const ModalBottomMenu();
                        },
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
