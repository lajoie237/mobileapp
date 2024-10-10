// lib/widgets/badge_tile.dart
import 'package:flutter/material.dart';
import '../models/badge_model.dart';

class BadgeTile extends StatelessWidget {
  final BadgeModel badge;

  BadgeTile({required this.badge});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        badge.imageUrl,
        width: 50,
        height: 50,
      ),
      title: Text(badge.name),
      subtitle: Text(badge.description),
    );
  }
}
