// lib/views/dashboard_view.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/badge_model.dart'; // Importer le modèle personnalisé

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemple de données statiques
    int points = 1200;
    int level = 5;
    List<Badge> badges = [
      Badge(
        id: 'badge1',
        name: 'Débutant',
        description: 'Terminé votre première leçon.',
        imagePath: 'assets/images/badges/badge1.png', // Assurez-vous que le chemin est correct
      ),
      Badge(
        id: 'badge2',
        name: 'Intermédiaire',
        description: 'Terminé 10 leçons.',
        imagePath: 'assets/images/badges/badge2.png',
      ),
      Badge(
        id: 'badge3',
        name: 'Avancé',
        description: 'Atteint le niveau 5.',
        imagePath: 'assets/images/badges/badge3.png',
      ),
      // Ajoute d'autres badges ici
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              context.go('/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Afficher les points et le niveau
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard('Points', points.toString(), Colors.orange),
                _buildStatCard('Niveau', level.toString(), Colors.blue),
              ],
            ),
            SizedBox(height: 20),
            // Afficher les badges
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Badges',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            // Liste des badges
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: badges.length,
                itemBuilder: (context, index) {
                  return _buildBadgeCard(badges[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: Container(
        width: 120,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeCard(Badge badge) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 120,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              badge.imagePath,
              width: 50,
              height: 50,
            ),
            SizedBox(height: 8),
            Text(
              badge.name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              badge.description,
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
