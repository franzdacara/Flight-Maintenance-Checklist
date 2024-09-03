import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GrummanTigerScreen extends StatelessWidget {
  const GrummanTigerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grumman Tiger'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Grumman Tiger Details'),
      ),
    );
  }
}
