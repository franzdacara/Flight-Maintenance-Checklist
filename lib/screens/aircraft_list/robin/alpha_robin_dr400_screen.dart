import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlphaRobinDR400Screen extends StatelessWidget {
  const AlphaRobinDR400Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alpha Robin DR400'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Alpha Robin DR400 Details'),
      ),
    );
  }
}
