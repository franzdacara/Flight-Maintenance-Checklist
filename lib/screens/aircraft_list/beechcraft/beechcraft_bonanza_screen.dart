import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BeechcraftBonanzaScreen extends StatelessWidget {
  const BeechcraftBonanzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beechcraft Bonanza'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Beechcraft Bonanza Details'),
      ),
    );
  }
}
