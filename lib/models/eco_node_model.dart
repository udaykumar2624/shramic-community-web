import 'package:flutter/material.dart';

class EcoNodeModel {
  final String id;
  final String emoji;
  final String label;
  final String description;
  final List<String> connections;
  final Color color;
  final double x; // 0.0 to 1.0 (relative position)
  final double y; // 0.0 to 1.0 (relative position)
  final double size;

  const EcoNodeModel({
    required this.id,
    required this.emoji,
    required this.label,
    required this.description,
    required this.connections,
    required this.color,
    required this.x,
    required this.y,
    required this.size,
  });
}
