import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20.0,
          ), // You can customize the text style
        ),
      ),
    );
  }
}
