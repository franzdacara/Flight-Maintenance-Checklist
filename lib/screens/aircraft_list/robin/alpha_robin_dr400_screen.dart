import 'package:flutter/material.dart';

class AlphaRobinDR400Screen extends StatelessWidget {
  const AlphaRobinDR400Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alpha Robin DR400'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Alpha Robin DR400 Details'),
      ),
    );
  }
}
