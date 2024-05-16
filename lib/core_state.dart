import 'package:flutter/material.dart';
import 'data/questions.dart';

class CoreState extends ChangeNotifier {
  final List<String> _selectedAnswers = [];
  var currentQuestionIndex = 0;

  List<String> get selectedAnswers => _selectedAnswers;

  void chooseAnswer(BuildContext context, String answer) {
    _selectedAnswers.add(answer);
    currentQuestionIndex++;

    if (_selectedAnswers.length == questions.length) {
      Navigator.of(context).pushReplacementNamed('/result');
    } else {
      notifyListeners();
    }
  }

  void restartQuiz(BuildContext context) {
    _selectedAnswers.clear();
    currentQuestionIndex = 0;
    Navigator.of(context).pushReplacementNamed('/quiz');
  }

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < _selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': _selectedAnswers[i]
        },
      );
    }
    return summary;
  }
}
