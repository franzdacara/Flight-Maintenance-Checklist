import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiamondDA40Screen extends StatelessWidget {
  const DiamondDA40Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diamond DA40'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Diamond DA40 Details'),
      ),
    );
  }
}
