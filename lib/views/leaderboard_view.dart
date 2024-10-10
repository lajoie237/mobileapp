// lib/views/leaderboard_view.dart
import 'package:flutter/material.dart';
import '../models/leaderboard_entry.dart';
import '../widgets/leaderboard_tile.dart';

class LeaderboardView extends StatelessWidget {
  LeaderboardView({Key? key}) : super(key: key);

  // Exemple de données du leaderboard
  final List<LeaderboardEntry> leaderboard = [
    LeaderboardEntry(username: 'User1', points: 500),
    LeaderboardEntry(username: 'User2', points: 450),
    LeaderboardEntry(username: 'User3', points: 400),
    LeaderboardEntry(username: 'User4', points: 350),
    LeaderboardEntry(username: 'User5', points: 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          return LeaderboardTile(
            entry: leaderboard[index],
            rank: index + 1,
          );
        },
      ),
    );
  }
}
