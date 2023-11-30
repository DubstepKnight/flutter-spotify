import 'package:flutter/material.dart';

class ListeningHistoryView extends StatelessWidget {
  const ListeningHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listening HIstory'),
      ),
      body: const Center(
        child: Text('Listening History'),
      ),
    );
  }
}
