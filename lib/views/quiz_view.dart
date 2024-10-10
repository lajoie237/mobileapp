// lib/views/quiz_view.dart
import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}

class QuizView extends StatefulWidget {
  final String lessonId;

  QuizView({required this.lessonId});

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Quelle est la capitale du Cameroun?',
      options: ['Yaoundé', 'Douala', 'Garoua', 'Bamenda'],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: 'Combien de langues officielles au Cameroun?',
      options: ['1', '2', '3', '4'],
      correctOptionIndex: 1,
    ),
    // Ajoute d'autres questions ici
  ];

  int currentQuestionIndex = 0;
  int score = 0;
  bool quizCompleted = false;

  void answerQuestion(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctOptionIndex) {
      score += 10; // Exemple de points pour une bonne réponse
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bonne réponse! +10 points')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mauvaise réponse!')),
      );
    }

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex += 1;
      } else {
        quizCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz Terminé')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Terminé!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Votre score : $score / ${questions.length * 10}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true); // Retourner au HomeView
                },
                child: Text('Retour à l\'Accueil'),
              ),
            ],
          ),
        ),
      );
    }

    QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - Leçon ${widget.lessonId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...List.generate(currentQuestion.options.length, (index) {
              return ListTile(
                title: Text(currentQuestion.options[index]),
                leading: Radio<int>(
                  value: index,
                  groupValue: null,
                  onChanged: (value) {
                    answerQuestion(value!);
                  },
                ),
                onTap: () {
                  answerQuestion(index);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
