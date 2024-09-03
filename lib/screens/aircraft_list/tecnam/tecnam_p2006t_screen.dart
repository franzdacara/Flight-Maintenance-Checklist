import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TecnamP2006TScreen extends StatelessWidget {
  const TecnamP2006TScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tecnam P2006T'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Tecnam P2006T Details'),
      ),
    );
  }
}
