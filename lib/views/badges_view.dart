// lib/views/badges_view.dart
import 'package:flutter/material.dart';
import '../models/badge_model.dart';
import '../widgets/badge_tile.dart';

class BadgesView extends StatelessWidget {
  BadgesView({Key? key}) : super(key: key);

  // Exemple de badges disponibles
  final List<BadgeModel> badges = [
    BadgeModel(
      id: 'badge1',
      name: 'Débutant',
      description: 'Complétez votre première leçon.',
      imageUrl: 'assets/images/badges/badge1.png',
    ),
    BadgeModel(
      id: 'badge2',
      name: 'Intermédiaire',
      description: 'Complétez 10 leçons.',
      imageUrl: 'assets/images/badges/badge2.png',
    ),
    BadgeModel(
      id: 'badge3',
      name: 'Expert',
      description: 'Complétez 50 leçons.',
      imageUrl: 'assets/images/badges/badge3.png',
    ),
    // Ajoute d'autres badges ici
  ];

  // Exemple de badges obtenus par l'utilisateur
  final List<String> earnedBadges = ['badge1'];

  @override
  Widget build(BuildContext context) {
    List<BadgeModel> availableBadges = badges;
    List<BadgeModel> userBadges = badges
        .where((badge) => earnedBadges.contains(badge.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Badges'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Badges Obtenus',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: userBadges.length,
                itemBuilder: (context, index) {
                  return BadgeTile(badge: userBadges[index]);
                },
              ),
            ),
            Divider(),
            Text(
              'Badges Disponibles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: availableBadges.length,
                itemBuilder: (context, index) {
                  BadgeModel badge = availableBadges[index];
                  bool isEarned = earnedBadges.contains(badge.id);
                  return ListTile(
                    leading: Image.network(
                      badge.imageUrl,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(badge.name),
                    subtitle: Text(badge.description),
                    trailing: isEarned
                        ? Icon(Icons.check, color: Colors.green)
                        : Icon(Icons.lock, color: Colors.grey),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
