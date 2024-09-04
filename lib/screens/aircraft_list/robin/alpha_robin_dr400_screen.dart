import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildCommonAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.blueGrey[400],
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        GoRouter.of(context).go('/');
      },
    ),
  );
}

class AlphaRobinDR400Screen extends StatelessWidget {
  const AlphaRobinDR400Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(context, 'Alpha Robin DR400'),
      body: const Center(
        child: Text('Alpha Robin DR400 Details'),
      ),
    );
  }
}
