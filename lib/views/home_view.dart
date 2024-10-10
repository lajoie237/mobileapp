// lib/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/progress_model.dart';
import '../widgets/lesson_tile.dart';
import 'lesson_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Exemple de données utilisateur
  int userPoints = 250;
  int userLevel = 3;
  int userStreak = 5;

  final List<Progress> progressList = [
    Progress(lessonId: '1'),
    Progress(lessonId: '2'),
    Progress(lessonId: '3'),
    // Ajoute d'autres leçons ici
  ];

  int get completedLessons =>
      progressList.where((progress) => progress.isCompleted).length;

  double get progressPercentage =>
      (completedLessons / progressList.length) * 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              context.go('/profile');
            },
          ),
          IconButton(
            icon: Icon(Icons.leaderboard),
            onPressed: () {
              context.go('/home/leaderboard');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Points : $userPoints',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Niveau : $userLevel',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Streak : $userStreak jours',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: userPoints / 100, // Exemple de progression pour le niveau
            minHeight: 10,
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Text(
            'Progrès : ${progressPercentage.toStringAsFixed(1)}%',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: progressPercentage / 100,
            minHeight: 10,
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: progressList.length,
              itemBuilder: (context, index) {
                return LessonTile(
                  lessonId: progressList[index].lessonId,
                  isCompleted: progressList[index].isCompleted,
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LessonView(
                          lessonId: progressList[index].lessonId,
                        ),
                      ),
                    );
                    if (result != null && result is bool && result) {
                      setState(() {
                        progressList[index].isCompleted = result;
                        userPoints += 50; // Exemple de points ajoutés
                        // Tu peux également gérer les streaks ici
                      });
                    }
                  },
                  onCheckboxChanged: (value) {
                    setState(() {
                      progressList[index].isCompleted = value ?? false;
                      if (value == true) {
                        userPoints += 50; // Exemple de points ajoutés
                      } else {
                        userPoints -= 50; // Exemple de points retirés
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
