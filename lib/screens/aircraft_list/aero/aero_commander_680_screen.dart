import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AeroCommander680Screen extends StatelessWidget {
  const AeroCommander680Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aero Commander 680'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Aero Commander 680 Details'),
      ),
    );
  }
}
