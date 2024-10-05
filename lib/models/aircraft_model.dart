import 'package:flutter/material.dart';

class Aircraft {
  final String name;
  final bool isAvailable;
  final String route;
  final IconData? icon;

  Aircraft({
    required this.name,
    required this.isAvailable,
    required this.route,
    required this.icon,
  });
}
