import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MooneyM20Screen extends StatelessWidget {
  const MooneyM20Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mooney M20'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Mooney M20 Details'),
      ),
    );
  }
}
