// lib/views/lesson_view.dart
import 'package:flutter/material.dart';
import 'quiz_view.dart';

class LessonView extends StatefulWidget {
  final String lessonId;

  LessonView({required this.lessonId});

  @override
  _LessonViewState createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leçon ${widget.lessonId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Contenu de la Leçon ${widget.lessonId}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Ici, tu peux ajouter le contenu de la leçon, comme du texte, des images, des vidéos, etc.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Naviguer vers QuizView et attendre le résultat
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizView(lessonId: widget.lessonId),
                  ),
                );
                if (result != null && result is bool && result) {
                  setState(() {
                    isCompleted = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Leçon complétée! +50 points')),
                  );
                  Navigator.pop(context, true); // Retourner à HomeView avec leçon complétée
                }
              },
              child: Text('Passer au Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
