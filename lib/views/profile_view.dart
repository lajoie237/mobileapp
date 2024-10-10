// lib/views/profile_view.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/user_model.dart';
import '../models/badge_model.dart';
import '../widgets/badge_tile.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  // Exemple de données utilisateur
  final UserModel user = UserModel(
    username: 'Utilisateur123',
    email: 'utilisateur@example.com',
    points: 250,
    level: 3,
    streak: 5,
    badges: ['badge1', 'badge2'],
  );

  // Exemple de badges disponibles
  final List<BadgeModel> availableBadges = [
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

  @override
  Widget build(BuildContext context) {
    List<BadgeModel> earnedBadges = availableBadges
        .where((badge) => user.badges.contains(badge.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.card_giftcard),
            onPressed: () {
              context.go('/home/badges');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 20),
            Text(
              user.username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              user.email,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            Text(
              'Statistiques de Progrès',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Points : ${user.points}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Niveau : ${user.level}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Streak : ${user.streak} jours',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: user.points / 100, // Exemple de progression pour le niveau
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            SizedBox(height: 30),
            Text(
              'Badges Obtenus',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: earnedBadges.length,
                itemBuilder: (context, index) {
                  return BadgeTile(badge: earnedBadges[index]);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Logique pour modifier le profil
                // Par exemple, naviguer vers une page de modification
              },
              child: Text('Modifier le Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
