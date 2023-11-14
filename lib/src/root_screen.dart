import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key? key, required this.label, required this.detailsPath})
      : super(key: key);

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20.0,
              ), // You can customize the text style
            ),
            ElevatedButton(
              onPressed: () => context.go(detailsPath),
              child: const Text('Details'),
            ),
          ],
        ),
      ),
    );
  }
}
