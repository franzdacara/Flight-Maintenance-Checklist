import 'package:flutter/material.dart';

class CirrusSR22Screen extends StatelessWidget {
  const CirrusSR22Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cirrus SR22'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Cirrus SR22 Details'),
      ),
    );
  }
}
