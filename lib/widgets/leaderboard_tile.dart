// lib/widgets/leaderboard_tile.dart
import 'package:flutter/material.dart';
import '../models/leaderboard_entry.dart';

class LeaderboardTile extends StatelessWidget {
  final LeaderboardEntry entry;
  final int rank;

  LeaderboardTile({required this.entry, required this.rank});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '#$rank',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      title: Text(entry.username),
      trailing: Text(
        '${entry.points} pts',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
