import 'package:flutter/material.dart';

import '/start_screen.dart';
import '/questions_screen.dart';
import '/data/questions.dart';
import '/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  Widget? _activeScreen;

  void _switchScreen() {
    setState(() {
      _activeScreen = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = ResultsScreen(
          chosenAnswers: _selectedAnswers,
          onRestart: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers.clear();
      _activeScreen = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    });
  }

  @override
  Widget build(context) {
    _activeScreen ??= StartScreen(_switchScreen);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _activeScreen,
        ),
      ),
    );
  }
}
