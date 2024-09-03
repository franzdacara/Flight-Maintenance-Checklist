import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CirrusSR22Screen extends StatelessWidget {
  const CirrusSR22Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cirrus SR22'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Cirrus SR22 Details'),
      ),
    );
  }
}
