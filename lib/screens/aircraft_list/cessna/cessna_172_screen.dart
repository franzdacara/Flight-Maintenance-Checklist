import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Cessna172Screen extends StatelessWidget {
  const Cessna172Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cessna 172'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Cessna 172 Details'),
      ),
    );
  }
}
