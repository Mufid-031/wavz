import 'package:flutter/material.dart';

class Genre {
  const Genre({
    required this.id,
    required this.name,
    required this.gradient,
    required this.icon,
  });

  final String id;
  final String name;
  final LinearGradient gradient;
  final IconData icon;
}
