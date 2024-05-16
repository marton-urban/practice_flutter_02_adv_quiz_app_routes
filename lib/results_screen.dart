import 'package:adv_basics/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/data/questions.dart';
import '/questions_summary/questions_summary.dart';
import 'core_state.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = (context.read<CoreState>().summaryData)
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return MyScaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              const QuestionsSummary(),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () => context.read<CoreState>().restartQuiz(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
