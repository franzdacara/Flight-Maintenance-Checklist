import 'package:flutter/material.dart';

class Cessna172Screen extends StatelessWidget {
  const Cessna172Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cessna 172'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Cessna 172 Details'),
      ),
    );
  }
}
