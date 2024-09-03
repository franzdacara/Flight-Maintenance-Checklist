import 'package:flutter/material.dart';

class GrummanTigerScreen extends StatelessWidget {
  const GrummanTigerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grumman Tiger'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Grumman Tiger Details'),
      ),
    );
  }
}
