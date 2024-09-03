import 'package:flutter/material.dart';

class BeechcraftBonanzaScreen extends StatelessWidget {
  const BeechcraftBonanzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beechcraft Bonanza'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Beechcraft Bonanza Details'),
      ),
    );
  }
}
