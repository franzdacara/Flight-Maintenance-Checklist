import 'package:flutter/material.dart';

class PiperPA28Screen extends StatelessWidget {
  const PiperPA28Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piper PA-28 Cherokee'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Piper PA-28 Cherokee Details'),
      ),
    );
  }
}
