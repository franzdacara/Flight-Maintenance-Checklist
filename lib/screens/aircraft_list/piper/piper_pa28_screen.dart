import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PiperPA28Screen extends StatelessWidget {
  const PiperPA28Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piper PA-28 Cherokee'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Piper PA-28 Cherokee Details'),
      ),
    );
  }
}
