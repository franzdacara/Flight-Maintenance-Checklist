import 'package:flutter/material.dart';

class MooneyM20Screen extends StatelessWidget {
  const MooneyM20Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mooney M20'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Mooney M20 Details'),
      ),
    );
  }
}
