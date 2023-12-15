import 'package:flutter/material.dart';

class ModalBottomMenu extends StatelessWidget {
  const ModalBottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
