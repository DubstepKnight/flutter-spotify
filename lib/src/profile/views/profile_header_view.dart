import 'package:flutter/material.dart';

class ProfileHeaderView extends StatelessWidget {
  const ProfileHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Row(
              children: [
                Hero(
                  tag: 'profileImage',
                  child: Icon(
                    Icons.person_pin,
                    size: 120,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nursultan Akhmetzhanov",
                        overflow: TextOverflow.visible,
                        softWrap: true, // Add this line
                        style: TextStyle(
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
                                  "7",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Text(
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Icon(
                              Icons.circle,
                              size: 5,
                            ),
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                Text(
                                  "32",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  "following",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
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
                    onPressed: () => print("nice"),
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
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: const Row(
                                    children: [
                                      Icon(Icons.person_outline),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('Nursultan Akhmetzhanov')
                                    ],
                                  ),
                                  onTap: () {
                                    // Update the state of the app.
                                    // ...
                                  },
                                ),
                                const Divider(
                                  thickness: 1,
                                  // indent: 100,
                                  // endIndent: 100,
                                ),
                                ListTile(
                                  title: const Row(
                                    children: [
                                      Icon(Icons.person_add_outlined),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('Find friends')
                                    ],
                                  ),
                                  onTap: () {
                                    // Update the state of the app.
                                    // ...
                                  },
                                ),
                                ListTile(
                                  title: const Row(
                                    children: [
                                      Icon(Icons.share_outlined),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('Share')
                                    ],
                                  ),
                                  onTap: () {
                                    // Update the state of the app.
                                    // ...
                                  },
                                ),
                                ListTile(
                                  title: const Row(
                                    children: [
                                      Icon(Icons.remove_red_eye_outlined),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('Preview profile')
                                    ],
                                  ),
                                  onTap: () {
                                    // Update the state of the app.
                                    // ...
                                  },
                                ),
                                ListTile(
                                  title: const Row(
                                    children: [
                                      Icon(Icons.multitrack_audio_outlined),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('Show Spotify Code')
                                    ],
                                  ),
                                  onTap: () {
                                    // Update the state of the app.
                                    // ...
                                  },
                                ),
                              ],
                            ),
                          );
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
